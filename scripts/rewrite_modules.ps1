$files = Get-ChildItem docs\plugin\fiochat\modules\*.mdx | Where-Object { $_.Name -ne 'index.mdx' }

function Get-KeyDesc($path){
  $k = $path.ToLower()
  if($k -match 'enabled|enable|disabled'){ return 'Toggles this feature on or off.' }
  if($k -match 'cooldown|interval|timeout|delay|seconds|ticks|time'){ return 'Controls timing behavior for this feature.' }
  if($k -match 'world|region|blacklist|whitelist'){ return 'Scopes where this feature is allowed or blocked.' }
  if($k -match 'message|format|title|subtitle|hover|lore|display|prefix|suffix|text|lines|name'){ return 'Controls user-facing text/render output.' }
  if($k -match 'sound|volume|pitch'){ return 'Controls sound playback behavior.' }
  if($k -match 'permission|permissions|node'){ return 'Controls permission node mapping/access control.' }
  if($k -match 'material|slot|rows|gui|icon|texture'){ return 'Controls GUI layout or visual item mapping.' }
  if($k -match 'command|commands|action'){ return 'Controls command/action behavior executed by the module.' }
  if($k -match 'mode|type|style|color'){ return 'Controls operation/display mode selection.' }
  if($k -match 'progress|threshold|limit|max|min'){ return 'Controls numeric bounds and thresholds.' }
  return 'Controls this module setting.'
}

function Infer-Type($v){
  $t = $v.Trim()
  if($t -match '^(true|false)$'){ return 'Allowed: `true` or `false`.' }
  if($t -eq '[]'){ return 'Allowed: list values (`[]` for empty).' }
  if($t -match '^\[.*\]$'){ return 'Allowed: inline list values.' }
  if($t -match '^-?[0-9]+$'){ return 'Allowed: integer value.' }
  if($t -match '^-?[0-9]+\.[0-9]+$'){ return 'Allowed: decimal value.' }
  if($t -match '^".*"$'){ return 'Allowed: string value.' }
  if($t -match '^\{.*\}$'){ return 'Allowed: object/map value.' }
  return 'Allowed: module-specific value.'
}

