$files = Get-ChildItem docs\plugin\fiochat\modules\*.mdx | Where-Object { $_.Name -ne 'index.mdx' }

function TopKeys($yaml){
  $out = New-Object System.Collections.Generic.List[string]
  foreach($ln in ($yaml -split "`n")){
    $line = $ln.TrimEnd("`r")
    if($line -match '^([A-Za-z0-9_\-]+):\s*$'){
      $k=$Matches[1]
      if(-not $out.Contains($k)){ [void]$out.Add($k) }
    }
  }
  return $out
}

foreach($f in $files){
  $raw = Get-Content $f.FullName -Raw
  $fm = [regex]::Match($raw,'(?s)^---\s*\n(.*?)\n---\s*\n')
  if(-not $fm.Success){ continue }
  $front = $fm.Value
  $frontBody = $fm.Groups[1].Value
  $tm = [regex]::Match($frontBody,'(?m)^title:\s*(.+)$')
  $title = if($tm.Success){ $tm.Groups[1].Value.Trim() } else { [IO.Path]::GetFileNameWithoutExtension($f.Name) }

  $cfg = New-Object System.Collections.Generic.List[string]
  $mCfg = [regex]::Match($raw,'(?s)## Configuration Files\s*(.*?)\n\n## ')
  if($mCfg.Success){
    foreach($ln in ($mCfg.Groups[1].Value -split "`n")){
      $t=$ln.Trim().Trim("`r")
      if($t.StartsWith('- ')){ [void]$cfg.Add($t.Substring(2).Trim().Trim('`')) }
    }
  }

  $sections = [regex]::Matches($raw,'(?s)## File:\s*(.*?)\n\n.*?```yaml\s*(.*?)\s*```')
  if($sections.Count -eq 0){ continue }
  if($cfg.Count -eq 0){ foreach($s in $sections){ [void]$cfg.Add($s.Groups[1].Value.Trim()) } }

  $sb = New-Object System.Text.StringBuilder
  [void]$sb.AppendLine('# ' + $title + ' (Module)')
  [void]$sb.AppendLine('Professional and clean configuration reference for server owners.')
  [void]$sb.AppendLine('')
  [void]$sb.AppendLine(':::info[Go-To]')
  [void]$sb.AppendLine('- Return to module directory: [Modules Index](./)')
  [void]$sb.AppendLine('- Edit this module YAML first, then test in-game.')
  [void]$sb.AppendLine(':::')
  [void]$sb.AppendLine('')
  [void]$sb.AppendLine('## Configuration Files')
  foreach($c in $cfg){ [void]$sb.AppendLine('- ' + $c) }
  [void]$sb.AppendLine('')

  foreach($s in $sections){
    $fileName = $s.Groups[1].Value.Trim()
    $yaml = $s.Groups[2].Value.Trim()
    [void]$sb.AppendLine('## File: ' + $fileName)
    [void]$sb.AppendLine('')
    [void]$sb.AppendLine('### What This File Controls')
    [void]$sb.AppendLine('- Core behavior, output formatting, and module-specific runtime options.')
    [void]$sb.AppendLine('- Change one option group at a time, then reload and validate.')
    [void]$sb.AppendLine('')

    $tops = TopKeys $yaml
    if($tops.Count -gt 0){
      [void]$sb.AppendLine('### Main Option Groups')
      foreach($k in $tops){ [void]$sb.AppendLine('- ' + $k) }
      [void]$sb.AppendLine('')
    }

    [void]$sb.AppendLine('### YAML Baseline')
    [void]$sb.AppendLine('```yaml')

    $prevBlank=$false
    foreach($ln in ($yaml -split "`n")){
      $line = $ln.TrimEnd("`r")
      $trim = $line.Trim()
      if($trim.StartsWith('#')){ continue }
      if($trim -eq ''){
        if($prevBlank){ continue }
        $prevBlank=$true
        [void]$sb.AppendLine('')
      } else {
        $prevBlank=$false
        [void]$sb.AppendLine($line)
      }
    }

    [void]$sb.AppendLine('```')
    [void]$sb.AppendLine('')
  }

  [void]$sb.AppendLine(':::warning[Owner Validation]')
  [void]$sb.AppendLine('- Confirm syntax and indentation.')
  [void]$sb.AppendLine('- Reload safely.')
  [void]$sb.AppendLine('- Test with normal player and staff account.')
  [void]$sb.AppendLine(':::')

  $newText = $front + "`r`n" + $sb.ToString().Trim() + "`r`n"
  try { Set-Content $f.FullName $newText -Encoding UTF8 } catch {}
}
Write-Output 'ok'
