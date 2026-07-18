---
title: Developer API
sidebar_position: 5
---

# Developer API Usage

This guide is source-backed from the current FioTags API interfaces and their implementation in `FioTags-master`.

:::info[Scope]
The public API is exposed through `com.itzfabb.fiotag.api.FioTagApi` and registered through Bukkit services.
:::

---

## Getting the API Instance

:::info[Safe Optional Access]
Use provider lookup and null-check before using API.
:::

```java
import com.itzfabb.fiotag.api.FioTagApi;

FioTagApi api = FioTagApi.provider();
if (api != null) {
    // safe API usage
}
```

:::warning[Required Access Pattern]
If your plugin strictly depends on FioTags, fail early when provider is missing.
:::

```java
import com.itzfabb.fiotag.api.FioTagApi;

FioTagApi api = FioTagApi.provider();
if (api == null) {
    throw new IllegalStateException("FioTags API is not available.");
}
```

---

# API Interface Map
`FioTagApi` groups these domains:
- Tag registry/read APIs
- Player profile APIs
- Ownership/equip APIs
- Metadata APIs
- Forced-state/bypass APIs
- Count/state resolver APIs
- Display formatting APIs
- Utility APIs (menu open, syntax check, registry reload)

---

## Core Enums

### `TagPlayerState`
- `LOCKED`
- `UNCLAIM`
- `UNLOCKED`

### `ForcedTagState`
- `NONE`
- `LOCKED`
- `UNCLAIM`
- `UNLOCKED`

### `TagFormatMode`
- `MINIMESSAGE`
- `LEGACY_SECTION`
- `LEGACY_AMPERSAND`
- `PLAIN`

---

## Tag Registry API

Common methods:
- `Collection<TagDefinition> getTags()`
- `Collection<TagDefinition> getTagsByCategory(String categoryId)`
- `List<String> getTagIds()`
- `TagDefinition getTag(String tagId)`
- `boolean hasTag(String tagId)`
- `boolean isTagEnabled(String tagId)`
- `String getTagCategory(String tagId)`
- `int getTagPriority(String tagId)`
- `List<String> getCategories()`
- `void reloadTagRegistry()`

Example:
```java
for (String id : api.getTagIds()) {
    if (!api.isTagEnabled(id)) continue;
    String category = api.getTagCategory(id);
}
```

---

## Profile + Ownership API

Profile methods:
- `PlayerProfile loadProfile(UUID uuid, String playerName)`
- `void saveProfile(PlayerProfile profile)`

Ownership methods:
- `Set<String> getOwnedTags(UUID uuid, String playerName)`
- `boolean ownsTag(UUID uuid, String playerName, String tagId)`
- `boolean grantTag(UUID uuid, String playerName, String tagId)`
- `boolean revokeTag(UUID uuid, String playerName, String tagId)`

Example:
```java
UUID uuid = player.getUniqueId();
boolean granted = api.grantTag(uuid, player.getName(), "volcano");
if (granted) {
    // newly granted
}
```

---

## Equip + Display API

Equip methods:
- `String getEquippedTag(UUID uuid, String playerName)`
- `boolean hasEquippedTag(UUID uuid, String playerName)`
- `boolean equipTag(UUID uuid, String playerName, String tagId)`
- `boolean unequipTag(UUID uuid, String playerName)`

Display methods:
- `String getTagDisplay(String tagId)`
- `String getTagDisplay(String tagId, TagFormatMode mode)`
- `String formatTagDisplay(String miniMessage, TagFormatMode mode)`
- `String getEquippedTagDisplay(UUID uuid, String playerName, TagFormatMode mode)`
- `String getEquippedTagDisplay(Player player, TagFormatMode mode)`

Example:
```java
String legacy = api.getEquippedTagDisplay(player, TagFormatMode.LEGACY_AMPERSAND);
String plain = api.getEquippedTagDisplay(player, TagFormatMode.PLAIN);
```

---

## Metadata API

Methods:
- `Set<String> getMetadata(UUID uuid, String playerName)`
- `boolean hasMetadata(UUID uuid, String playerName, String metadata)`
- `boolean addMetadata(UUID uuid, String playerName, String metadata)`
- `boolean removeMetadata(UUID uuid, String playerName, String metadata)`

Example:
```java
api.addMetadata(uuid, player.getName(), "event.winner");
boolean has = api.hasMetadata(uuid, player.getName(), "event.winner");
```

---

## Custom Tag Token + History API

