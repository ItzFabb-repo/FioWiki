---
title: tag-editor.yml
---

# tag-editor.yml

Tag editor GUI file: `menu/admin/tag-editor.yml`.

This menu edits the main tag metadata for a single tag.

:::info[Purpose]
Use this page when you need to change a tag's identifier, display text, category, priority, section blocks, or delete state.
:::

## Function
`tag-editor.yml` is the central tag editing screen in the admin workflow.

At runtime it is used to:
1. Edit identity fields with prompts.
2. Toggle tag enabled state.
3. Open the category selector.
4. Open section editors for locked, unclaim, and unlocked blocks.
5. Delete the current tag or return to the list.

## Structure
```yaml
tag-editor:
  title: "<#595959>Edit {tag_id}"
  rows: 6
  items:
    header: ...
    identifier: ...
    enabled: ...
    category: ...
    priority: ...
    tag-display: ...
    section: ...
    delete: ...
    back: ...
```

## How to Read This Structure

- `title` keeps the current tag id visible while editing.
- `rows` sets the screen size for all edit controls.
- `items` is the list of direct tag-edit actions and sub-editors.
- Fields like `identifier`, `enabled`, `category`, and `priority` are single-value actions, while `section.*` opens deeper YAML blocks.
- Use this page when you need to teach which part of the tag file each button edits.

## Key Controls

- `identifier` opens the tag rename prompt.
- `enabled` toggles the tag on or off.
- `category` opens the category selector.
- `priority` opens the priority input.
- `tag-display` edits the display string.
- `section.locked`, `section.unclaim`, and `section.unlocked` open the section editor.
- `delete` removes the tag from `tags.yml`.
- `back` returns to the tag list.

## Actions

This editor uses the core tag-edit action set:

- `[SET_INPUT]` opens prompts for text or numeric fields
- `[TOGGLE]` flips the enabled state
- `[CATEGORY]` opens the category selector
- `[OPEN]` opens the section editor
- `[DELETE_TAG]` removes the current tag
- `[BACK]` returns to the tag list
- `[RELOAD]` saves and reloads the registry
- `[SOUND] UI_BUTTON_CLICK 1 1 master` plays click feedback

:::info[Page note]
This page is source-backed and keeps the main tag edit flow centered on YAML fields.
:::

