---
title: tag-category.yml
---

# tag-category.yml

Tag category GUI file: `menu/admin/tag-category.yml`.

This menu manages the categories assigned to the current tag.

:::info[Purpose]
Use this screen to select a category, add a new one, or reorder the category list when editing a tag.
:::

## Function
`tag-category.yml` provides a paged selector for tag categories.

At runtime it is used to:
1. Show the current category context for the tag.
2. Select or unselect a category entry.
3. Add a new category from chat prompt.
4. Sort and page through the category list.

## Structure
```yaml
tag-category:
  title: "<#595959>{tag_id} Category"
  rows: 6
  entries:
    start-slot: 9
    end-slot: 44
    selected: ...
    unselected: ...
  items:
    header: ...
    sort: ...
    add: ...
    back: ...
    prev: ...
    next: ...
```

## How to Read This Structure

- `title` keeps the category selector tied to the tag you are editing.
- `rows` reserves space for the category entries and navigation controls.
- `entries` is the dynamic list of categories shown on this page.
- `selected` and `unselected` are the two visual states used to show whether a category already applies to the tag.
- `items` holds the helper buttons for sorting, adding, paging, and going back.
- Use this page when you want to explain how a tag's category is chosen before returning to the editor.

## Key Controls

- `selected` shows the current category.
- `unselected` shows other categories that can be selected.
- `sort` cycles the sort mode.
- `add` opens the prompt to create a category.
- `back` returns to the tag editor.
- `prev` and `next` move through pages.

## Actions

The category selector uses the core selection action set:

- `[SELECT_CATEGORY]` selects the clicked category
- `[ADD_CATEGORY]` adds a new category
- `[SORTING]` cycles sort mode
- `[PAGE_PREVIOUS]` and `[PAGE_NEXT]` move through pages
- `[BACK]` returns to the tag editor
- `[SOUND] UI_BUTTON_CLICK 1 1 master` gives click feedback

:::info[Page note]
This page is source-backed and keeps category selection tied to the current tag being edited.
:::

