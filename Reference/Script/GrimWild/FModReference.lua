---A reference to a mod by id, used wherever a mod is referenced: dependencies, includedMods,
---and the persisted enabled list. Id is the only identity key; Source/SourceKey are an optional
---pin toward a specific installed copy when more than one copy shares the same id.
---@class FModReference
---@field public Id string
---@field public MinVersion string @Optional. Empty means unset.
---@field public MaxVersion string @Optional. Empty means unset.
---@field public Source EModSource
---@field public SourceKey string @Local: path relative to its scan root. SteamWorkshop: fileId as decimal string.
FModReference = {}
