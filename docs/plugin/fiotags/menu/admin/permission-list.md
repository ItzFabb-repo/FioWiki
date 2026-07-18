---
title: permission-list.yml
---

# permission-list.yml

Permission list GUI file: `menu/admin/permission-list.yml`.

This menu lists the permission nodes used by FioTags.

:::info[Purpose]
Use this page when you want to verify the exact permission node for a player command, admin action, or menu feature.
:::

## Function
`permission-list.yml` is a catalog view for permission nodes.

At runtime it is used to:
1. Show permission entries and descriptions.
2. Help staff document or copy the right node.
3. Return to the dashboard when finished.

## Structure
```yaml
permission-list:
  title: "<#595959>Permission List"
  rows: 6
  items:
    header: ...
    entries: ...
    back: ...
```

## How to Read This Structure

- `title` labels the permission reference screen.
- `rows` controls the amount of room used for permission rows and navigation.
- `items` contains the header, permission entries, and the back button.
- `entries` is the area you use to inspect or copy a permission node.
- Use this page to document the exact permission string, then describe what the permission unlocks in practice.

## Key Controls

- `header` provides context for the permission catalog.
- `entries` shows the permission nodes.
- `back` returns to the dashboard.

## Actions

The permission list uses the reference-browser action set:

- Clicking an entry inspects the permission node
- `[BACK]` returns to the dashboard
- `[SOUND] UI_BUTTON_CLICK 1 1 master` gives click feedback

:::info[Page note]
This page is source-backed and keeps permission lookup direct and readable.
:::

