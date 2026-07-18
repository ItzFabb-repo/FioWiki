---
title: dashboard.yml
---

# dashboard.yml

Admin dashboard GUI file: `menu/admin/dashboard.yml`.

![FioTags Voucher Item](../../../../img/fiotags/FioTags%20VOUCHER_ITEM.png)

This is the main navigation hub for the FioTags admin menus.

:::info[Purpose]
Use this menu to jump into the tag registry, editors, selectors, and utility screens without exposing every edit control at once.
:::

## Function
`dashboard.yml` groups the main admin routes into a single starting screen.

At runtime it is used to:
1. Open the tag registry.
2. Open language, placeholder, sync, alias, update, preview, and permission menus.
3. Open the tag create flow.
4. Save changes and reload plugin data.

## Structure
```yaml
dashboard:
  title: "<#595959>Admin Menu"
  rows: 6
  items:
    tags: ...
    language: ...
    placeholders: ...
    equipped-tag-sync: ...
    command-aliases: ...
    update-settings: ...
    preview-settings: ...
    permissions: ...
    create: ...
    reload: ...
    close: ...
```

## How to Read This Structure

- `title` is the dashboard label shown at the top of the inventory.
- `rows` defines the menu height and total slot capacity.
- `items` is the route map for every admin screen exposed here.
- Each route button should be documented with the page it opens so the wiki mirrors the actual navigation flow.
- Use this screen as the admin hub: add new destinations here first, then explain them in their own page.

## Key Controls

- `tags` opens the tag registry list.
- `language` opens the language selector.
- `placeholders` opens the placeholder reference list.
- `equipped-tag-sync` opens sync settings.
- `command-aliases` opens command alias editing.
- `update-settings` opens update checker settings.
- `preview-settings` opens preview controls.
- `permissions` opens the permission list.
- `create` opens the create flow.
- `reload` saves and reloads plugin data.
- `close` exits the dashboard.

## Actions

The dashboard uses the core navigation action set:

- `[OPEN]` routes to the other admin menus
- `[RELOAD]` saves changes and reloads plugin data
- `[CLOSE]` exits the inventory
- `[SOUND] UI_BUTTON_CLICK 1 1 master` plays click feedback before navigation

:::info[Page note]
This page is source-backed and keeps the dashboard focused on menu routing.
:::

