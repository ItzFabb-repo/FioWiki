---
title: About
sidebar_position: 1
---

# FioGlow

FioGlow is a Minecraft cosmetic plugin for player glow effects, animated glow presets, per-player visibility settings, GUI selection, and optional glowing block regions.

## What the plugin actually includes

### Player glow effects

Players can open the glow menu with `/fioglow` and choose from static or animated glow IDs when they have the matching permission node.

Static glow IDs:

- `black`
- `dark_blue`
- `dark_green`
- `dark_aqua`
- `dark_red`
- `dark_purple`
- `gold`
- `gray`
- `dark_gray`
- `blue`
- `green`
- `aqua`
- `red`
- `light_purple`
- `yellow`
- `white`

Animated glow IDs:

- `rainbow`
- `fire`
- `ocean`
- `forest`
- `candy`
- `galaxy`
- `sunset`
- `frost`
- `toxic`
- `shadow`
- `royal`

### Visibility modes

FioGlow supports these player visibility modes:

- `all`: visible to everyone
- `other`: visible to other players
- `self`: visible to the selected player
- `block`: used for block glow visibility handling
- `none`: disable visibility

Per-viewer visibility uses ProtocolLib packets when `use-protocollib-visibility` is enabled. Without ProtocolLib, the plugin still applies glow through Bukkit's global glowing fallback.

## Major systems

### Glow speed

Animated glows use configurable speed IDs:

- `super_fast`
- `fast`
- `normal`
- `slow`
- `super_slow`

Admins can change the default speed for a glow ID with `/fioglow admin speed <glowId> <speed>`.

### Player data and storage

Player selections are stored in `plugins/FioGlow/players.yml` by default. MySQL is also supported through the `storage` section in `config.yml`.

If MySQL cannot connect, the plugin falls back to YAML storage so the server can continue running.

### Menus and staff controls

The plugin ships with configurable inventory menus:

- `menu/glowEffectStatic.yml`
- `menu/glowEffectAnimated.yml`
- `menu/adminPlayerList.yml`
- `menu/adminRegionList.yml`

Players use `/fioglow` for the glow selector. Staff can use `/fioglow admin list` to open the player list GUI and `/fioglow admin region list` to open the block region list GUI.

### Block glow regions

Admins can create block regions with a wand or position commands, then assign a glow color to the region. Block glow rendering is limited by `block-glow.max-blocks-per-region` and `block-glow.render-distance`.

### Language and integrations

Built-in integrations and compatibility systems include:

- PlaceholderAPI expansion support
- ProtocolLib packet-based visibility support
- Floodgate softdepend for Bedrock detection
- MiniMessage formatting in language files
- update checker support
- public API under `com.itzfabb.fioglow.api`

## Documentation map

Use these pages next:

- [Commands & Permissions](/plugin/fioglow/commands-permissions)
- [Placeholders](/plugin/fioglow/placeholders)
- [Developer API](/plugin/fioglow/api)
- [Options & Configuration](/plugin/fioglow/options)

:::info[Page note]
This page is source-backed from the current FioGlow project files and follows the same guide-style structure as the FioChatGames documentation.
:::
