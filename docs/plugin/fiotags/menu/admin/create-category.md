---
title: create-category.yml
---

# create-category.yml

Create category GUI file: `menu/admin/create-category.yml`.

This menu manages category creation during the create workflow.

:::info[Purpose]
Use this page when you need to add or pick a category before finishing a tag draft.
:::

## Function
`create-category.yml` is the category step for the creation flow.

At runtime it is used to:
1. Browse existing categories.
2. Add a new category.
3. Sort and page through entries.
4. Return to the previous create screen.

## Structure
```yaml
create-category:
  title: "<#595959>Create Category"
  rows: 6
  items:
    header: ...
    entries: ...
    add: ...
    sort: ...
    back: ...
    prev: ...
    next: ...
```

## How to Read This Structure

- `title` labels the category creation screen.
- `rows` gives the selector enough room for the category list and paging controls.
- `items` contains the header, category entries, add button, sort button, and navigation buttons.
- Use this page to explain how a new category is created or selected before the draft continues.

## Key Controls

- `entries` shows the available categories.
- `add` creates a new category.
- `sort` cycles the order.
- `back` returns to the create flow.
- `prev` and `next` move through pages.

## Actions

The create category menu uses the branch selection action set:

- Clicking a category selects it
- `[ADD_CATEGORY]` creates a category
- `[SORTING]` cycles sort mode
- `[PAGE_PREVIOUS]` and `[PAGE_NEXT]` move through pages
- `[BACK]` returns to the previous create menu
- `[SOUND] UI_BUTTON_CLICK 1 1 master` gives click feedback

:::info[Page note]
This page is source-backed and keeps category creation in the same guided flow.
:::

