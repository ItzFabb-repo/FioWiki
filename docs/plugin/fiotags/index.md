---
title: About
sidebar_position: 1
---

# FioTags

FioTags is a Minecraft tag progression and GUI management plugin focused on player-owned tags, admin-controlled tag states, custom tag creation, and configurable menu workflows.

![FioTags Preview Tag](../../img/fiotags/FioTags%20PREVIEW_TAG.png)

## What the plugin actually includes

### Player tag systems

FioTags currently ships with these player-facing systems:

- `/fiotags` main menu access with aliases `/fiotag`, `/tags`, and `/tag`
- notification toggles for unclaim and custom-tag token messages
- personal custom tag creation
- custom tag history browsing
- tag preview from the main menu
- voucher conversion for owned tags
- percent-unlocked display for tags
- tag browsing with sorting, filtering, and category navigation

### Tag state and progression

Tag ownership can be controlled through:

- `LOCKED`, `UNCLAIM`, and `UNLOCKED` tag states
- permanent and temporary bypass modes
- metadata-based progression
- configurable requirements on tags
- equipped-tag synchronization when a tag becomes invalid
- custom-tag token grants, including automatic token rewards

### Admin systems

Admin tooling includes:

- admin dashboard and menu editor
- tag editor, category editor, section editor, and list editor
- material selector, item-flag selector, placeholder list, and permission list
- language selector and update settings
- command aliases editor
- equipped-tag sync settings
- custom item editor
- tag history and meta management
- migration support from other supported plugins

![FioTags Custom Player Tag](../../img/fiotags/FioTags%20CUSTOM_PLAYER_TAG.png)

### Data and integrations

Built-in integration and storage support includes:

- PlaceholderAPI expansion support
- Vault and item-provider soft dependencies declared in `plugin.yml`
- YAML, SQLite, and MySQL storage options
- runtime data in `meta.yml`
- tag definitions in `tags.yml`
- menu layouts under `menu/`
- language files under `lang/`
- update checking and debug logging

## Documentation Map

Use these pages next:

- [Commands & Permissions](/plugin/fiotags/commands-permissions)
- [Features](/plugin/fiotags/features)
- [Options & Configuration](/plugin/fiotags/options)
- [Developer API](/plugin/fiotags/api)
- [Placeholders](/plugin/fiotags/placeholders)

:::info[Page note]
This page is source-backed and keeps the overview focused on what the current FioTags build actually contains.
:::
