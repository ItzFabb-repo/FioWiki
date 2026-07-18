---
title: Placeholders
sidebar_position: 4
---

# Placeholders
This page is source-backed from `FioTagExpansion` and the native placeholder resolver used in the current build.

:::info[Identifier]
FioTags PlaceholderAPI identifier is `fiotag`, so all placeholders use `%fiotag_<key>%`.
:::

## Placeholder Table
| Placeholder | Type | Description | Example Output |
|-------------|------|-------------|----------------|
| `%fiotag_tag_format%` | Player tag display | Active tag display using default output mode from config (`chat.tag-format.output-mode`). | `<gold>[VIP]</gold>` |
| `%fiotag_tag_format_console%` | Player tag display | Active tag display in plain text mode (console-safe). | `[VIP]` |
| `%fiotag_tag_format_log%` | Player tag display | Alias of `tag_format_console` (plain text mode). | `[VIP]` |
| `%fiotag_tag_format_minimessage%` | Player tag display | Active tag display forced to MiniMessage format. | `<gradient:#FCE38A:#F38181>[VIP]</gradient>` |
| `%fiotag_tag_format_legacy%` | Player tag display | Active tag display in section-color legacy format. | `\u00A76[VIP]` |
| `%fiotag_tag_format_legacy_ampersand%` | Player tag display | Active tag display in ampersand legacy format. | `&6[VIP]` |
| `%fiotag_tag_format_plain%` | Player tag display | Active tag display in plain text mode. | `[VIP]` |
| `%fiotag_total_unlocked%` | Count placeholder | Total tags currently unlocked/owned by player. | `42` |
| `%fiotag_total_unclaimed%` | Count placeholder | Total tags not owned yet but requirements are already met (ready to claim). | `9` |
| `%fiotag_locked_total%` | Count placeholder | Total tags currently locked for player. | `17` |
| `%fiotag_notify_unclaimtag_state%` | Player state | Unclaim join-notification state id. | `enabled` / `disabled` |
| `%fiotag_notify_customtagtoken_state%` | Player state | Custom-tag token notification state id. | `enabled` / `disabled` |
| `%fiotag_category%` | Category placeholder | Category of currently active/equipped tag. Returns `custom` if using custom tag display. | `rank` / `event` / `custom` |
| `%fiotag_category_<tagId>%` | Category placeholder | Category of a specific tag id. | `donation` |
| `%fiotag_category_unlocked_<categoryId>%` | Category count | Total unlocked tags within a category. | `12` |
| `%fiotag_category_unclaim_<categoryId>%` | Category count | Total unclaimed tags within a category. | `3` |
| `%fiotag_category_locked_<categoryId>%` | Category count | Total locked tags within a category. | `8` |

## Notes
1. `<tagId>` must match a valid tag identifier loaded by FioTags.
2. `<categoryId>` comparison is normalized to lowercase internally.
3. If a tag/category is unknown, category placeholders return empty string or `0` depending on placeholder type.
