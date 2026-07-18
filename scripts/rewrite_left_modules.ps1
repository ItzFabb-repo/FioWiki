$targets = @(
'advancement-message.mdx','announcements.mdx','custom-font.mdx','day-counter.mdx','death-message.mdx','display-tag.mdx','emojis.mdx','formats.mdx','giveaway.mdx','redeem-code.mdx','replying-message.mdx','reports.mdx','server-motd.mdx','vanish.mdx','welcome-screen.mdx'
)

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
  return 'Allowed: module-specific value.'
}

foreach($name in $targets){
  $path = Join-Path 'docs\plugin\fiochat\modules' $name
  if(-not (Test-Path $path)){ continue }
  $raw = Get-Content $path -Raw
  $fm = [regex]::Match($raw, '(?s)^---\s*\n(.*?)\n---\s*\n')
  if(-not $fm.Success){ continue }
  $front = $fm.Value
  $frontBody = $fm.Groups[1].Value
  $title = ([regex]::Match($frontBody,'(?m)^title:\s*(.+)$').Groups[1].Value).Trim()
  if([string]::IsNullOrWhiteSpace($title)){ $title = [IO.Path]::GetFileNameWithoutExtension($name) }

  $cfgFiles = New-Object System.Collections.Generic.List[string]
  $mCfg = [regex]::Match($raw,'(?s)## Configuration Files\s*(.*?)\n\n## ')
  if($mCfg.Success){
    foreach($ln in ($mCfg.Groups[1].Value -split "`r?`n")){
      $t=$ln.Trim(); if($t.StartsWith('- ')){ [void]$cfgFiles.Add($t.Substring(2).Trim().Trim('`')) }
    }
  }

  $fileSections = [regex]::Matches($raw,'(?s)## File:\s*(.*?)\n\n.*?```yaml\s*(.*?)\s*```')
  if($fileSections.Count -eq 0){ continue }

  $sb = New-Object System.Text.StringBuilder
  [void]$sb.AppendLine("# $title (Module)")
  [void]$sb.AppendLine('Professional, owner-focused configuration reference with concise key-by-key guidance.')
  [void]$sb.AppendLine()
  [void]$sb.AppendLine(':::info[Go-To]')
  [void]$sb.AppendLine('- Return to module directory: [Modules Index](./)')
  [void]$sb.AppendLine(':::')
  [void]$sb.AppendLine()
  [void]$sb.AppendLine('## Configuration Files')
  if($cfgFiles.Count -gt 0){ foreach($c in $cfgFiles){ [void]$sb.AppendLine("- `$c`") } }
  [void]$sb.AppendLine()

  foreach($sec in $fileSections){
    $cfg=$sec.Groups[1].Value.Trim(); $yaml=$sec.Groups[2].Value
    [void]$sb.AppendLine("## File: `$cfg`")
    [void]$sb.AppendLine()
    [void]$sb.AppendLine('### Key-by-Key Options')

    $lines=$yaml -split "`r?`n"
    $stack=New-Object System.Collections.Generic.List[string]
    $rows=New-Object System.Collections.Generic.HashSet[string]
    foreach($ln in $lines){
      $trim=$ln.Trim(); if($trim -eq '' -or $trim.StartsWith('#')){ continue }
      $indent=$ln.Length-$ln.TrimStart().Length; $lvl=[int]($indent/2)
      while($stack.Count -gt $lvl){ $stack.RemoveAt($stack.Count-1) }
      if($trim -match '^-\s'){ continue }
      if($trim -match '^([^:]+):\s*(.*)$'){
        $k=$Matches[1].Trim(); $v=$Matches[2].Trim()
        if($v -eq ''){ if($stack.Count -eq $lvl){ [void]$stack.Add($k) } elseif($stack.Count -gt $lvl){ $stack[$lvl]=$k }; continue }
        $prefix=@(); if($lvl -gt 0 -and $stack.Count -ge $lvl){ $prefix=$stack[0..($lvl-1)] }
        $path=((@($prefix)+$k) -join '.').Trim('.')
        if($path -eq ''){ continue }
        [void]$rows.Add("- `$path` - $(Get-KeyDesc $path) $(Infer-Type $v) Recommended baseline: `$v`.")
      }
    }
    foreach($r in $rows){ [void]$sb.AppendLine($r) }
    [void]$sb.AppendLine()
    [void]$sb.AppendLine('### YAML Baseline')
    [void]$sb.AppendLine('```yaml')
    $prevBlank=$false
    foreach($yl in $lines){
      $t=$yl.Trim(); if($t.StartsWith('#')){ continue }
      if($t -eq ''){ if($prevBlank){ continue }; $prevBlank=$true; [void]$sb.AppendLine(''); continue }
      $prevBlank=$false; [void]$sb.AppendLine($yl)
    }
    [void]$sb.AppendLine('```')
    [void]$sb.AppendLine()
  }
  [void]$sb.AppendLine(':::warning[Owner Validation]')
  [void]$sb.AppendLine('- Reload safely after edits.')
  [void]$sb.AppendLine('- Validate commands/placeholders related to this module.')
  [void]$sb.AppendLine('- Test with user and staff roles.')
  [void]$sb.AppendLine(':::')

  $newText = $front + "`r`n" + $sb.ToString().Trim() + "`r`n"
  $ok=$false
  for($i=0;$i -lt 4 -and -not $ok;$i++){
    try { Set-Content $path $newText -Encoding UTF8; $ok=$true }
    catch { Start-Sleep -Milliseconds 250 }
  }
  if(-not $ok){ Write-Output "failed:$name" }
}
Write-Output 'retry-done'
