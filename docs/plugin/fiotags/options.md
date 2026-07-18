---
title: Options & Configuration
sidebar_position: 3
---

# Options & Configuration

This page documents the YAML files that drive the current FioTags build.

:::info[Source-backed scope]
When a feature is split across multiple files, the file name is listed explicitly so you can edit the right place first.
:::

## `storage`

```yaml
storage:
  type: YAML
  yaml:
    file: "meta.yml"
  sqlite:
    file: "fiotag.db"
  mysql:
    host: "127.0.0.1"
    port: 3306
    database: "fiotag"
    username: "root"
    password: "change-me"
    useSSL: false
```

- `storage.type` selects `YAML`, `SQLITE`, or `MYSQL`.
- `storage.yaml.file` is the YAML profile store filename.
- `storage.sqlite.file` is the SQLite database filename.
- `storage.mysql.*` configures the MySQL connection.

Runtime note:
- YAML storage is the default path used by the current build.

## `command-aliases`

```yaml
command-aliases:
  user:
    menu: [menu]
    help: [help]
    notification: [notification, notify]
    customtag: [customtag, ctag]
    admin: [admin]
  admin:
    reload: [reload]
    help: [help]
    menu: [menu]
    placeholders: [placeholders]
    author: [author]
    version: [ver]
    open: [open]
    tag: [tag]
    token: [token]
    historytag: [historytag]
    meta: [meta]
    check: [check]
    migrate: [migrate]
```

- Aliases are case-insensitive.
- Each alias must be a single token.
- Additional nested alias groups exist for tag state, bypass mode, token actions, and history-tag actions.

## `language`

```yaml
language:
  current: "en"
```

- `language.current` selects `lang_<id>.yml` from `plugins/FioTags/lang/`.

## `chat.tag-format`

```yaml
chat:
  tag-format:
    output-mode: "LEGACY_SECTION"
```

- `chat.tag-format.output-mode` controls the default output mode for tag format placeholders.
- Supported values: `MINIMESSAGE`, `LEGACY_SECTION`, `LEGACY_AMPERSAND`, `PLAIN`.

## `preview`

```yaml
preview:
  enabled: true
  right-click: true
  nametag:
    enabled: true
    duration-ticks: 100
    hologram:
      provider: "ARMOR_STAND"
    format: '[prefix="false"]{rank} {name} {tag}'
  chat-ghost:
    enabled: true
    format: '[prefix="false"]<white>{player} {tag_display}</white><gray>: </gray><white>This is your chat preview.</white>'
```

- `preview.enabled` is the master preview toggle.
- `preview.right-click` enables right-click preview from the main menu.
- `preview.nametag.*` configures the temporary nametag preview.
- `preview.chat-ghost.*` configures the local chat preview line.

## `voucher`

```yaml
voucher:
  settings:
    enable_this_feature: true
    shift_right_to_convert: true
    claim_and_allow_self_claim: true
  item:
    material: "PLAYER_HEAD"
    name: "<gold>Tag Voucher</gold> <dark_gray>-</dark_gray> {tag_display}"
  tags:
    crow:
      material: PLAYER_HEAD
      name: "<white>Tag Voucher</white><dark_gray>:</dark_gray> {tag_display}"
```

- `voucher.settings.enable_this_feature` enables the voucher flow.
- `voucher.settings.shift_right_to_convert` allows converting owned tags by shift-right-click.
- `voucher.settings.claim_and_allow_self_claim` controls self-claim behavior.
- `voucher.item` sets the default voucher item.
- `voucher.tags.<tagId>` overrides voucher visuals per tag.

## `percent-unlocked`

```yaml
percent-unlocked:
  enabled: true
  lore:
    - "<dark_gray>(%percent%%) users unlocked</dark_gray>"
```

- `percent-unlocked.enabled` toggles unlock-rate lore.
- `percent-unlocked.lore` is the line template that receives `%percent%`.

## `chat-listener-priority`

```yaml
chat-listener-priority: HIGHEST
```

- Controls the Bukkit chat priority used for custom tag input handling.
- Valid values: `LOWEST`, `LOW`, `NORMAL`, `HIGH`, `HIGHEST`, `MONITOR`.

## `custom-tag`

```yaml
custom-tag:
  history-limit:
    default: 1
    permission-defaults:
      vip: 2
      mvp: 3
  max-plain-length: 32
  blacklist-regex:
    - "\\bfuck\\b"
    - "\\bbitch\\b"
    - "\\bassholes?\\b"
  auto-token:
    enabled: true
    permission: "fiotag.customtag.token.auto"
    amount: 1
    interval-seconds: 86400
    check-every-seconds: 60
    notify-player: true
    grant-on-permission-acquired:
      enabled: true
      amount: 1
    countdown-format: "{d}d, {h}h, {m}m, {s}s"
```

- `history-limit.default` is the base history size.
- `history-limit.permission-defaults` overrides the default for matching permissions.
- `max-plain-length` limits the stripped custom-tag text length.
- `blacklist-regex` blocks matching custom tag input.
- `auto-token.*` controls scheduled custom-tag token rewards.

## `formats`

```yaml
formats:
  number: "#,###"
  percent: "0.00"
  subprefix:
    enabled: true
    decimals: 1
    trim-trailing-zeros: true
    values:
      "1000": "k"
      "1000000": "m"
      "1000000000": "b"
      "1000000000000": "t"
```

- `formats.number` and `formats.percent` are Java DecimalFormat patterns.
- `formats.subprefix.*` controls compact number suffix output.

## `equipped-tag-sync`

```yaml
equipped-tag-sync:
  enabled: true
  on-join: true
  on-quit: true
  on-world-change: true
  on-death: true
  on-respawn: true
  validate-unlocked-required: true
```

- Controls automatic validation of the currently equipped tag.
- `validate-unlocked-required` keeps the unlock requirement strict when enabled.

## `check-for-updates`

```yaml
check-for-updates:
  enabled: true
```

- Enables the update checker.

## `bstats`

```yaml
bstats:
  enabled: true
```

- Enables anonymous bStats metrics.

## `debug`

```yaml
debug:
  enabled: true
```

- Enables runtime diagnostics for commands, menus, actions, placeholders, requirements, storage, migration, and reload behavior.

:::info[Page note]
This page is source-backed and keeps the configuration reference aligned with the current build.
:::
