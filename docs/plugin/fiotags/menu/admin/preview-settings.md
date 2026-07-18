---
title: preview-settings.yml
---

# preview-settings.yml

Preview settings GUI file: `menu/admin/preview-settings.yml`.

This menu controls tag preview behavior.

:::info[Purpose]
Use this page when you need to configure whether preview is enabled, how nametags render, or how chat ghost preview behaves.
:::

## Function
`preview-settings.yml` groups preview switches into one screen.

At runtime it is used to:
1. Toggle the main preview feature.
2. Toggle right-click preview.
3. Edit nametag preview settings.
4. Edit chat ghost preview settings.

## Structure
```yaml
preview-settings:
  title: "<#595959>Preview Settings"
  rows: 6
  items:
    enabled: ...
    right-click: ...
    nametag: ...
    chat-ghost: ...
    back: ...
```

## How to Read This Structure

- `title` labels the preview configuration screen.
- `rows` gives the preview toggles and back button enough room to stay readable.
- `items` contains the toggles that control how tag previews are displayed.
- Use this page to explain preview behavior before a server owner changes how tags look in-game.

## Key Controls

- `enabled` toggles the main preview feature.
- `right-click` toggles right-click preview.
- `nametag` opens nametag preview settings.
- `chat-ghost` opens chat ghost preview settings.
- `back` returns to the dashboard.

## Actions

The preview menu uses the toggle and navigation action set:

- `[TOGGLE_PREVIEW_ENABLED]` toggles preview globally
- `[TOGGLE_RIGHT_CLICK]` toggles right-click preview
- `[NAMETAG_SETTINGS]` opens nametag preview settings
- `[CHAT_GHOST_SETTINGS]` opens chat ghost preview settings
- [NAMETAG_DURATION] edits preview duration
- `[BACK]` returns to the dashboard
- `[SOUND] UI_BUTTON_CLICK 1 1 master` gives click feedback

:::info[Page note]
This page is source-backed and keeps preview behavior in one control panel.
:::

