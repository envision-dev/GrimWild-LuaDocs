---@meta
---Developer settings for the Lua scripting subsystem.
---@class ULuaDevSettings : UDeveloperSettings
---@field public MaxScriptCallDepth integer @Maximum nesting of C++-initiated entries into script code. A script write can trigger a native broadcast that invokes another script callback, so this bounds the native stack that recursion consumes; the wall-clock watchdog cannot, because a tight recursion overflows long before any usable time budget expires.
ULuaDevSettings = {}

---Get Settings object
---@return ULuaDevSettings
function ULuaDevSettings.Get() end

