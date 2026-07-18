---
title: Commands & Permissions
sidebar_position: 2
---

# Commands & Permissions

This page is scanned from `plugin.yml`, `config.yml`, and `FioTagCommand.java`.

:::info[Scope]
The root command is fixed in `plugin.yml`, while the shorter subcommand names come from the alias tree in `config.yml`.
:::

## Root Command

```text
/fiotags
```

Aliases:

```text
/fiotag
/tags
/tag
```

Config alias groups:

- `menu`, `help`, `notification`, `customtag`, `admin`
- `reload`, `placeholders`, `author`, `version`, `open`, `tag`, `token`, `historytag`, `meta`, `check`, `migrate`
- `set`, `history`, `unclaim`, `unlocked`, `locked`, `bypass`, `permanent`, `temporary`, `give`, `take`, `list`, `add`, `remove`

## User Commands

| Command | Permission | Description |
| --- | --- | --- |
| `/fiotags` | `fiotags.use` | Opens the main menu. |
| `/fiotags menu` | `fiotags.use` | Opens the player tag menu. |
| `/fiotags help` | `fiotags.help` | Shows the player help text. |
| `/fiotags notification [unclaim\|tagtoken]` | `fiotags.notify` | Toggles notification states for the player. |
| `/fiotags customtag` | `fiotags.customtag.create` | Starts personal custom tag creation. |

## Admin Commands

| Command | Permission | Description |
| --- | --- | --- |
| `/fiotags admin help` | `fiotags.admin.help` | Shows admin help. |
| `/fiotags admin reload` | `fiotags.admin.reload` | Reloads config, menus, and data stores. |
| `/fiotags admin menu` | `fiotags.admin.menu` | Opens the admin GUI. |
| `/fiotags admin placeholders` | `fiotags.admin.placeholders` | Prints the placeholder reference. |
| `/fiotags admin author` | `fiotags.admin.author` | Prints author information. |
| `/fiotags admin version` | `fiotags.admin.version` | Prints plugin version. |
| `/fiotags admin open <menu> <player>` | `fiotags.admin.open` | Opens any supported menu for a target player. |
| `/fiotags admin tag set <locked\|unlocked\|unclaim> <temporary\|permanent> [duration] <player> <tag>` | `fiotags.admin.tag.set` plus state/bypass children | Changes tag state for a player. |
| `/fiotags admin tag history <player> [page]` | `fiotags.admin.tag.history` | Shows a player's custom tag history. |
| `/fiotags admin token <give\|take\|set> <player> <amount>` | `fiotags.admin.token.*` | Manages custom tag tokens. |
| `/fiotags admin historytag <set\|add\|remove\|list> <player> [amount]` | `fiotags.admin.historytag.*` | Manages custom tag history limits. |
| `/fiotags admin meta <add\|remove\|list> <player> <data>` | `fiotags.admin.meta.*` | Manages player metadata entries. |
| `/fiotags admin check <player>` | `fiotags.admin.check` | Inspects a player's tag and token state. |
| `/fiotags admin migrate <plugin>` | `fiotags.admin.migrate` | Imports data from another supported plugin. |

## User Permissions

| Permission | Default | Description |
| --- | --- | --- |
| `fiotags.user.*` | `true` | Grants the standard player command set. |
| `fiotags.use` | `true` | Allows the main menu command. |
| `fiotags.help` | `true` | Allows player help. |
| `fiotags.notify` | `true` | Allows notification toggles. |
| `fiotags.customtag.create` | `true` | Allows personal custom tag creation. |
| `fiotags.customtag.color.vanilla` | `op` | Allows vanilla/legacy color formatting in custom tags. |
| `fiotags.customtag.color.hex` | `op` | Allows hex and gradient formatting in custom tags. |
| `fiotags.customtag.token.auto` | `false` | Receives automatic custom-tag token rewards. |

## Admin Permissions

| Permission | Default | Description |
| --- | --- | --- |
| `fiotags.admin` | `op` | Base admin permission. |
| `fiotags.admin.*` | `op` | Wildcard for all admin actions. |
| `fiotags.admin.help` | `op` | `/fiotags admin help` |
| `fiotags.admin.reload` | `op` | `/fiotags admin reload` |
| `fiotags.admin.menu` | `op` | `/fiotags admin menu` |
| `fiotags.admin.placeholders` | `op` | `/fiotags admin placeholders` |
| `fiotags.admin.author` | `op` | `/fiotags admin author` |
| `fiotags.admin.version` | `op` | `/fiotags admin version` |
| `fiotags.admin.open` | `op` | `/fiotags admin open ...` |
| `fiotags.admin.tag` | `op` | Parent permission for tag management. |
| `fiotags.admin.tag.set` | `op` | Parent permission for state changes. |
| `fiotags.admin.tag.set.locked` | `op` | Set a tag to locked. |
| `fiotags.admin.tag.set.unlocked` | `op` | Set a tag to unlocked. |
| `fiotags.admin.tag.set.unclaim` | `op` | Set a tag to unclaim. |
| `fiotags.admin.tag.set.bypass` | `op` | Parent permission for bypass mode. |
| `fiotags.admin.tag.set.bypass.permanent` | `op` | Use permanent bypass mode. |
| `fiotags.admin.tag.set.bypass.temporary` | `op` | Use temporary bypass mode. |
| `fiotags.admin.tag.history` | `op` | Show player tag history. |
| `fiotags.admin.meta` | `op` | Parent permission for metadata actions. |
| `fiotags.admin.meta.add` | `op` | Add metadata. |
| `fiotags.admin.meta.remove` | `op` | Remove metadata. |
| `fiotags.admin.meta.list` | `op` | List metadata. |
| `fiotags.admin.token` | `op` | Parent permission for token actions. |
| `fiotags.admin.token.give` | `op` | Give tokens. |
| `fiotags.admin.token.take` | `op` | Take tokens. |
| `fiotags.admin.token.set` | `op` | Set token amount. |
| `fiotags.admin.historytag` | `op` | Parent permission for history-limit actions. |
| `fiotags.admin.historytag.set` | `op` | Set history limit. |
| `fiotags.admin.historytag.add` | `op` | Add to history limit. |
| `fiotags.admin.historytag.remove` | `op` | Remove from history limit. |
| `fiotags.admin.historytag.list` | `op` | List history limit. |
| `fiotags.admin.check` | `op` | Inspect tag state. |
| `fiotags.admin.migrate` | `op` | Run data migration. |
| `fiotags.admin.update` | `op` | Receive update notifications. |

## YAML Presets

Common player preset:

```yaml
fiotags.user.*
fiotags.use
fiotags.help
fiotags.notify
fiotags.customtag.create
```

Common admin preset:

```yaml
fiotags.admin
fiotags.admin.*
fiotags.admin.reload
fiotags.admin.menu
fiotags.admin.placeholders
fiotags.admin.tag.set
fiotags.admin.tag.history
fiotags.admin.meta
fiotags.admin.token
fiotags.admin.historytag
fiotags.admin.check
fiotags.admin.migrate
```

:::warning[Permission Model]
The plugin uses parent nodes and granular children together. Grant only the exact node you need if you want tight control.
:::
