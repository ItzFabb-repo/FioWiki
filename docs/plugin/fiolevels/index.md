---
title: About
sidebar_position: 1
---

# FioLevels

FioLevels is a lightweight Spigot/Paper leveling plugin for Minecraft 1.16+ servers. It uses configured quest tasks instead of action-based XP, so players level up after completing every requirement assigned to their next progression level.

## What the plugin actually includes

### Quest-based leveling

Level progress is loaded from `tasks.yml` under `quests.levels`. The bundled source includes Level `0` as the default unlocked entry and progression content up to Level `100`.

Each level can define:

- multiple requirement rules
- rendered requirement descriptions
- reward commands
- reward descriptions for menus

### Supported task objective types

FioLevels currently listens for gameplay progress such as:

- `JOIN_FIRST_TIME`
- `BLOCK_BREAK`
- `BLOCK_PLACE`
- `BLOCK_FERTILIZE`
- `FARMING`
- `BUCKET_EMPTY`
- `CONSUME`
- `CRAFTING`
- `SMELTING`
- `BREWING_INGREDIENTS`
- `BREWING_POTIONS`
- `ENCHANTING`
- `EXP_POINTS`
- `EXP_LEVELS`
- `FISHING`
- `HATCHING`
- `PROJECTILE_LAUNCH`
- `SHEARING`
- `ENTITY_BRED`
- `ENTITY_DEAL_DAMAGE`
- `PLAYER_KILL`
- `HUNT`
- `RESSURECTION`
- `COMPOSTING`
- `SMITHING`
- `TRADING`
- `MILKING`
- `BARTERING`
- `CURING`
- `PLAYTIME`
- `PLACEHOLDERAPI`

## Major systems

### Menus

The plugin ships configurable inventory menus for:

- main levels menu
- profile/statistics menu
- leaderboards menu
- bracket selector
- font selector
- color selector

Menu files live under `menu/` and support static items, pagination actions, click actions, MiniMessage text, player heads, item flags, and placeholder rendering.

### Cosmetics

Optional cosmetic systems can be enabled or disabled from `config.yml`:

- level brackets from `brackets.yml`
- number fonts from `fonts.yml`
- level colors from `colors.yml`

Each cosmetic entry can define its own permission node.

### Progress controls

Progress can be limited or protected by:

- blacklisted gamemodes
- world whitelist and blacklist entries
- region-style whitelist and blacklist entries
- Bedrock/Geyser support toggle
- natural gameplay checks
- frozen player data
- duplicate reward prevention
- claim-before-next-level behavior

### Data and integrations

Built-in integrations include:

- PlaceholderAPI expansion support
- optional Floodgate/Geyser Bedrock player detection
- YAML storage
- MySQL storage
- leaderboard cache
- async autosave
- public API under `com.itzfabb.fiolevels.api`

## Documentation map

Use these pages next:

- [Commands & Permissions](/plugin/fiolevels/commands-permissions)
- [Placeholders](/plugin/fiolevels/placeholders)
- [Developer API](/plugin/fiolevels/api)
- [Options & Configuration](/plugin/fiolevels/options)
- [config.yml](/plugin/fiolevels/config/config.yml)
- [tasks.yml](/plugin/fiolevels/config/tasks.yml)

:::info[Page note]
This page is source-backed from the local `FioLevels` project and follows the same overview style as the FioChatGames wiki page.
:::
