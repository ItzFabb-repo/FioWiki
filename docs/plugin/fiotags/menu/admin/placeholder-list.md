---
title: placeholder-list.yml
---

# placeholder-list.yml

Placeholder list GUI file: `menu/admin/placeholder-list.yml`.

This menu is the placeholder reference screen for admins.

:::info[Purpose]
Use this page when you want to inspect placeholder keys before wiring them into menus, tags, or language files.
:::

## Function
`placeholder-list.yml` is a browsing screen for placeholder discovery.

At runtime it is used to:
1. Show placeholder keys and their meanings.
2. Help staff check display or preview values.
3. Return to the dashboard when finished.

## Structure
```yaml
placeholder-list:
  title: "<#595959>Placeholder List"
  rows: 6
  items:
    header: ...
    entries: ...
    back: ...
```

## How to Read This Structure

- `title` labels the placeholder reference screen.
- `rows` controls the inventory height used for the reference cards.
- `items` contains the header, the placeholder entries, and the back button.
- `entries` is the part of the menu you use when you want to inspect one placeholder at a time.
- Use this page to explain what a placeholder returns and where it is meant to be copied into another config.

## Key Controls

- `header` explains the placeholder list context.
- `entries` shows placeholder rows.
- `back` returns to the dashboard.

## Actions

This screen uses the reference-browser action set:

- Clicking an entry inspects the placeholder
- `[BACK]` returns to the dashboard
- `[SOUND] UI_BUTTON_CLICK 1 1 master` gives click feedback

:::info[Page note]
This page is source-backed and keeps placeholder discovery simple.
:::

