---@meta
---A published item owned by the current user, as returned live from Steam. Used by the uploader UI to pick an update target.
---@class FOwnedWorkshopItem : Struct
---@field public FileId string
---@field public Title string
---@field public ModId string @The item's "modid" key-value tag, if present. Empty if the item predates that tag or wasn't published by this system.
FOwnedWorkshopItem = {}
