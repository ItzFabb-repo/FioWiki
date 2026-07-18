---
title: list-editor.yml
---

# list-editor.yml

List editor GUI file: `menu/admin/list-editor.yml`.

This menu edits list-style values in the admin workflow.

:::info[Purpose]
Use this page when a field is stored as a list and needs add, remove, or page controls rather than a single prompt.
:::

## Function
`list-editor.yml` is the list editing screen used by several admin editors.

At runtime it is used to:
1. Browse the current list entries.
2. Add or remove values.
3. Page through long lists.
4. Return to the previous editor.

## Structure
```yaml
list-editor:
  title: "<#595959>List Editor"
  rows: 6
  items:
    header: ...
    entries: ...
    add: ...
    remove: ...
    back: ...
    prev: ...
    next: ...
```

## How to Read This Structure

- `title` labels the list editor screen.
- `rows` sets the room needed for list entries and navigation buttons.
- `items` contains the list rows plus add, remove, and paging controls.
- Use this page whenever a value is stored as an ordered list instead of a single prompt field.

## Key Controls

- `entries` shows list values.
- `add` creates a new value.
- `remove` removes the selected value.
- `back` returns to the previous editor.
- `prev` and `next` move through pages.

## Actions

The list editor uses the cursor/list action set:

- `[LIST_PAGE_PREV]` and `[LIST_PAGE_NEXT]` move through pages
- `LEFT`, `RIGHT`, `SHIFT_LEFT`, and `SHIFT_RIGHT` adjust list entries where supported
- `Q` or `DROP` removes entries in supported list flows
- `[BACK]` returns to the previous editor
- `[SOUND] UI_BUTTON_CLICK 1 1 master` gives click feedback

:::info[Page note]
This page is source-backed and keeps list editing consistent across admin menus.
:::

