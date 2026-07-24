---
title: About
sidebar_position: 1
---

# FioAchievements

FioAchievements is a Minecraft achievement plugin focused on configurable progress tracking, GUI-driven achievement browsing, category-based rewards, tier rewards, seasonal achievements, exclusive achievements, broadcasts, and persistent player progress.

## What the plugin actually includes

### Achievement categories

The default resource pack currently ships with these achievement category folders:

- `survive`
- `mining`
- `farming`
- `hunting`
- `exploration`
- `building`
- `fishing`
- `enchanting`
- `nether`
- `community`

Each category can contain regular achievements, `seasons` achievements, `exclusives` achievements, and a `Tiers` folder for tier-generated achievements.

### Progress objectives

Achievements are powered by action strings inside `achievementTasks.required`, with objective types such as:

- `BREAK_BLOCK`
- `PLACE_BLOCK`
- `HARVEST`
- `CRAFT`
- `SMELT`
- `BREW`
- `ENCHANT`
- `KILL_ENTITY`
- `KILL_PLAYER`
- `FISHING`
- `PHYSICAL`
- `PHYSICAL_BIOME`
- `SERVER`
- `GAIN`
- `MESSAGE`
- `EVENT`
- `TRIGGER`

## Major systems

### Player menus

Players can open the main achievement GUI, browse category progress, view seasonal and exclusive achievement lists, inspect achievement history, search achievement entries, and claim tier rewards.

### Achievement variants

FioAchievements supports:

- normal achievements from category YAML files
- seasonal achievements controlled by allowed months
- exclusive achievements with optional expiry dates
- tier achievements generated from `tierAchievements.Tier`
- point and tier reward progression

### Progress controls

Global behavior can be configured through:

- category aliases
- vanilla advancement handling
- SQLite or MySQL storage
- autosave and cache behavior
- world whitelist and blacklist filters
- region whitelist and blacklist filters
- reward execution behavior
- broadcast behavior
- Bedrock/Geyser/Floodgate player support

### Data and integrations

Built-in integrations include:

- PlaceholderAPI expansion support
- Bukkit API access through `FioAchievementsAPI`
- `FioAchievementCompleteEvent`
- bStats metrics
- player settings storage
- tier claim storage
- SQLite and MySQL player progress storage

## Documentation map

Use these pages next:

- [Commands & Permissions](/plugin/fioachievements/commands-permissions)
- [Placeholders](/plugin/fioachievements/placeholders)
- [Developer API](/plugin/fioachievements/api)
- [Options & Configuration](/plugin/fioachievements/options)
- [Achievement File Format](/plugin/fioachievements/achievement-format)
- [Main Configuration](/plugin/fioachievements/config/config.yml)

:::info[Page note]
This page is source-backed from the current FioAchievements project and follows the same short guide style used by FioChatGames.
:::
