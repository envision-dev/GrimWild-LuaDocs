---@class UGameTimeLib : UBlueprintFunctionLibrary
UGameTimeLib = {}

---Converts the given enum value to the amount of ticks it consists of
---@param InTime ETimeTicks_BP
---@return integer
function UGameTimeLib.GetTimeTicksValue(InTime) end

---@param InTicks integer
---@param OutTime FStructuredWorldTime @[out]
function UGameTimeLib.WorldTimeFromTicks(InTicks, OutTime) end

---@param InTime FStructuredWorldTime
---@return integer
function UGameTimeLib.WorldTimeToTicks(InTime) end

