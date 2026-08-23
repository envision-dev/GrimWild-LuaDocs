---@meta
---One mod pack file available to the player: a saved list stored as a .json file, either in the player's
---own mod pack folder or shipped inside a discovered mod's ModPacks subfolder.
---@class FModPackFile : Struct
---@field public DisplayName string @The file name without its extension. Authored by whoever created the file, so it is shown verbatim and never translated.
---@field public AbsolutePath string
---@field public bCreatedByPlayer boolean @True for a file in the player's own folder, which can be deleted from the UI. False for a file shipped inside a mod, which is read-only.
FModPackFile = {}
