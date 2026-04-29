---Blueprint function library exposing utility functions for Lua scripting.
---@class ULuaLibrary : UBlueprintFunctionLibrary
ULuaLibrary = {}

---Call a function exposed by a loaded script's module table. No arguments, no return.
---@param RequirePath string
---@param FunctionName string
---@return boolean
function ULuaLibrary.CallScriptFunction(RequirePath, FunctionName) end

---Returns true if a script with this require path is currently loaded.
---@param RequirePath string
---@return boolean
function ULuaLibrary.IsScriptLoaded(RequirePath) end

---Reload a previously-loaded persistent script.
---@param RequirePath string
---@return boolean
function ULuaLibrary.RestartScript(RequirePath) end

---Load and run a script.
---@param RequirePath string
---@return boolean
function ULuaLibrary.RunScript(RequirePath) end

---Toggle OnTick for a loaded persistent script.
---@param RequirePath string
---@param bEnabled boolean
function ULuaLibrary.SetTickEnabled(RequirePath, bEnabled) end

---Unload a persistent script. No-op if not loaded.
---@param RequirePath string
function ULuaLibrary.UnloadScript(RequirePath) end

