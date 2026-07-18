$files = Get-ChildItem docs\plugin\fiochat\modules\*.mdx | Where-Object { $_.Name -notin @('index.mdx','advancement-message.mdx') }

function GetRows($yaml){
  $rows = New-Object System.Collections.Generic.List[string]
  $stack = New-Object System.Collections.Generic.List[string]
  foreach($ln in ($yaml -split "`n")){
    $line = $ln.TrimEnd("`r")
    $trim = $line.Trim()
    if($trim -eq '' -or $trim.StartsWith('#')){ continue }
    $indent = $line.Length - $line.TrimStart().Length
    $lvl=[int]($indent/2)
    while($stack.Count -gt $lvl){ $stack.RemoveAt($stack.Count-1) }
    if($trim -match '^-\s'){ continue }
    if($trim -match '^([^:]+):\s*(.*)$'){
      $k=$Matches[1].Trim(); $v=$Matches[2].Trim()
      if($v -eq ''){ if($stack.Count -eq $lvl){ [void]$stack.Add($k) } elseif($stack.Count -gt $lvl){ $stack[$lvl]=$k }; continue }
      $prefix=@(); if($lvl -gt 0 -and $stack.Count -ge $lvl){ $prefix=$stack[0..($lvl-1)] }
      $path=((@($prefix)+$k)-join '.').Trim('.')
      if($path -eq ''){ continue }
      if($v -match '^(true|false)$'){ $type='boolean (true/false)' }
      elseif($v -eq '[]'){ $type='list (empty allowed)' }
      elseif($v -match '^-?[0-9]+(\.[0-9]+)?$'){ $type='number' }
      elseif($v -match '^".*"$'){ $type='string' }
      else { $type='module-specific' }
      $rows.Add('- ' + $path + ': ' + $type + ' | default: ' + $v)
    }
  }
  return ($rows | Select-Object -Unique)
}

foreach($f in $files){
  $raw = Get-Content $f.FullName -Raw
  $fm=[regex]::Match($raw,'(?s)^---\s*\n(.*?)\n---\s*\n')
  if(-not $fm.Success){ continue }
  $front=$fm.Value
  $frontBody=$fm.Groups[1].Value
  $tm=[regex]::Match($frontBody,'(?m)^title:\s*(.+)$')
  $title=if($tm.Success){$tm.Groups[1].Value.Trim()}else{[IO.Path]::GetFileNameWithoutExtension($f.Name)}

  $all=[regex]::Matches($raw,'(?s)## File:\s*(.*?)\n\n.*?```yaml\s*(.*?)\s*```')
  if($all.Count -eq 0){ continue }

  $map=@{}
  foreach($m in $all){
    $name=$m.Groups[1].Value.Trim()
    $yaml=$m.Groups[2].Value.Trim()
    if(-not $map.ContainsKey($name) -or $yaml.Length -gt $map[$name].Length){ $map[$name]=$yaml }
  }

  $sb=New-Object System.Text.StringBuilder
  [void]$sb.AppendLine('# ' + $title + ' (Module)')
  [void]$sb.AppendLine('Clean and practical configuration guide for server owners.')
  [void]$sb.AppendLine('')
  [void]$sb.AppendLine(':::info[Go-To]')
  [void]$sb.AppendLine('- Return to module directory: [Modules Index](./)')
  [void]$sb.AppendLine(':::')
  [void]$sb.AppendLine('')
  [void]$sb.AppendLine('## Configuration Files')
  foreach($k in $map.Keys){ [void]$sb.AppendLine('- ' + $k) }
  [void]$sb.AppendLine('')

  foreach($k in $map.Keys){
    $yaml=$map[$k]
    [void]$sb.AppendLine('## File: ' + $k)
    [void]$sb.AppendLine('')
    [void]$sb.AppendLine('### Option Breakdown')
    $rows=GetRows $yaml
    if($rows.Count -eq 0){ [void]$sb.AppendLine('- Keep YAML structure and edit only needed keys.') }
    else {
      $i=0
      foreach($r in $rows){ [void]$sb.AppendLine($r); $i++; if($i -ge 40){ break } }
    }
    [void]$sb.AppendLine('')
    [void]$sb.AppendLine('### YAML Baseline')
    [void]$sb.AppendLine('```yaml')
    $prevBlank=$false
    foreach($ln in ($yaml -split "`n")){
      $line=$ln.TrimEnd("`r")
      $trim=$line.Trim()
      if($trim.StartsWith('#')){ continue }
      if($trim -eq ''){ if($prevBlank){ continue }; $prevBlank=$true; [void]$sb.AppendLine(''); continue }
      $prevBlank=$false
      [void]$sb.AppendLine($line)
    }
    [void]$sb.AppendLine('```')
    [void]$sb.AppendLine('')
  }

  [void]$sb.AppendLine(':::warning[Owner Validation]')
  [void]$sb.AppendLine('- Reload safely after edits.')
  [void]$sb.AppendLine('- Validate module behavior in-game.')
  [void]$sb.AppendLine(':::')

  $newText=$front+"`r`n"+$sb.ToString().Trim()+"`r`n"
  Set-Content $f.FullName $newText -Encoding UTF8
}
Write-Output 'rebuilt clean unique'
