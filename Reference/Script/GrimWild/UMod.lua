---A single mod. Contains assets, modifications and configuration loaded from a mod.json manifest.
---@class UMod : UUGCItem
---@field public ItemName string @Display name as read from mod.json "name" field.
---@field public ItemNameNormalized string @Lowercase FName version of ItemName, used for case-insensitive lookups.
---@field public Version string @Semantic version string as read from mod.json "version" field.
---@field public RequiredGameVersion string @Minimum required game version (semver string). Empty = no requirement.
---@field public RequiredDependencies TArray<string> @Mod names this mod depends on. Must be loaded before this mod.
---@field public ScriptOwner UModScriptOwner @Script owner for this mod's Lua scripts. Created in InitScriptOwner.
UMod = {}

