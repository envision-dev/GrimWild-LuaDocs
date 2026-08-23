---@meta
---Global singleton used to manage mods at runtime
---@class UModManager : UGameInstanceSubsystem
---@field protected DiscoveredMods TArray<UMod> @---- Data ----
---@field protected EnabledEntries TArray<FEnabledModEntry> @The enabled list and its order. Mirrors Saved/EnabledMods.json; rewritten there on every SetEnabledMods call.
---@field protected LoadedMods TArray<UMod> @Mods whose Lua env is actually registered right now, in load order. Independent of EnabledEntries so that Rescan() can freely re-resolve EnabledEntries without disturbing what is actually loaded.
---@field public PreRefreshCurrentModPack MulticastDelegate|fun() @---- Delegates ----
---@field public OnModPackRefreshed MulticastDelegate|fun()
---@field public OnPostModsLoad MulticastDelegate|fun() @Broadcast after all enabled mods have loaded their Lua main scripts.
---@field public OnDiscoveredModsChanged MulticastDelegate|fun() @Broadcast at the end of every discovery run (initial discovery and every Rescan). Carries nothing; subscribers re-read GetDiscoveredMods() themselves.
---@field public OnEnabledModsChanged MulticastDelegate|fun() @Broadcast after SetEnabledMods commits a new enabled list. Carries nothing; subscribers re-read GetEnabledEntries() themselves.
---@field public OnWorkshopDownloadProgressUpdated MulticastDelegate|fun(Progress: TArray<FWorkshopDownloadProgress>) @Broadcast roughly twice per second while any Workshop download is tracked, carrying every tracked id.
UModManager = {}

---Pure. Inserts installed-but-missing hard dependencies and reorders minimally to satisfy
---dependency-before-dependent.
---@param Proposed TArray<FEnabledModEntry>
---@return TArray<FEnabledModEntry>
function UModManager:BuildAutoFixedModList(Proposed) end

---Pure. Reorders minimally to satisfy dependency-before-dependent, enabling nothing.
---@param Proposed TArray<FEnabledModEntry>
---@return TArray<FEnabledModEntry>
function UModManager:BuildReorderedModList(Proposed) end

---Thin wrapper over QueryOwnPublishedItems: bOwned is true iff FileId is among the current user's published items.
---@param FileId string
---@param OnComplete fun(bOwned: boolean, FileId: string)
function UModManager:CheckWorkshopItemOwnership(FileId, OnComplete) end

---Refuses (ERROR) any path outside GetDefaultModPackFolder(): a mod-shipped pack is not the player's to delete.
---@param AbsolutePath string
---@return boolean
function UModManager:DeleteModPack(AbsolutePath) end

---Resolves a reference to a discovered mod. A pinned reference (Source != Unknown) must match Id + Source
---+ SourceKey exactly; an unpinned reference resolves to the first discovered mod with a matching Id.
---Returns nullptr when not found; a dead reference is an expected state, not an error.
---@param Reference FModReference
---@return UMod
function UModManager:FindDiscoveredMod(Reference) end

---@return UModManager
function UModManager.Get() end

---The player's own packs (re-enumerated on every call, since files can appear while the game runs)
---merged with the packs shipped by discovered mods, sorted alphabetically by DisplayName.
---@return TArray<FModPackFile>
function UModManager:GetAvailableModPacks() end

---@return TArray<FEnabledModEntry>
function UModManager:GetEnabledEntries() end

---The loaded mod's version. Empty when the mod is not loaded or its manifest version is invalid.
---@param Id string
---@return string
function UModManager:GetLoadedModVersion(Id) end

---Subscribed-but-not-yet-installed items, refreshed by the last Rescan()/discovery pass.
---@return TArray<FWorkshopPendingItem>
function UModManager:GetPendingWorkshopItems() end

---@return boolean
function UModManager:IsGameInitialized() end

---True when a mod with this id is enabled and its script environment loaded successfully. A mod that
---is enabled but failed to load cannot be interoperated with, so reporting it as present would make
---dependent mods fail in a confusing way.
---@param Id string
---@return boolean
function UModManager:IsModLoaded(Id) end

------- Steam Workshop consumption ----
---@return boolean
function UModManager:IsSteamAvailable() end

---Non-empty, 1-64 chars, every character in [a-z0-9_]. The single authority for mod id validity.
---@param Id string
---@return boolean
function UModManager.IsValidModId(Id) end

---Non-empty, no path separators, no '..', no character the file system rejects, no trailing dot or
---space, not a Windows reserved device name. Unbounded in length; Unicode is allowed.
---@param Name string
---@return boolean
function UModManager.IsValidModPackFileName(Name) end

---@param AbsolutePath string
---@param OutReferences TArray<FModReference> @[out, modified in place]
---@return boolean
function UModManager:LoadModPack(AbsolutePath, OutReferences) end

---Absolute path of the player mod pack file a display name maps to. Does not validate the name.
---@param DisplayName string
---@return string
function UModManager.MakePlayerModPackPath(DisplayName) end

---@param NewCulture string
function UModManager:OnCultureSet(NewCulture) end

---Live query of the current user's published items (fileId + title + modid KV tag), for the uploader UI
---to pick an update target from.
---@param OnComplete fun(bSuccess: boolean, Items: TArray<FOwnedWorkshopItem>)
function UModManager:QueryOwnPublishedItems(OnComplete) end

---Re-runs mod discovery across all sources. Safe to call while mods are enabled; an enabled mod whose
---disk copy vanished stays enabled in memory (its LoadedMods entry is untouched) and becomes a missing
---placeholder in EnabledEntries; it is never auto-disabled.
function UModManager:Rescan() end

---@param AbsolutePath string
---@param References TArray<FModReference>
---@return boolean
function UModManager:SaveModPack(AbsolutePath, References) end

---Live server query for items tagged with modid == Id, ranked by unique subscriptions. Always returns a
---candidate list for the player to choose from; never auto-picks or auto-subscribes.
---@param Id string
---@param OnComplete fun(bSuccess: boolean, Candidates: TArray<FWorkshopModCandidate>)
function UModManager:SearchWorkshopForModId(Id, OnComplete) end

---Applies the diff (unload/load as needed) and persists to Saved/EnabledMods.json.
---@param NewList TArray<FEnabledModEntry>
function UModManager:SetEnabledMods(NewList) end

---@param FileId string
---@param OnComplete fun(bSuccess: boolean, FileId: string)
function UModManager:SubscribeToWorkshopItem(FileId, OnComplete) end

---Starts polling FileId's download state and broadcasting it on OnWorkshopDownloadProgressUpdated
---until Steam reports the item installed. Widgets read that delegate; they never query Steam themselves.
---@param FileId string
function UModManager:TrackWorkshopDownload(FileId) end

---@param FileId string
---@param OnComplete fun(bSuccess: boolean, FileId: string)
function UModManager:UnsubscribeFromWorkshopItem(FileId, OnComplete) end

---Pure. Returns issues found in Proposed (missing/circular/duplicate deps, version and game-version mismatches).
---@param Proposed TArray<FEnabledModEntry>
---@return TArray<FModOrderIssue>
function UModManager:ValidateModList(Proposed) end

---Gathers all useful object instance debug data into string
---@return string DebugString @gathered debug data. Use Append() to support gathering from child subclasses
function UModManager:GatherDebugData() end

