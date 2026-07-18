---
title: section-editor.yml
---

# section-editor.yml

Section editor GUI file: `menu/admin/section-editor.yml`.

This menu edits the grouped fields for a tag section.

:::info[Purpose]
Use this page when you need to edit lore, material, item flags, banner patterns, durability, requirements, commands, or indicator lines for a tag state section.
:::

## Function
`section-editor.yml` is the detailed editor for a tag's section blocks.

At runtime it is used to:
1. Edit section lore and display fields.
2. Open the material selector or head texture prompt.
3. Edit custom item provider values.
4. Manage item flags, banner patterns, and durability.
5. Edit requirements, commands, and indicator lines.

## Structure
```yaml
section-editor:
  title: "<#595959>{tag_id} {section}"
  rows: 6
  items:
    header: ...
    lore: ...
    material: ...
    head-texture: ...
    custom-item: ...
    name: ...
    item-flags: ...
    banner-patterns: ...
    durability: ...
    unclaim.requirements: ...
    unclaim.commands: ...
    unlocked.required: ...
    unlocked.equip-indicator: ...
    unlocked.unequip-indicator: ...
    back: ...
```

## How to Read This Structure

- `title` shows both the tag id and the section name so the editor stays context-aware.
- `rows` reserves space for the field shortcuts and helper buttons.
- `items` contains the field editors for the active section.
- Use this menu as the place to explain one section at a time, especially when the section contains lore, commands, requirements, and item visuals together.

## Key Controls

- `lore` opens the lore editor.
- `material` opens the material selector.
- `head-texture` edits the head texture.
- `custom-item` edits provider-based custom item ids.
- `name` edits the display name.
- `item-flags` opens the item-flag selector.
- `banner-patterns` edits banner or shield patterns.
- `durability` edits the durability value.
- `requirements` edits the unclaim requirement list.
- `commands` edits the command reward list.
- `required` edits the unlocked requirement list.
- `equip-indicator` and `unequip-indicator` edit the indicator lines.
- `back` returns to the tag editor.

## Actions

The section editor uses the core field and list action set:

- `[LORE]` edits lore lines
- `[MATERIAL]` opens the material selector
- `[HEAD_TEXTURE]` edits player-head texture data
- `[CUSTOM_ITEM]` edits provider-based custom item values
- `[NAME]` edits the display name
- `[ITEM_FLAGS]` opens the item flag list
- `[BANNER_PATTERNS]` opens the banner pattern editor
- `[DURABILITY]` edits durability
- `[REQUIREMENTS]` edits the unclaim requirement list
- `[REQUIRED]` edits the unlocked requirement list
- `[COMMANDS]` edits reward commands
- `[EQUIP_INDICATOR]` and `[UNEQUIP_INDICATOR]` edit indicator text
- `[BACK]` returns to the tag editor
- `[SOUND] UI_BUTTON_CLICK 1 1 master` plays click feedback

:::info[Page note]
This page is source-backed and keeps section editing split into focused YAML blocks.
:::