Token methods:
- `int getCustomTagTokens(UUID uuid, String playerName)`
- `int addCustomTagTokens(UUID uuid, String playerName, int amount)`
- `int takeCustomTagTokens(UUID uuid, String playerName, int amount)`
- `int setCustomTagTokens(UUID uuid, String playerName, int amount)`

History methods:
- `List<String> getCustomTagHistory(UUID uuid, String playerName)`
- `int getHistoryTagLimit(UUID uuid, String playerName)`
- `boolean setHistoryTagLimit(UUID uuid, String playerName, int limit)`

---

## Forced State + Bypass API

Forced state methods:
- `ForcedTagState getForcedTagState(UUID uuid, String playerName, String tagId)`
- `boolean setForcedTagState(UUID uuid, String playerName, String tagId, ForcedTagState state)`
- `boolean clearForcedTagState(UUID uuid, String playerName, String tagId)`
- `boolean applyTagState(UUID uuid, String playerName, String tagId, ForcedTagState state)`
- `boolean bypassTag(UUID uuid, String playerName, String tagId)`

Temporary bypass methods:
- `boolean setTemporaryBypass(UUID uuid, String playerName, String tagId, long expiresAtMillis)`
- `boolean clearTemporaryBypass(UUID uuid, String playerName, String tagId)`
- `long getTemporaryBypassExpiresAt(UUID uuid, String playerName, String tagId)`
- `boolean hasActiveTemporaryBypass(UUID uuid, String playerName, String tagId)`
- `boolean hasActiveTemporaryBypass(UUID uuid, String playerName, String tagId, long nowMillis)`

Example:
```java
// lock the tag state like admin flow
api.applyTagState(uuid, player.getName(), "volcano", ForcedTagState.LOCKED);

// temporary bypass for 1 hour
long expiresAt = System.currentTimeMillis() + 3600_000L;
api.setTemporaryBypass(uuid, player.getName(), "volcano", expiresAt);
```

---

## State Resolver + Counting API

Methods:
- `boolean canClaim(Player player, String tagId)`
- `TagPlayerState getTagState(Player player, String tagId)`
- `int countTagsByState(Player player, TagPlayerState state)`
- `int countTagsByState(Player player, TagPlayerState state, String categoryId)`

Example:
```java
int unclaim = api.countTagsByState(player, TagPlayerState.UNCLAIM);
int unlockedRank = api.countTagsByState(player, TagPlayerState.UNLOCKED, "rank");
```

---

## Menu + Requirement Utility API

Methods:
- `boolean openTagMenu(Player player)`
- `boolean isValidRequirementSyntax(String requirementLine)`

Example:
```java
boolean valid = api.isValidRequirementSyntax("permission:my.node");
if (valid) {
    api.openTagMenu(player);
}
```

---

## Threading and Safety

1. Call Bukkit/player state APIs on main thread.
2. Always check `FioTagApi.provider()` result before use.
3. Tag ids are normalized lowercase internally, but still pass stable ids from your plugin.
4. Prefer API methods over direct data file edits (`meta.yml`, `tags.yml`).

---

## plugin.yml Integration

In your plugin:

```yaml
softdepend:
  - FioTags
```

Then resolve API in `onEnable()`:

```java
import com.itzfabb.fiotag.api.FioTagApi;
import org.bukkit.plugin.java.JavaPlugin;

public final class MyPlugin extends JavaPlugin {
    private FioTagApi fioTagApi;

    @Override
    public void onEnable() {
        fioTagApi = FioTagApi.provider();
        if (fioTagApi != null) {
            getLogger().info("FioTags detected. Tags: " + fioTagApi.getTagIds().size());
        }
    }
}
```

---

## Minimal Integration Example

```java
import com.itzfabb.fiotag.api.FioTagApi;
import com.itzfabb.fiotag.api.TagFormatMode;
import org.bukkit.entity.Player;

public final class TagBridge {

    public static String renderDisplay(Player player) {
        FioTagApi api = FioTagApi.provider();
        if (api == null || player == null) return "";

        String equipped = api.getEquippedTagDisplay(player, TagFormatMode.PLAIN);
        if (equipped.isBlank()) return "(no tag)";
        return equipped;
    }

    public static boolean grantAndEquip(Player player, String tagId) {
        FioTagApi api = FioTagApi.provider();
        if (api == null || player == null) return false;

        boolean grantChanged = api.grantTag(player.getUniqueId(), player.getName(), tagId);
        boolean equipped = api.equipTag(player.getUniqueId(), player.getName(), tagId);
        return grantChanged || equipped;
    }
}
```
