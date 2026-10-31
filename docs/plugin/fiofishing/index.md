---
title: Using FioFishing
sidebar_position: 1
---

# Using FioFishing

This guide explains how players and administrators use FioFishing and where to edit its settings. The plugin adds custom fish, bait, fishing rods, catch statistics and a journal, selling menus, and fishing competitions.

## Quick start

1. Install the plugin on a supported Paper server and start the server once to generate its configuration files.
2. Open `plugins/FioFishing/`. The main settings are in `config.yml`; fish, bait, and rod definitions are stored in `Loots/`.
3. Customize the fish and rods you want to use. The folders include sample files you can copy and edit.
4. Save your changes, run `/fiofishing admin reload`, and check the console for configuration errors.
5. Test the result in-game. Administrators can give fish, bait, and rods with `/fiofishing admin give <fish\|baits\|fishingrods> <id> <player> [amount]`.

## File locations and purpose

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

## Safe editing practices

- Make a backup before editing, especially of `config.yml`, `Loots/`, `Events/`, `Menu/`, and player data.
- YAML uses spaces for indentation; do not use tabs. Start list entries with `-`. Quote text containing `:` or `#` when necessary.
- Keep the keys on the left unchanged. Edit values on the right or add entries that follow the same structure as the examples.
- Every fish ID must be unique across all files in `Loots/Fish/*.yml`. Reuse matching IDs in bait, rod, and menu settings.
- After editing, run `/fiofishing admin reload`. If a file has invalid syntax or duplicate IDs, the plugin reports the issue in the console and may skip that entry.

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

## Configuration guides

Choose a guide below to learn each file's structure, what its settings do, which values are accepted, and how to change them:

- [General settings: `config.yml`](./config/config.mdx)
- [Create Custom Fishs](./config/fish.mdx)
- [Create Custom Baits](./config/baits.mdx)
- [Fishing rods](./config/rods.mdx)
- [Events and schedule](./config/events.mdx)
- [GUI menus](./config/menus.mdx)
- [Language and display names](./config/language-names.mdx)
