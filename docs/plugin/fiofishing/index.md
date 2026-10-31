---
title: About
sidebar_position: 1
---

# FioFishing

FioFishing is a custom fishing plugin for Paper servers. It adds configurable fish, fishing rods, and bait, then connects them to player statistics, fishing events, menus, and rewards.

## What the plugin actually includes

### Custom catches

Fish are defined in YAML files and grouped by rarity:

- `COMMON`
- `UNCOMMON`
- `RARE`
- `EPIC`
- `LEGENDARY`
- `MYTHIC`

Each fish can define its display name, size range, chance weight, value, experience, and other catch behavior. The plugin calculates catch chances from the configured weights.

### Fishing rods and bait

The bundled rod templates include:

- `wooden_rod`
- `reinforced_rod`
- `swift_rod`
- `lucky_rod`
- `master_rod`

Rod settings can control durability, durability loss, enchantment filters, vanilla loot, anvil repair, sounds, and which fish, rarities, or bait the rod accepts.

Bait can be configured with catch and rarity modifiers, bite speed, fish size, and experience modifiers. Bait definitions also support permissions, world requirements, consumption and refund rules, and custom item textures. The plugin includes optional texture bridges for ItemsAdder, Oraxen, and Nexo.

### Fishing events and leaderboards

Configurable events turn fishing into timed server competitions. The bundled event examples cover catches such as:

- most fish caught
- largest or smallest fish caught
- fish from a selected rarity
- junk caught
- bait used
- fishing streaks

Events can run commands and rewards when they start, stop, or reach participation and tier conditions. A configurable leaderboard can show event rankings, rank changes, a player's position, and personal catch stats.

### Menus and player stats

FioFishing includes configurable menus for the main menu, fish journey, bait and rod shops, selling, and administrative item distribution. The journey menus show the player's recorded progress for each fish.

Player statistics and fish journey records can be stored in YAML or MySQL. Selling fish and eligible bait uses Vault with an enabled economy provider.

## Major systems

### Fishing behavior

The fishing experience can include:

- animated aquatic entities and a ready-to-catch water indicator around the bobber
- configurable fish size precision and catch announcements
- enabled-world restrictions
- custom fishing loot with a player toggle for vanilla loot
- an optional `/fiofishing afk` command to pause fishing while a player is AFK
- optional anti-AFK verification that asks idle players to sneak or jump, with configurable failure penalties

### Administration and controls

Administrators can manage fishing events, player blacklists, regions, and player data from `/fiofishing`. They can also give custom fish, bait, and rods, open menus for players, freeze or unfreeze fishing activity, and reload the plugin.

The plugin registers granular permissions under `fiofishing.command.*` and `fiofishing.admin.command.*`; the `fiofishing.admin` permission grants the admin command set. Players use `fiofishing.use` for custom fishing.

### Integrations and API

Optional integrations include:

- PlaceholderAPI placeholders
- Vault economy support for selling
- WorldGuard region support
- ItemsAdder, Oraxen, and Nexo custom item textures

External plugins can use the API under `com.itzfabb.fiofishing.api` to look up fish definitions and read fish data from caught items. `FioFishingCatchEvent` fires before the catch is given, allowing a listener to cancel it, replace the item, or change its experience. FioFishing only records the catch in its statistics when the event is not cancelled.

## Compatibility

The current project targets Paper `1.21.11` through `26.3` and Java 21.

:::info[Page note]
This overview follows the current FioFishing source and bundled configuration, including its fishing, bait, rod, event, storage, and integration systems.
:::

## Documentation

- [Commands & Permissions](./commands-permissions.mdx)
- [Developer API](./api.mdx)
- [Options & Configuration](./options.mdx)
- [Placeholders](./placeholders.mdx)
- Configuration guides: [main config](./config/config.mdx), [fish](./config/fish.mdx), [baits](./config/baits.mdx), [rods](./config/rods.mdx), [events](./config/events.mdx), [menus](./config/menus.mdx), and [language and names](./config/language-names.mdx).
