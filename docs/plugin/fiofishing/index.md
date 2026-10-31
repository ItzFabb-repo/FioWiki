---
title: About
sidebar_position: 1
---

# FioFishing

FioFishing is a configurable fishing plugin for Paper servers. It adds custom fish, bait, rods, catch statistics, a fishing journal, shop and sell menus, anti-AFK checks, and timed fishing competitions.

## What the plugin includes

### Custom fishing content

- Fish grouped by rarity, with configurable catch weights, size, price, biome, time, weather, lore, and item behavior.
- Bait definitions with catch modifiers, usage requirements, prices, and custom item support.
- Rod definitions with durability, enchantment filters, sounds, loot filters, and allowed bait.

### Player and server features

- Fishing journal, player statistics, selling, and shop menus.
- Scheduled and manually managed fishing events with configurable scoring and rewards.
- Optional anti-AFK verification, rare-catch announcements, and event leaderboards.
- YAML or MySQL storage for player data.

## Quick start

1. Install the plugin on a supported Paper server and start the server once to generate its configuration files.
2. Open `plugins/FioFishing/`. The main settings are in `config.yml`; fish, bait, and rod definitions are stored in `Loots/`.
3. Customize the fish and rods you want to use. The folders include sample files you can copy and edit.
4. Save your changes, run `/fiofishing admin reload`, and check the console for configuration errors.
5. Test the result in-game. Administrators can give fish, bait, and rods with `/fiofishing admin give <fish|baits|fishingrods> <id> <player> [amount]`.

## Configuration files

| Location in `plugins/FioFishing/` | Purpose |
| --- | --- |
| `config.yml` | Global settings for worlds, animations, AFK checks, statistics and leaderboards, language, fish sizes, and data storage. |
| `Loots/Fish/*.yml` | Fish definitions and rarity settings. Sample files include `common.yml`, `rare.yml`, and others. |
| `Loots/Baits/*.yml` | One bait definition per file, including modifiers, usage requirements, item details, and prices. |
| `Loots/Rods/*.yml` | One rod definition per file, including durability, fish filters, sounds, and accepted bait. |
| `Events/*.yml` | Fishing competition settings and rewards. `Events/settings.yml` controls the weekly schedule. |
| `Menu/**/*.yml` | GUI layouts and button actions. Subfolders are loaded as well. |
| `Lang/messages_<code>.yml` | Messages for the selected language. Built-in codes: `en`, `id`, `jp`, and `ch`. |
| `CustomNaming/material.json`, `CustomNaming/biome.json` | Display names for materials and biomes in menus and the journal. |
| `data.yml` or a MySQL database | Player statistics and journal data, depending on the `type` selected under `storage`. |

The [Configuration](./config/config.mdx) guides explain the available values and accepted options in each file. They document how to use the plugin's settings; they do not require changes to the plugin source code.

## Safe editing practices

- Make a backup before editing, especially of `config.yml`, `Loots/`, `Events/`, `Menu/`, and player data.
- YAML uses spaces for indentation; do not use tabs. Start list entries with `-`. Quote text containing `:` or `#` when necessary.
- Keep the keys on the left unchanged. Edit values on the right or add entries that follow the same structure as the examples.
- Every fish ID must be unique across all files in `Loots/Fish/*.yml`. Reuse matching IDs in bait, rod, and menu settings.
- After editing, run `/fiofishing admin reload`. If a file has invalid syntax or duplicate IDs, the plugin reports the issue in the console and may skip that entry.

## Documentation map

- [Commands & Permissions](/plugin/fiofishing/commands-permissions)
- [Developer API](/plugin/fiofishing/api)
- [Options & Configuration](/plugin/fiofishing/options)
- [Placeholders](/plugin/fiofishing/placeholders)
- [General settings: `config.yml`](/plugin/fiofishing/config)
- [Create Custom Fishs](/plugin/fiofishing/config/fish)
- [Create Custom Baits](/plugin/fiofishing/config/baits)
- [Fishing rods](/plugin/fiofishing/config/rods)
- [Events and schedule](/plugin/fiofishing/config/events)
- [GUI menus](/plugin/fiofishing/config/menus)
- [Language and display names](/plugin/fiofishing/config/language-names)

## Common commands

| Command | Purpose |
| --- | --- |
| `/fiofishing` | Show the command help. |
| `/fiofishing stats [player]` | View fishing statistics. |
| `/fiofishing journey` | Open the fish journal. |
| `/fiofishing events` | View current events. |
| `/fiofishing leaderboards` | Open the event leaderboard. |
| `/fiofishing sell` | Open the menu for selling eligible fish and bait. |
| `/fiofishing shop` | Open the plugin shop. |
| `/fiofishing admin reload` | Reload configuration files. |
| `/fiofishing admin give <fish\|baits\|fishingrods> <id> <player> [amount]` | Give a FioFishing item by its configuration ID. |

Selling requires Vault and an economy plugin. WorldGuard is only needed for region rules. ItemsAdder, Oraxen, and Nexo are only needed when item textures use those plugins.
