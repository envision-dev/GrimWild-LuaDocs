---@meta
---@class UEnvisionBitLib : UBlueprintFunctionLibrary
UEnvisionBitLib = {}

---@param EnumValue integer
---@return integer
---@return boolean bOutSuccess
function UEnvisionBitLib.GetBitIndexFromEnumValue(EnumValue) end

---@param WholeValue integer
---@param BitIndex integer
---@return boolean
function UEnvisionBitLib.GetBitState(WholeValue, BitIndex) end

---@param WholeValue integer
---@param BitIndex integer
---@param BitValue boolean
---@return integer
function UEnvisionBitLib.SetBitState(WholeValue, BitIndex, BitValue) end

