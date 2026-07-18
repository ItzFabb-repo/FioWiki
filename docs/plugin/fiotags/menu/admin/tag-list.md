---
title: tag-list.yml
---

# tag-list.yml

Admin tag list GUI file: `menu/admin/tag-list.yml`.

This menu shows the tag registry and opens the tag editor from each entry.

:::info[Purpose]
Use this screen when you want to browse existing tags, sort them, or jump into creation and editing flows.
:::

## Function
`tag-list.yml` renders paged tag entries and the small control bar used to manage registry browsing.

At runtime it is used to:
1. Render enabled and disabled tags with state-specific visuals.
2. Open the tag editor from a selected entry.
3. Cycle sort mode.
4. Move through pages.
5. Return to the dashboard or open the create menu.

## Structure
```yaml
tag-list:
  title: "<#595959>Manage Tag"
  rows: 6
  entries:
    start-slot: 9
    end-slot: 44
    enabled: ...
    disabled: ...
  items:
    header: ...
    back: ...
    sort: ...
    create: ...
    prev: ...
    next: ...
```

## How to Read This Structure

- `title` labels the tag registry screen.
- `rows` controls the inventory height for the registry view.
- `entries` defines the paged tag card area.
- `items` contains the fixed controls around that area, such as back, sort, create, and page buttons.
- Use this page to explain where the list begins, where the dynamic tag cards appear, and which buttons affect browsing rather than editing.

## Key Controls

- `enabled` and `disabled` are the two entry visuals.
- `header` shows total tags and current page.
- `sort` cycles the current sort mode.
- `create` opens the tag creator.
- `back` returns to the dashboard.
- `prev` and `next` move through pages.

## Actions

The tag list uses the core registry action set:

- `[TAG_ENTRY]` opens the selected tag editor
- `[SORTING]` cycles the sort mode
- `[PAGE_PREVIOUS]` and `[PAGE_NEXT]` move through pages
- `[OPEN]` opens tag creation
- `[BACK]` returns to the dashboard
- `[RELOAD]` refreshes the registry
- `[SOUND] UI_BUTTON_CLICK 1 1 master` gives click feedback

:::info[Page note]
This page is source-backed and keeps the registry flow simple and direct.
:::

