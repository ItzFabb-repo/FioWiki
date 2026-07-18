---
title: About
sidebar_position: 1
---

# FioChatGames

FioChatGames is a Minecraft chat-and-activity minigame plugin focused on automated server-wide events, manual admin-triggered rounds, reward distribution, and persistent player stats.

![FioChatGames User Alias](../../img/fiochatgames/FioChatGames%20User%20Alias.png)

## What the plugin actually includes

### Event game types

FioChatGames currently ships with these event modes:

- `UNSCRAMBLE`
- `UNSHUFFLE`
- `UNREVERSE`
- `TRIVIA`
- `MATH`
- `FAST_TYPE`
- `REWRITE`
- `RANDOM`
- `FILLOUT`
- `GUESS_THE_WORD`
- `GUESS_THE_NUMBER`
- `REACTION`
- `VARIABLE`

### Race objectives

Race mode is represented internally as `GameType.ACTIVITY`, with objective types such as:

- `BARTERING`
- `BREAK`
- `BRUSH`
- `BREEDING`
- `BREWING`
- `CARVE_PUMPKIN`
- `COMPOSTING`
- `CONSUME`
- `CRAFT`
- `CURING`
- `DEAL_DAMAGE`
- `ENCHANT`
- `EXP_LEVELS`
- `EXP_POINTS`
- `FISHING`
- `HARVEST`
- `HATCHING`
- `HUNT`
- `ITEM_BREAKING`
- `ITEM_DAMAGE`
- `ITEM_MENDING`
- `MILKING`
- `OBTAIN_ITEMS`
- `PLACE`
- `PLACEHOLDERAPI`
- `PLAYER_DEATH`
- `PLAYER_KILLS`
- `PROJECTILE_LAUNCHING`
- `RESURRECTING`
- `SHEAR`
- `SHOOT_AT_ENTITY`
- `SMELT`
- `SMITHING`
- `SPY_ENTITY`
- `STAND_ON`
- `STRIPPING`
- `TAMING`
- `TRADING`
- `WALKING`

## Major systems

### Start modes

The plugin supports these automatic start strategies from `config.yml`:

- `RANDOM`: randomly choose from enabled content
- `ROTATE`: follow the exact `rotate_order`
- `COMMANDS`: only run rounds manually through commands or admin menu
- `SPECIFIC`: randomize only from `specific_games`
- `DISABLED`: block automatic starts

### Player eligibility

Round participation can be controlled by:

- world blacklist via `disabled-worlds`
- player blacklist via `blacklist.players`
- gamemode blacklist via `blacklist-gamemodes`
- optional `fiochatgames.play` permission gate
- per-player toggle state stored in player data

### Display and pacing

Global behavior includes:

- bossbar display
- actionbar timer
- answer cooldown in milliseconds
- configurable win, lose, start, and countdown sounds
- full-duration chat mode for ranking multiple correct players before the round ends
- winner name highlighting in result messages

### Data and integrations

Built-in integrations include:

- PlaceholderAPI expansion support
- player history and winner history tracking
- leaderboard rendering
- admin GUI menus loaded from `menu/admin/*.yml`
- optional update checker
- API for external plugins under `com.itzfabb.fiochatgames.api`

![FioChatGames Admin Alias](../../img/fiochatgames/FioChatGames%20Admin%20Alias.png)

![FioChatGames World Blacklist](../../img/fiochatgames/FioChatGames%20World%20Blacklist.png)

## Documentation map

Use these pages next:

- [Commands & Permissions](/plugin/fiochatgames/commands-permissions)
- [Placeholders](/plugin/fiochatgames/placeholders)
- [Developer API](/plugin/fiochatgames/api)
- [Options & Configuration](/plugin/fiochatgames/options)
- [Event explanations](/plugin/fiochatgames/config/events/explanation)
- [Race explanations](/plugin/fiochatgames/config/races/explanation)

:::info[Page note]
This page is source-backed and includes a short callout so the content reads like a guide instead of plain reference text.
:::
