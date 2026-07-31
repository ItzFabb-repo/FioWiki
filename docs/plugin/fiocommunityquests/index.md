---
title: About
sidebar_position: 1
---

# FioCommunityQuests

FioCommunityQuests is a lightweight Bukkit/Spigot community quest plugin for Minecraft 1.16+ servers. It lets the whole server work together on scheduled or manually started quests, tracks player contributions, and rewards top contributors or every participating player when a quest ends.

## What the plugin actually includes

### Community quest events

Quest content is loaded from YAML files under `quests/`. Each file represents one community quest, using the file name as the quest id unless `quest.id` is configured.

Each quest can define:

- display name, icon material, priority, and description
- cooperative or competitive mode
- quest duration and community goal
- objective type and required targets
- progress bossbar, actionbar, start message, completion message, and failed message
- top contribution rewards
- participation rewards
- custom reward items
- per-quest world, region, and gamemode restrictions

### Supported quest objective types

FioCommunityQuests currently listens for gameplay progress such as:

- `BLOCK_BREAK`
- `BLOCK_PLACE`
- `BLOCK_FERTILIZE`
- `BUCKET_EMPTY`
- `FARMING`
- `HATCHING`
- `ENTITY_BRED`
- `ENTITY_DEAL_DAMAGE`
- `HUNT`
- `FISHING`
- `BREWING_INGREDIENTS`
- `BREWING_POTIONS`
- `CRAFTING`
- `SMELTING`
- `SMITHING`
- `COMPOSTING`
- `TRADING`
- `MILKING`
- `BARTERING`
- `CURING`
- `PLAYTIME`
- `PLACEHOLDERAPI`
- `EXP_POINTS`
- `EXP_LEVELS`
- `PROJECTILE_LAUNCH`
- `SHEARING`
- `RESSURECTION`
- `ITEM_ENCHANT`
- `ENCHANTING`
- `CONSUME`
- `MANUAL`

Legacy aliases such as `BREAK_BLOCK`, `PLACE_BLOCK`, `FISH`, `CRAFT`, `SMELT`, `TRADE`, `PAPI`, `EXP`, `LEVELS`, and `ITEM_CONSUME` are also normalized by the plugin.

## Major systems

### Menus

The plugin ships configurable inventory menus for:

- active community quests
- player profile
- player quest history
- quest contribution details
- contribution leaderboards

Menu files live under `menu/` and support static items, player heads, refreshable placeholders, click actions, MiniMessage text, pagination-style content slots, and plugin menu actions such as `[FIOCOMMUNITYQUESTS] QuestsProfile %player_name%`.

### Scheduling and execution

Community quests can be started in multiple ways:

- scheduled by day from `execute.schedule`
- randomized when random mode is enabled
- manually through admin commands
- programmatically through the public API

The plugin supports a configured timezone for scheduled execution and countdown placeholders. Multiple quests can run at once through `execute.settings.max_quest_run`.

### Progress controls

Progress can be limited or protected by:

- blacklisted gamemodes
- world whitelist and blacklist entries
- region whitelist and blacklist entries
- player whitelist and blacklist entries
- per-quest whitelist and blacklist rules
- natural block checks
- natural crop checks
- natural mob spawn checks
- spawner kill prevention
- same-IP player kill prevention
- personal participation toggle

### Holograms and feedback

The plugin includes a TEXT_DISPLAY hologram system for modern server versions. Admins can create, remove, list, clone, move, teleport to, scale, face, freeze, and configure update intervals for holograms.

Quest feedback can also be shown through:

- bossbars
- actionbars
- broadcast messages
- sounds
- command actions
- quest menu descriptions
- PlaceholderAPI values

### Data and integrations

Built-in integrations and storage include:

- PlaceholderAPI expansion support
- optional Geyser/Floodgate Bedrock player detection
- SQLite storage through `plugins/FioCommunityQuests/player.db`
- MySQL storage
- language files under `lang/lang_<key>.yml`
- MiniMessage formatting
- public API under `com.itzfabb.fioquests.api`

