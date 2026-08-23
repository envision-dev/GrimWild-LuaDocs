---@meta
---@class FLuaScriptFileInfo : Struct
---@field public RequirePath string
---@field public DiskPath string
---@field public DisplayName string @Shown in UI. Kept separate from RequirePath because engine identity is case-normalized, which would otherwise force the lowercased form onto the display.
FLuaScriptFileInfo = {}
