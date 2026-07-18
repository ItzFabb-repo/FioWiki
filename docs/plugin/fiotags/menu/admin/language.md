---
title: language.yml
---

# language.yml

Language GUI file: `menu/admin/language.yml`.

This menu switches the active runtime language.

:::info[Purpose]
Use this page when you want to change the active language without editing `config.yml` by hand.
:::

## Function
`language.yml` is a paged selector for bundled language files.

At runtime it is used to:
1. Show available language entries.
2. Switch the active language code.
3. Return to the dashboard.

## Structure
```yaml
language:
  title: "<#595959>Language"
  rows: 6
  items:
    header: ...
    entries: ...
    back: ...
    prev: ...
    next: ...
```

## How to Read This Structure

- `title` labels the language selector screen.
- `rows` sets the menu height for language entries and page controls.
- `items` contains the header, language list, back button, and paging controls.
- `entries` is the section that actually switches the active language when clicked.
- Use this page to explain which bundled language file is active and what changes when the player picks another one.

## Key Controls

- `header` shows current language and available entries.
- `entries` shows bundled language files.
- `back` returns to the dashboard.
- `prev` and `next` move through pages.

## Actions

The language menu uses the selector action set:

- Clicking a language entry selects that language
- `[PAGE_PREVIOUS]` and `[PAGE_NEXT]` move through pages
- `[BACK]` returns to the dashboard
- `[SOUND] UI_BUTTON_CLICK 1 1 master` gives click feedback

:::info[Page note]
This page is source-backed and keeps the runtime language switch simple.
:::