Default language keys include:

- `en` English
- `id` Indonesia
- `zh` Chinese
- `ja` Japanese

## Commands

The plugin registers one root command:

- `/fiocommunityquest`

Aliases:

- `/fcq`
- `/fioquests`
- `/communityquests`
- `/quests`

Common player commands include:

- `/fiocommunityquest`
- `/fiocommunityquest help`
- `/fiocommunityquest toggle <notification/participate>`
- `/fiocommunityquest leaderboards`
- `/fiocommunityquest profile [player]`
- `/fiocommunityquest history [player]`
- `/fiocommunityquest topcontributions`
- `/fiocommunityquest mycontributions`
- `/fiocommunityquest list`

Admin commands use `/fiocommunityquest admin ...` and include:

- `reload`
- `help`
- `authors`
- `version`
- `placeholders`
- `hologram`
- `open`
- `forceopen`
- `questStart`
- `questList`
- `questStop`
- `questDisable`
- `questEnable`
- `contributionpoints`
- `blacklist`
- `whitelist`

The source also accepts `/fiocommunityquest reload` and `/fiocommunityquest create <id> <goal> <name...>` when the sender has admin permission.

## Permissions

Player permission nodes include:

- `fioquests.use`
- `fioquests.command.menu`
- `fioquests.command.help`
- `fioquests.command.toggle`
- `fioquests.command.leaderboards`
- `fioquests.command.profile`
- `fioquests.command.profile.others`
- `fioquests.command.history`
- `fioquests.command.history.others`
- `fioquests.command.topcontributions`
- `fioquests.command.mycontributions`

Admin permission nodes include:

- `fioquests.admin`
- `fioquests.admin.reload`
- `fioquests.admin.help`
- `fioquests.admin.authors`
- `fioquests.admin.version`
- `fioquests.admin.placeholders`
- `fioquests.admin.hologram`
- `fioquests.admin.open`
- `fioquests.admin.forceopen`
- `fioquests.admin.queststart`
- `fioquests.admin.questlist`
- `fioquests.admin.queststop`
- `fioquests.admin.questdisable`
- `fioquests.admin.questdisable.list`
- `fioquests.admin.questenable`
- `fioquests.admin.questenable.list`
- `fioquests.admin.contributionpoints`
- `fioquests.admin.blacklist`
- `fioquests.admin.blacklist.list`
- `fioquests.admin.whitelist`
- `fioquests.admin.whitelist.list`

## PlaceholderAPI

FioCommunityQuests registers the `fiocommunityquests` PlaceholderAPI expansion. Available placeholders include:

- `%fiocommunityquests_best_history_position_previousquests%`
- `%fiocommunityquests_best_history_points_previousquests%`
- `%fiocommunityquests_best_history_howmuch_times_previousquests%`
- `%fiocommunityquests_best_history_quest_previousquests%`
- `%fiocommunityquests_best_contribution_position%`
- `%fiocommunityquests_best_contribution_points%`
- `%fiocommunityquests_best_contribution_howmuch_times%`
- `%fiocommunityquests_best_participated_position%`
- `%fiocommunityquests_best_participated_points%`
- `%fiocommunityquests_best_participated_howmuch_times%`
- `%fiocommunityquests_profile_completed_total%`
- `%fiocommunityquests_profile_total_points%`

## Documentation map

Use these source files next when expanding the documentation:

- `config.yml` for global settings, scheduling, restrictions, integrations, and storage
- `hologram.yml` for TEXT_DISPLAY hologram defaults
- `menu/QuestsMenu.yml` for the main menu
- `menu/QuestsProfile.yml` for profile stats
- `menu/QuestsHistory.yml` for contribution history
- `menu/QuestContributions.yml` for per-quest contribution views
- `menu/Leaderboards.yml` for all-time leaderboard display
- `quests/*.yml` for bundled community quest examples

:::info[Page note]
This page is source-backed from the local `FioCommunityQuests` project and follows the same overview style as the FioLevels wiki page.
:::
