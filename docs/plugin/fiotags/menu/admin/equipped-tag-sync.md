---
title: equipped-tag-sync.yml
---

# equipped-tag-sync.yml

Equipped tag sync GUI file: `menu/admin/equipped-tag-sync.yml`.

This menu controls automatic validation for equipped tags.

:::info[Purpose]
Use this page when you need to tune when invalid equipped tags are checked and removed.
:::

## Function
`equipped-tag-sync.yml` controls the lifecycle-based validation switches.

At runtime it is used to:
1. Toggle the master sync state.
2. Toggle join, quit, world-change, death, and respawn checks.
3. Control whether unlocked-required validation stays strict.

## Structure
```yaml
equipped-tag-sync:
  title: "<#595959>Equipped Tag Sync"
  rows: 6
  items:
    enabled: ...
    on-join: ...
    on-quit: ...
    on-world-change: ...
    on-death: ...
    on-respawn: ...
    validate-unlocked-required: ...
    back: ...
```

## How to Read This Structure

- `title` identifies the sync settings page.
- `rows` gives the sync options and back button enough room to stay readable.
- `items` contains the master toggle and each event-specific validation toggle.
- `validate-unlocked-required` is a separate strictness switch, so explain it as a validation rule rather than a visual option.
- Use this page to show how equipped tags are checked across common player events.

## Key Controls

- `enabled` toggles the whole sync system.
- `on-join`, `on-quit`, `on-world-change`, `on-death`, and `on-respawn` control event checks.
- `validate-unlocked-required` controls strict unlocked validation.
- `back` returns to the dashboard.

## Actions

The sync settings use the toggle action set:

- `[TOGGLE]` flips the selected sync setting
- `[BACK]` returns to the dashboard
- `[SOUND] UI_BUTTON_CLICK 1 1 master` gives click feedback

:::info[Page note]
This page is source-backed and keeps equipped-tag validation under one control panel.
:::

