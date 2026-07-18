---
title: item-flag-selector.yml
---

# item-flag-selector.yml

Item flag selector GUI file: `menu/admin/item-flag-selector.yml`.

This menu lists item flags that can be applied to tag items and section items.

:::info[Purpose]
Use this page when you want to toggle visual flags such as hidden attributes or tooltip behavior.
:::

## Function
`item-flag-selector.yml` is a paged selector for Bukkit item flags.

At runtime it is used to:
1. Browse flag options.
2. Toggle selected flags.
3. Return the chosen flags to the caller.

## Structure
```yaml
item-flag-selector:
  title: "<#595959>Item Flags"
  rows: 6
  items:
    header: ...
    entries: ...
    back: ...
    prev: ...
    next: ...
```

## How to Read This Structure

- `title` labels the item-flag picker.
- `rows` controls the room used for the flag list and page controls.
- `items` contains the header, the flag entries, and the back button.
- Use this page to explain which flags are just visual and which ones affect how the item is shown in the GUI.

## Key Controls

- `entries` shows the available item flags.
- `back` returns to the previous editor.
- `prev` and `next` move through pages.

## Actions

The item-flag selector uses the selection action set:

- Clicking an entry toggles the flag
- `[PAGE_PREVIOUS]` and `[PAGE_NEXT]` move through pages
- `[BACK]` returns to the previous menu
- `[SOUND] UI_BUTTON_CLICK 1 1 master` gives click feedback

:::info[Page note]
This page is source-backed and keeps item-flag selection easy to read.
:::

