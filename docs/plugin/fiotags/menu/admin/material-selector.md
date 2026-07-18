---
title: material-selector.yml
---

# material-selector.yml

Material selector GUI file: `menu/admin/material-selector.yml`.

This menu lists server-available materials for tag editors and section editors.

:::info[Purpose]
Use this page when you need to choose a material id without typing it manually.
:::

## Function
`material-selector.yml` is the paged material browser used by tag menus.

At runtime it is used to:
1. Browse materials.
2. Search or filter material options.
3. Return the chosen material to the calling editor.

## Structure
```yaml
material-selector:
  title: "<#595959>Material Selector"
  rows: 6
  items:
    header: ...
    entries: ...
    search: ...
    back: ...
    prev: ...
    next: ...
```

## How to Read This Structure

- `title` labels the material browser.
- `rows` controls how much room is available for the material cards and navigation buttons.
- `items` contains the header, searchable entry list, and back/page controls.
- `entries` is the part of the menu that returns the selected material to the editor that opened it.
- Use this page to explain not just what the selector shows, but also how the chosen material flows back into the tag or section editor.

## Key Controls

- `entries` shows material choices.
- `search` opens the material search prompt when available.
- `back` returns to the previous editor.
- `prev` and `next` move through pages.

## Actions

The material selector uses the selection action set:

- Clicking an entry selects the material
- `[PAGE_PREVIOUS]` and `[PAGE_NEXT]` move through pages
- `[BACK]` returns to the previous menu
- `[SOUND] UI_BUTTON_CLICK 1 1 master` gives click feedback

:::info[Page note]
This page is source-backed and stays focused on version-safe material selection.
:::

