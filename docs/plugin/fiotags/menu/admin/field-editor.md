---
title: field-editor.yml
---

# field-editor.yml

Field editor GUI file: `menu/admin/field-editor.yml`.

This menu edits a single scalar field in the admin workflow.

:::info[Purpose]
Use this page when a field is better edited through a prompt than through a full list or selector.
:::

## Function
`field-editor.yml` opens the direct prompt flow for a single value.

At runtime it is used to:
1. Open chat or sign prompts.
2. Collect a single scalar value.
3. Return to the previous editor after the value is saved.

## Structure
```yaml
field-editor:
  title: "<#595959>{field}"
  rows: 3
  items:
    header: ...
    input: ...
    back: ...
```

## How to Read This Structure

- `title` labels the single-field prompt screen.
- `rows` is smaller here because the editor only needs a compact prompt and back control.
- `items` contains the header, the prompt entry button, and the back button.
- Use this page when one value should be edited directly instead of through a full list or selector.

## Key Controls

- `header` shows the current field context.
- `input` opens the prompt.
- `back` returns to the previous menu.

## Actions

The field editor uses the direct-input action set:

- `[SET_INPUT]` opens the prompt for the target field
- `[BACK]` returns to the previous menu
- `[SOUND] UI_BUTTON_CLICK 1 1 master` gives click feedback

:::info[Page note]
This page is source-backed and keeps scalar edits out of the larger menus.
:::

