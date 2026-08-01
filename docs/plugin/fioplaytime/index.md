---
title: About
sidebar_position: 1
---

# FioPlaytime

FioPlaytime is a lightweight Spigot/Paper playtime tracker for Minecraft 1.16+ servers. It records player activity, shows playtime menus, ranks players on leaderboards, and lets server owners attach rewards to configured playtime tiers.

## What the plugin actually includes

### Playtime tracking

Player time is counted while the player is online and eligible according to `config.yml`. The plugin can block or allow counting by:

- world blacklist and whitelist
- WorldGuard-style region blacklist and whitelist
- gamemode blacklist
- player blacklist and whitelist
- same-IP duplicate blocking
- admin blacklist and freeze states

### Tier rewards

Reward tiers are configured in `rewards.yml` under `playtime.rewards`. Each tier can define:

- reward descriptions rendered in menus
- required playtime duration
- one-time reward behavior
- item, command, sound, message, title, and subtitle actions

The bundled source includes numbered reward tiers such as `1`, `2`, `3`, and onward. Tier requirements use readable durations like `10m,10s`, `20m`, `1h`, or `10d`.

### Menus

The plugin ships configurable inventory menus for:

- main playtime reward menu
- player profile menu
- leaderboard menu
- material selector menu

Menu files live under `menu/` and support static items, paginated content slots, player heads, MiniMessage-style text, PlaceholderAPI placeholders, click actions, shift-click actions, sounds, and custom FioPlaytime navigation actions.

### Reward materials

`materials.yml` controls the visual material set used by reward tiers in the menu. Players can select a material pack when they have the configured permission, preview it from the menu, or clear their selected material back to default.

### Storage and integrations

FioPlaytime supports:

- YAML storage
- MySQL storage
- PlaceholderAPI placeholders
- Bukkit Services API through `FioPlaytimeApi`
- optional Geyser/Floodgate detection for Bedrock-related checks

## Documentation map

Use these pages when configuring the plugin:

- **Commands & Permissions**: player commands, admin commands, aliases, and permission nodes.
- **Placeholders**: PlaceholderAPI identifiers exposed by FioPlaytime.
- **Developer API**: Java API available through Bukkit Services.
- **Options & Configuration**: practical explanation of the plugin systems.
- **Configuration**: `config.yml` runtime behavior.
- **Rewards**: `rewards.yml` tier format and reward action tags.
- **Materials**: `materials.yml` material packs and visual states.
- **Menu**: `PlaytimeMenu.yml`, `Profiles.yml`, `Leaderboards.yml`, and `Materials.yml`.

:::info[Page note]
This page was scanned from the local FioPlaytime source in `C:\Users\idfab\Downloads\Custom Build\FioPlaytime`. The layout follows the same documentation style used by the FioLevels page.
:::