foreach($f in $files){
  $raw = Get-Content $f.FullName -Raw
  $fm = [regex]::Match($raw, '(?s)^---\s*\n(.*?)\n---\s*\n')
  if(-not $fm.Success){ continue }

  $front = $fm.Value
  $frontBody = $fm.Groups[1].Value

  $title = ''
  $tm = [regex]::Match($frontBody, '(?m)^title:\s*(.+)$')
  if($tm.Success){ $title = $tm.Groups[1].Value.Trim() }
  if([string]::IsNullOrWhiteSpace($title)){ $title = [IO.Path]::GetFileNameWithoutExtension($f.Name) }

  $cfgFiles = New-Object System.Collections.Generic.List[string]
  $mCfg = [regex]::Match($raw,'(?s)## Configuration Files\s*(.*?)\n\n## ')
  if($mCfg.Success){
    $part = $mCfg.Groups[1].Value
    foreach($ln in ($part -split "`r?`n")){
      $t = $ln.Trim()
      if($t.StartsWith('- ')){
        $cfg = $t.Substring(2).Trim().Trim('`')
        if(-not [string]::IsNullOrWhiteSpace($cfg)){ [void]$cfgFiles.Add($cfg) }
      }
    }
  }

  $fileSections = [regex]::Matches($raw,'(?s)## File:\s*(.*?)\n\n.*?```yaml\s*(.*?)\s*```')
  if($fileSections.Count -eq 0){ continue }

  $bodyOut = New-Object System.Text.StringBuilder
  [void]$bodyOut.AppendLine("# $title (Module)")
  [void]$bodyOut.AppendLine('Professional, owner-focused configuration reference with concise key-by-key guidance.')
  [void]$bodyOut.AppendLine()
  [void]$bodyOut.AppendLine(':::info[Go-To]')
  [void]$bodyOut.AppendLine('- Return to module directory: [Modules Index](./)')
  [void]$bodyOut.AppendLine(':::')
  [void]$bodyOut.AppendLine()
  [void]$bodyOut.AppendLine('## Configuration Files')
  if($cfgFiles.Count -gt 0){
    foreach($c in $cfgFiles){ [void]$bodyOut.AppendLine("- ``$c``") }
  } else {
    foreach($sec in $fileSections){
      $cf = $sec.Groups[1].Value.Trim()
      [void]$bodyOut.AppendLine("- ``$cf``")
    }
  }
  [void]$bodyOut.AppendLine()

  foreach($sec in $fileSections){
    $cfg = $sec.Groups[1].Value.Trim()
    $yaml = $sec.Groups[2].Value

    [void]$bodyOut.AppendLine("## File: ``$cfg``")
    [void]$bodyOut.AppendLine()
    [void]$bodyOut.AppendLine('### Key-by-Key Options')

    $lines = $yaml -split "`r?`n"
    $stack = New-Object System.Collections.Generic.List[string]
    $rows = New-Object System.Collections.Generic.HashSet[string]

    foreach($ln in $lines){
      $trim = $ln.Trim()
      if([string]::IsNullOrWhiteSpace($trim)){ continue }
      if($trim.StartsWith('#')){ continue }
      $indent = $ln.Length - $ln.TrimStart().Length
      $lvl = [int]($indent/2)
      while($stack.Count -gt $lvl){ $stack.RemoveAt($stack.Count-1) }
      if($trim -match '^-\s'){ continue }

      if($trim -match '^([^:]+):\s*(.*)$'){
        $k = $Matches[1].Trim()
        $v = $Matches[2].Trim()

        if($v -eq ''){
          if($stack.Count -eq $lvl){ [void]$stack.Add($k) }
          elseif($stack.Count -gt $lvl){ $stack[$lvl] = $k }
          else { [void]$stack.Add($k) }
          continue
        }

        $prefix = @()
        if($lvl -gt 0 -and $stack.Count -ge $lvl){ $prefix = $stack[0..($lvl-1)] }
        $path = ((@($prefix) + $k) -join '.').Trim('.')
        if([string]::IsNullOrWhiteSpace($path)){ continue }

        $desc = Get-KeyDesc $path
        $allowed = Infer-Type $v
        $rec = "Recommended baseline: ``$v``."
        $line = "- ``$path`` - $desc $allowed $rec"
        [void]$rows.Add($line)
      }
    }

    if($rows.Count -eq 0){
      [void]$bodyOut.AppendLine('- No scalar keys detected in this YAML block. Keep baseline values and edit only needed nodes.')
    } else {
      foreach($r in $rows){ [void]$bodyOut.AppendLine($r) }
    }

    [void]$bodyOut.AppendLine()
    [void]$bodyOut.AppendLine('### YAML Baseline')
    [void]$bodyOut.AppendLine('```yaml')

    $cleanLines = New-Object System.Collections.Generic.List[string]
    $prevBlank = $false
    foreach($yl in $lines){
      $t = $yl.Trim()
      if($t.StartsWith('#')){ continue }
      if($t -eq ''){
        if($prevBlank){ continue }
        $prevBlank = $true
        [void]$cleanLines.Add('')
        continue
      }
      $prevBlank = $false
      [void]$cleanLines.Add($yl)
    }

    foreach($cl in $cleanLines){ [void]$bodyOut.AppendLine($cl) }
    [void]$bodyOut.AppendLine('```')
    [void]$bodyOut.AppendLine()
  }

  [void]$bodyOut.AppendLine(':::warning[Owner Validation]')
  [void]$bodyOut.AppendLine('- Reload safely after edits.')
  [void]$bodyOut.AppendLine('- Validate commands/placeholders related to this module.')
  [void]$bodyOut.AppendLine('- Test with user and staff roles.')
  [void]$bodyOut.AppendLine(':::')

  $newText = $front + "`r`n" + $bodyOut.ToString().Trim() + "`r`n"
  Set-Content $f.FullName $newText -Encoding UTF8
}

Write-Output 'ok'
