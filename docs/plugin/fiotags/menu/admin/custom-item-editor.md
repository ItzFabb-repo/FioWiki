---
title: custom-item-editor.yml
---

# custom-item-editor.yml

Custom item editor GUI file: `menu/admin/custom-item-editor.yml`.

This menu edits provider-based custom items and head textures for tag sections.

:::info[Purpose]
Use this page when a tag entry should use an external item provider or a custom player-head texture.
:::

## Function
`custom-item-editor.yml` is the specialized item-provider editor.

At runtime it is used to:
1. Edit provider-based item ids.
2. Edit head texture values.
3. Edit related lore and item flags.
4. Return to the previous editor.

## Structure
```yaml
custom-item-editor:
  title: "<#595959>Custom Item Editor"
  rows: 6
  items:
    header: ...
    custom-item: ...
    head-texture: ...
    lore: ...
    item-flags: ...
    back: ...
```

## How to Read This Structure

- `title` labels the custom item editor.
- `rows` gives enough room for the custom-item, texture, lore, and flag controls.
- `items` contains the provider value, head texture, lore, flag, and back controls.
- Use this page when the tag item needs a provider-specific id or a custom head texture rather than a plain Bukkit material.

## Key Controls

- `custom-item` opens the provider id prompt.
- `head-texture` opens the texture prompt.
- `lore` opens the lore editor.
- `item-flags` opens the item-flag selector.
- `back` returns to the previous editor.

## Actions

The custom item editor uses the prompt and selector action set:

- `[CUSTOM_ITEM]` edits provider ids
- `[HEAD_TEXTURE]` edits the texture payload
- `[LORE]` edits lore lines
- `[ITEM_FLAGS]` opens the item flag selector
- `[BACK]` returns to the previous menu
- `[SOUND] UI_BUTTON_CLICK 1 1 master` gives click feedback

:::info[Page note]
This page is source-backed and keeps provider-specific item editing separate from the main editor.
:::

