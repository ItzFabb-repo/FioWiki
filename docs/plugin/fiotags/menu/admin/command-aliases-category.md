---
title: command-aliases-category.yml
---

# command-aliases-category.yml

Command aliases category GUI file: `menu/admin/command-aliases-category.yml`.

This menu edits grouped alias categories inside the command alias tree.

:::info[Purpose]
Use this page when you want to manage a nested alias group rather than a single flat alias entry.
:::

## Function
`command-aliases-category.yml` acts as the nested alias group selector.

At runtime it is used to:
1. Select an alias group.
2. Navigate between alias categories.
3. Return to the parent aliases menu.

## Structure
```yaml
command-aliases-category:
  title: "<#595959>Command Alias Category"
  rows: 6
  items:
    header: ...
    entries: ...
    back: ...
    prev: ...
    next: ...
```

## How to Read This Structure

- `title` identifies the alias-category submenu.
- `rows` controls the room used by the grouped alias list and paging controls.
- `items` contains the header, the category entries, the back button, and page navigation.
- Use this page to explain how aliases are grouped before they are assigned to a command route.

## Key Controls

- `entries` shows alias categories.
- `back` returns to the aliases menu.
- `prev` and `next` move through pages.

## Actions

The category alias menu uses the group selection action set:

- Clicking an entry selects or opens the group
- `[BACK]` returns to the parent aliases menu
- `[PAGE_PREVIOUS]` and `[PAGE_NEXT]` move through pages
- `[SOUND] UI_BUTTON_CLICK 1 1 master` gives click feedback

:::info[Page note]
This page is source-backed and keeps nested alias groups easy to manage.
:::

