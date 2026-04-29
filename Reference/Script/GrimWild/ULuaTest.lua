---Lua test framework
---@class ULuaTest : UObject
ULuaTest = {}

---@param FuncName string
---@param TableName string
---@return boolean
function ULuaTest.CallFunctionFromTable(FuncName, TableName) end

---Loads the given file and sets it as a global table with given name
---@param LuaFile string @: File name, relative to the Game folder ("Content/Lua/DevScripts/Example.lua")
---@param TableName string
---@return boolean
function ULuaTest.LoadFileInTable(LuaFile, TableName) end

---@param ExcludedDirs TArray<string>
---@param OutLuaFiles TArray<string> @[out]
function ULuaTest.ScanForLuaFiles(ExcludedDirs, OutLuaFiles) end

