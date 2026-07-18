---
title: create-section.yml
---

# create-section.yml

Create section GUI file: `menu/admin/create-section.yml`.

This menu splits the create workflow into section-based editing.

:::info[Purpose]
Use this page when a new tag draft needs to move into grouped section editing instead of one long field form.
:::

## Function
`create-section.yml` routes the create workflow into section-specific branches.

At runtime it is used to:
1. Choose which section to edit.
2. Open the relevant field editor screens.
3. Confirm the create draft when ready.
4. Return to the create root.

## Structure
```yaml
create-section:
  title: "<#595959>Create Section"
  rows: 6
  items:
    header: ...
    section cards: ...
    confirm: ...
    back: ...
```

## How to Read This Structure

- `title` labels the section-creation screen.
- `rows` gives the layout enough room for section cards and the confirm/back buttons.
- `items` contains the section chooser plus the workflow controls.
- Use this page to explain how a new section is attached to a draft before the deeper editor opens.

## Key Controls

- Section cards open the relevant section editor path.
- `confirm` advances the draft when ready.
- `back` returns to the create root.

## Actions

The create section menu uses the branch action set:

- Section buttons open the related section editor
- `[CONFIRM]` advances the draft
- `[BACK]` returns to the create root
- `[SOUND] UI_BUTTON_CLICK 1 1 master` gives click feedback

:::info[Page note]
This page is source-backed and keeps draft editing split by section.
:::

