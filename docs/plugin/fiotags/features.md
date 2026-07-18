---
title: Features
sidebar_position: 6
---

# Features

This page explains the current FioTags feature set as it exists in the scanned source tree.

![FioTags Preview Tag Name](../../img/fiotags/FioTags%20PREVIEW_TAG_NAME.png)

:::info[Source map]
The main player flow is spread across `menu/menu.yml`, `menu/settings.yml`, `menu/custom-tag-history.yml`, `tags.yml`, `meta.yml`, `config.yml`, and the language files under `lang/`.
:::

## Player Flow

The player-facing features currently include:

- main tag browser menu
- personal notification settings
- custom tag creation
- custom tag history
- tag preview from the main menu
- voucher conversion for owned tags
- percent-unlocked display
- sorting, filtering, and category navigation

## Tag State And Progression

FioTags tracks tags through state and profile data:

- `LOCKED`, `UNCLAIM`, and `UNLOCKED` states
- permanent and temporary bypass state
- metadata-based progression
- configurable requirements
- equipped-tag validation and synchronization
- custom tag token grants and usage

## Admin Tools

The admin GUI covers:

- dashboard and update settings
- tag list, tag editor, and tag category management
- section editor and custom item editor
- material selector, item-flag selector, and list editor
- language selector
- placeholder list and permission list
- equipped-tag sync settings
- command aliases editor
- create flow for tags and categories

![FioTags Voucher Tag](../../img/fiotags/FioTags%20VOUCHER_TAG.png)

## Integrations And Storage

The scanned build includes:

- PlaceholderAPI expansion support
- Vault and item-provider soft dependencies from `plugin.yml`
- YAML, SQLite, and MySQL storage options
- runtime profile data in `meta.yml`
- tag definitions in `tags.yml`
- update checking
- debug logging

## Related Pages

- [Commands & Permissions](/plugin/fiotags/commands-permissions)
- [Options & Configuration](/plugin/fiotags/options)
- [Developer API](/plugin/fiotags/api)
- [Placeholders](/plugin/fiotags/placeholders)

:::info[Page note]
This page is source-backed and keeps the feature overview aligned with the current plugin source.
:::
