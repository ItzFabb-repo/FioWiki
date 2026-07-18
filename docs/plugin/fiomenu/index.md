---
title: About
sidebar_position: 1
---

# FioMenu

FioMenu is a YAML-driven menu plugin that serves Java inventory menus, Bedrock forms, Java dialogue layouts, prompt-based input flows, and utility-driven dynamic menus from one configuration system.

![FioMenu Java GUI](../../img/fiomenu/Java%20GUI.png)

## What the plugin actually includes

### Menu platforms

The current source ships with these menu families:

- Java inventory menus from `fio_menus/*.yml`
- Bedrock forms from `bedrock_fio_menus/*.yml`
- Java dialogue layouts from `fio_menus/dialog/*.yml`
- Prompt examples from `fio_menus/prompt/*.yml`

![FioMenu Bedrock UI](../../img/fiomenu/Bedrock%20UI.png)

### Menu types and flows

The bundled YAML examples and config comments show support for:

- `CHEST` and other Bukkit inventory types
- `MERCHANT` with `menu.trades`
- `DIALOGUE` with `menu.dialogue`
- Bedrock `FLOODGATE` forms with `SIMPLE`, `CUSTOM`, and `MODAL`
- dynamic command registration through `menu.command` and `aliases`
- Bedrock allocation from Java menus through `menu.bedrock`

### Runtime features

The current build also includes:

- open-gate rules such as `permission`, `placeholder`, `money`, `world`, `item`, `meta`, `coordinates`, and `string`
- animated item borders and animated text from `animations.yml`
- placeholder layers from `placeholders.yml`
- translation keys from `translation.yml`
- menu sound sequences from `sounds.yml`
- admin tools for reloading, opening, force-opening, cloning, renaming, deleting, meta editing, and custom slot management

## Major systems

### Java inventory menus

Java menus use `menu.structures` plus token-based `items` sections. The bundled `example.yml`, `settings.yml`, `warps.yml`, `profile.yml`, and `dynamic_menu.yml` cover static buttons, dynamic materials, refresh-driven items, and placeholder-based rendering.

### Bedrock menu routing

FioMenu can route Bedrock players into `bedrock_fio_menus/*.yml` forms while Java players open the linked inventory menu. The bridge is defined by `menu.bedrock: "<id>"` on the Java side.

### Dialogue and prompt input

The source includes Java dialogue YAML under `fio_menus/dialog/` and prompt flows such as `[APROMPT]` and `[CPROMPT]` under `fio_menus/prompt/`.

![FioMenu Java Dialogue](../../img/fiomenu/Java%20Dialogue.png)

![FioMenu Bedrock Dialogue](../../img/fiomenu/Bedrock%20Dialogue%20UI.png)

### Translation and placeholder parsing

This build supports translation key tokens like `[gui.title]`, custom placeholder utilities like `%fiomenu_parse_trade%`, masking placeholders like `%fiomenu_masking_custom%`, and animated text placeholders like `%fiomenu_at:rainbow_text%`.

## Documentation map

Use these pages next:

- [Commands & Permissions](/plugin/fiomenu/commands-permissions)
- [Placeholders](/plugin/fiomenu/placeholders)
- [Meta](/plugin/fiomenu/meta)
- [Animation](/plugin/fiomenu/animation)
- [Config Overview](/plugin/fiomenu/config/explanation)

:::info[Page note]
This section is rebuilt from the current FioMenu source and explains how the YAML works in practice instead of presenting the wiki as a generic template pack.
:::
