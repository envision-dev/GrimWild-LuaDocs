---Dynamic State is a heterogeneous container of parameters that can be optionally saved or manipulated with mods or scripts.
---To be properly used, it should be contained within the object inherited from IDynamicStateHolder interface.
---@class FDynamicState
---@field protected Properties_Numeric TMap<string, FStateProperty_Numeric>
---@field protected Properties_Name TMap<string, FStateProperty_Name>
---@field protected Properties_String TMap<string, FStateProperty_String>
FDynamicState = {}
