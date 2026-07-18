---
title: update-settings.yml
---

# update-settings.yml

Update settings GUI file: `menu/admin/update-settings.yml`.

This menu controls update checker behavior.

:::info[Purpose]
Use this page when you want to turn update notifications on or off or refresh update settings from the admin UI.
:::

## Function
`update-settings.yml` groups update-related switches into one screen.

At runtime it is used to:
1. Toggle update checking.
2. Review the current update state.
3. Reload after saving changes.

## Structure
```yaml
update-settings:
  title: "<#595959>Update Checker"
  rows: 6
  items:
    enabled: ...
    back: ...
    reload: ...
```

## How to Read This Structure

- `title` labels the update checker screen.
- `rows` keeps the update controls and reload button easy to read.
- `items` contains the update toggle, the reload action, and the back button.
- Use this page to explain when the plugin checks for updates and what the reload control changes.

## Key Controls

- `enabled` toggles update checking.
- `back` returns to the dashboard.
- `reload` saves and reloads the plugin.

## Actions

The update settings menu uses the toggle and reload action set:

- `[TOGGLE]` flips the update checker state
- `[BACK]` returns to the dashboard
- `[RELOAD]` saves and reloads plugin data
- `[SOUND] UI_BUTTON_CLICK 1 1 master` gives click feedback

:::info[Page note]
This page is source-backed and keeps update behavior simple for admins.
:::

