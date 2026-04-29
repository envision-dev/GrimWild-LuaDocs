---@class UEnvisionBitLib : UBlueprintFunctionLibrary
UEnvisionBitLib = {}

---@param EnumValue integer
---@param bOutSuccess boolean @[out]
---@return integer
function UEnvisionBitLib.GetBitIndexFromEnumValue(EnumValue, bOutSuccess) end

---@param WholeValue integer
---@param BitIndex integer
---@return boolean
function UEnvisionBitLib.GetBitState(WholeValue, BitIndex) end

---@param WholeValue integer
---@param BitIndex integer
---@param BitValue boolean
---@return integer
function UEnvisionBitLib.SetBitState(WholeValue, BitIndex, BitValue) end

