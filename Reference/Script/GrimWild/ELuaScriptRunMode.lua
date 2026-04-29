---@class ELuaScriptRunMode
---@field public Auto ELuaScriptRunMode [0] Inspect return value: table → Persistent, nil/non-table → FireAndForget. Default.
---@field public FireAndForget ELuaScriptRunMode [1] Execute body once, do not register. Body re-runs on every call.
---@field public Persistent ELuaScriptRunMode [2] Register module with full lifecycle. Error if script does not return a table.
ELuaScriptRunMode = {}
