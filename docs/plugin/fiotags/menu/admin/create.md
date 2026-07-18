---
title: create.yml
---

# create.yml

Create flow root GUI file: `menu/admin/create.yml`.

This menu starts the admin create workflow for new tag entries.

:::info[Purpose]
Use this page when you want to begin a new tag draft before branching into category, section, or field editing.
:::

## Function
`create.yml` is the entry point for tag creation in the admin UI.

At runtime it is used to:
1. Start a new draft.
2. Jump into focused edit paths.
3. Confirm the draft when ready.
4. Return to the dashboard.

## Structure
```yaml
create:
  title: "<#595959>Create Tag"
  rows: 6
  items:
    header: ...
    add: ...
    edit: ...
    confirm: ...
    back: ...
```

## How to Read This Structure

- `title` names the draft creation screen.
- `rows` gives enough room for the create buttons and back control.
- `items` is the workflow map for starting, editing, confirming, or leaving the draft.
- Use this page as the first step of the create flow, not as the final tag editor.

## Key Controls

- `add` begins the create flow.
- `edit` opens the current draft editor path.
- `confirm` commits the draft.
- `back` returns to the dashboard.

## Actions

The create root uses the draft action set:

- `[ADD]` begins the draft
- `[EDIT]` opens the focused edit path
- `[CONFIRM]` commits the current draft
- `[BACK]` returns to the dashboard
- `[SOUND] UI_BUTTON_CLICK 1 1 master` gives click feedback

:::info[Page note]
This page is source-backed and keeps the create flow as a guided draft process.
:::

