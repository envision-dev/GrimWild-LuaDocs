---A single mod. Contains assets, modifications and configuration loaded from a mod.json manifest.
---@class UMod : UUGCItem
---@field public Id string @Identity key from mod.json "id". The only identity key; never derived from folder name, display name or Workshop fileId.
---@field public Type EModType
---@field public ItemName string @Display name as read from mod.json "name" field.
---@field public Version FEVersion
---@field public bHasValidVersion boolean
---@field public MinGameVersion FEVersion
---@field public bHasMinGameVersion boolean
---@field public MaxGameVersion FEVersion
---@field public bHasMaxGameVersion boolean
---@field public Description string @Plain short text shown on the in-game mod card. Separate content from the Workshop page description.
---@field public Authors TArray<string>
---@field public Dependencies TArray<FModReference> @Mods that must be loaded before this mod.
---@field public IncludedMods TArray<FModReference> @Only meaningful when Type == ModPack: the author's curated, ordered member list.
---@field public Source EModSource @Where this installed copy came from. Never read from the manifest; set by discovery.
---@field public SourceKey string @Local: path relative to its scan root. SteamWorkshop: fileId as decimal string. Set by discovery.
---@field public bRotten boolean @Set true once this instance is replaced by a fresh discovery pass (Rescan) or the owning UModManager is torn down (Deinitialize). Discovery always creates new UMod objects, so any code still holding a strong UMod* across a rescan can check this flag to detect that its pointer is a stale snapshot no longer present in DiscoveredModsView.
---@field public ScriptEnv UModScriptEnv @Script env for this mod's Lua scripts. Created in InitScriptEnv.
UMod = {}

---Sanitized visible name, falling back to Id when the sanitized result is empty. Used as the target
---folder name by UModBuilder and UModForker.
---@return string
function UMod:GetDefaultDirectoryName() end

