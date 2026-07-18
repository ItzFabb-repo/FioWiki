$files = Get-ChildItem docs\plugin\fiochat\modules\*.mdx | Where-Object { $_.Name -notin @('index.mdx','advancement-message.mdx') }

function Parse-ScalarRows($yaml){
  $rows = New-Object System.Collections.Generic.List[string]
  $stack = New-Object System.Collections.Generic.List[string]
  foreach($ln in ($yaml -split "`n")){
    $line = $ln.TrimEnd("`r")
    $trim = $line.Trim()
    if($trim -eq '' -or $trim.StartsWith('#')){ continue }
    $indent = $line.Length - $line.TrimStart().Length
    $lvl = [int]($indent/2)
    while($stack.Count -gt $lvl){ $stack.RemoveAt($stack.Count-1) }
    if($trim -match '^-\s'){ continue }
    if($trim -match '^([^:]+):\s*(.*)$'){
      $k = $Matches[1].Trim(); $v = $Matches[2].Trim()
      if($v -eq ''){ if($stack.Count -eq $lvl){ [void]$stack.Add($k) } elseif($stack.Count -gt $lvl){ $stack[$lvl]=$k }; continue }
      $prefix=@(); if($lvl -gt 0 -and $stack.Count -ge $lvl){ $prefix = $stack[0..($lvl-1)] }
      $path = ((@($prefix)+$k) -join '.').Trim('.')
      if($path -eq ''){ continue }
      if($v -match '^(true|false)$'){ $opt='true/false' }
      elseif($v -match '^\[\]$'){ $opt='list (empty allowed)' }
      elseif($v -match '^-?[0-9]+(\.[0-9]+)?$'){ $opt='number' }
      elseif($v -match '^".*"$'){ $opt='string' }
      else { $opt='module-specific value' }
      $rows.Add("- `$path`: $opt. Default: `$v`.")
    }
  }
  return ($rows | Select-Object -Unique)
}

foreach($f in $files){
  $raw = Get-Content $f.FullName -Raw
  $fm = [regex]::Match($raw,'(?s)^---\s*\n(.*?)\n---\s*\n')
  if(-not $fm.Success){ continue }
  $front = $fm.Value
  $frontBody = $fm.Groups[1].Value
  $tm = [regex]::Match($frontBody,'(?m)^title:\s*(.+)$')
  $title = if($tm.Success){ $tm.Groups[1].Value.Trim() } else { [IO.Path]::GetFileNameWithoutExtension($f.Name) }

  $cfgFiles = New-Object System.Collections.Generic.List[string]
  $mCfg = [regex]::Match($raw,'(?s)## Configuration Files\s*(.*?)\n\n## ')
  if($mCfg.Success){
    foreach($ln in ($mCfg.Groups[1].Value -split "`n")){
      $t = $ln.Trim().Trim("`r")
      if($t.StartsWith('- ')){
        $c = $t.Substring(2).Trim().Trim('`')
        if($c -ne ''){ [void]$cfgFiles.Add($c) }
      }
    }
  }

  $sections = [regex]::Matches($raw,'(?s)## File:\s*(.*?)\n\n.*?```yaml\s*(.*?)\s*```')
  if($sections.Count -eq 0){ continue }
  if($cfgFiles.Count -eq 0){ foreach($s in $sections){ [void]$cfgFiles.Add($s.Groups[1].Value.Trim()) } }

  $out = New-Object System.Text.StringBuilder
  [void]$out.AppendLine('# ' + $title + ' (Module)')
  [void]$out.AppendLine('Clean and practical configuration guide for server owners.')
  [void]$out.AppendLine('')
  [void]$out.AppendLine(':::info[Go-To]')
  [void]$out.AppendLine('- Return to module directory: [Modules Index](./)')
  [void]$out.AppendLine(':::')
  [void]$out.AppendLine('')
  [void]$out.AppendLine('## Configuration Files')
  foreach($c in $cfgFiles){ [void]$out.AppendLine('- ' + $c) }
  [void]$out.AppendLine('')

  foreach($s in $sections){
    $fileName = $s.Groups[1].Value.Trim()
    $yaml = $s.Groups[2].Value.Trim()
    [void]$out.AppendLine('## File: ' + $fileName)
    [void]$out.AppendLine('')
    [void]$out.AppendLine('### Option Breakdown')
    $rows = Parse-ScalarRows $yaml
    if($rows.Count -eq 0){
      [void]$out.AppendLine('- Keep YAML structure and edit only keys you need.')
    } else {
      foreach($r in $rows){ [void]$out.AppendLine($r) }
    }
    [void]$out.AppendLine('')
    [void]$out.AppendLine('### YAML Baseline')
    [void]$out.AppendLine('```yaml')
    $prevBlank=$false
    foreach($ln in ($yaml -split "`n")){
      $line = $ln.TrimEnd("`r")
      $trim = $line.Trim()
      if($trim.StartsWith('#')){ continue }
      if($trim -eq ''){ if($prevBlank){ continue }; $prevBlank=$true; [void]$out.AppendLine(''); continue }
      $prevBlank=$false
      [void]$out.AppendLine($line)
    }
    [void]$out.AppendLine('```')
    [void]$out.AppendLine('')
  }

  [void]$out.AppendLine(':::warning[Owner Validation]')
  [void]$out.AppendLine('- Reload safely after edits.')
  [void]$out.AppendLine('- Validate in-game behavior with user and staff account.')
  [void]$out.AppendLine(':::')

  $newText = $front + "`r`n" + $out.ToString().Trim() + "`r`n"
  Set-Content $f.FullName $newText -Encoding UTF8
}
Write-Output 'rewritten modules clean'
