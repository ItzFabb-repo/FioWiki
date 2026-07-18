$files = Get-ChildItem docs\plugin\fiochat\modules\*.mdx | Where-Object { $_.Name -ne 'index.mdx' }

function Get-TopBlocks($yaml){
  $lines = $yaml -split "`r?`n"
  $items = New-Object System.Collections.Generic.List[string]
  foreach($ln in $lines){
    if($ln -match '^([A-Za-z0-9_\-]+):\s*$'){
      $k=$Matches[1]
      if(-not $items.Contains($k)){ [void]$items.Add($k) }
    }
  }
  return $items
}

foreach($f in $files){
  $raw = Get-Content $f.FullName -Raw
  $fm = [regex]::Match($raw,'(?s)^---\s*\n(.*?)\n---\s*\n')
  if(-not $fm.Success){ continue }
  $front = $fm.Value
  $frontBody = $fm.Groups[1].Value

  $title=''
  $tm=[regex]::Match($frontBody,'(?m)^title:\s*(.+)$')
  if($tm.Success){ $title=$tm.Groups[1].Value.Trim() }
  if([string]::IsNullOrWhiteSpace($title)){ $title=[IO.Path]::GetFileNameWithoutExtension($f.Name) }

  $cfgFiles = New-Object System.Collections.Generic.List[string]
  $mCfg=[regex]::Match($raw,'(?s)## Configuration Files\s*(.*?)\n\n## ')
  if($mCfg.Success){
    foreach($ln in ($mCfg.Groups[1].Value -split "`r?`n")){
      $t=$ln.Trim()
      if($t.StartsWith('- ')){
        $cfg=$t.Substring(2).Trim().Trim('`')
        if(-not [string]::IsNullOrWhiteSpace($cfg)){ [void]$cfgFiles.Add($cfg) }
      }
    }
  }

  $sections=[regex]::Matches($raw,'(?s)## File:\s*(.*?)\n\n.*?```yaml\s*(.*?)\s*```')
  if($sections.Count -eq 0){ continue }

  if($cfgFiles.Count -eq 0){
    foreach($s in $sections){ [void]$cfgFiles.Add($s.Groups[1].Value.Trim()) }
  }

  $sb = New-Object System.Text.StringBuilder
  [void]$sb.AppendLine("# $title (Module)")
  [void]$sb.AppendLine('Professional and clean configuration reference for server owners.')
  [void]$sb.AppendLine('')
  [void]$sb.AppendLine(':::info[Go-To]')
  [void]$sb.AppendLine('- Return to module directory: [Modules Index](./)')
  [void]$sb.AppendLine('- Edit this module YAML first, then test in-game.')
  [void]$sb.AppendLine(':::')
  [void]$sb.AppendLine('')
  [void]$sb.AppendLine('## Configuration Files')
  foreach($c in $cfgFiles){ [void]$sb.AppendLine("- `$c`") }
  [void]$sb.AppendLine('')

  foreach($s in $sections){
    $cfg = $s.Groups[1].Value.Trim()
    $yaml = $s.Groups[2].Value.Trim("`r","`n")

    [void]$sb.AppendLine("## File: `$cfg`")
    [void]$sb.AppendLine('')
    [void]$sb.AppendLine('### What This File Controls')
    [void]$sb.AppendLine('- Core behavior, output formatting, and module-specific runtime options.')
    [void]$sb.AppendLine('- Keep edits incremental: change one key group, reload, then validate.')
    [void]$sb.AppendLine('')

    $tops = Get-TopBlocks $yaml
    if($tops.Count -gt 0){
      [void]$sb.AppendLine('### Main Option Groups')
      foreach($k in $tops){ [void]$sb.AppendLine("- `$k`") }
      [void]$sb.AppendLine('')
    }

    [void]$sb.AppendLine('### YAML Baseline')
    [void]$sb.AppendLine('```yaml')

    $prevBlank=$false
    foreach($ln in ($yaml -split "`r?`n")){
      $t=$ln.Trim()
      if($t.StartsWith('#')){ continue }
      if($t -eq ''){
        if($prevBlank){ continue }
        $prevBlank=$true
        [void]$sb.AppendLine('')
      } else {
        $prevBlank=$false
        [void]$sb.AppendLine($ln)
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
  Set-Content $f.FullName $newText -Encoding UTF8
}
Write-Output 'rewritten clean'
