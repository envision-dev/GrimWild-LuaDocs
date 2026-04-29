---Global singleton used to manage mods at runtime
---@class UModManager : UGameInstanceSubsystem
---@field public PreRefreshCurrentModPack MulticastDelegate @---- Delegates ----
---@field public OnModPackRefreshed MulticastDelegate
---@field public OnPostModsLoad MulticastDelegate @Broadcast after all enabled mods have loaded their Lua main scripts.
---@field public DiscoveredMods TArray<UMod> @---- Data ----
---@field public EnabledMods TArray<UMod>
UModManager = {}

---@return UModManager
function UModManager.Get() end

---@return boolean
function UModManager:IsGameInitialized() end

---@param NewCulture string
function UModManager:OnCultureSet(NewCulture) end

---Gathers all useful object instance debug data into string
---@param DebugString string @[out]
function UModManager:GatherDebugData(DebugString) end

