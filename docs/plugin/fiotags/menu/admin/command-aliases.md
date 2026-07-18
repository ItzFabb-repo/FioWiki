---
title: command-aliases.yml
---

# command-aliases.yml

Command aliases GUI file: `menu/admin/command-aliases.yml`.

This menu edits the alias tree used by `/fiotags` commands.

:::info[Purpose]
Use this page when you want to adjust how short aliases map to the main user and admin command routes.
:::

## Function
`command-aliases.yml` groups alias editing for user and admin command trees.

At runtime it is used to:
1. Open user or admin alias groups.
2. Edit alias values and alias lists.
3. Return to the dashboard.

## Structure
```yaml
command-aliases:
  title: "<#595959>Command Aliases"
  rows: 6
  items:
    user-aliases: ...
    admin-aliases: ...
    back: ...
```

## How to Read This Structure

- `title` identifies the alias tree being edited.
- `rows` controls the inventory height for the alias options.
- `items` contains the buttons that open user aliases, admin aliases, and the return path.
- Use this page to document how a short alias maps to the real command route so the wiki stays practical rather than abstract.

## Key Controls

- `user-aliases` opens user command alias editing.
- `admin-aliases` opens admin command alias editing.
- `back` returns to the dashboard.

## Actions

The command aliases menu uses the alias editing action set:

- `[OPEN]` opens the alias submenus
- `[BACK]` returns to the dashboard
- `[RELOAD]` saves and reloads alias settings
- `[SOUND] UI_BUTTON_CLICK 1 1 master` gives click feedback

:::info[Page note]
This page is source-backed and keeps command alias editing grouped by command tree.
:::

