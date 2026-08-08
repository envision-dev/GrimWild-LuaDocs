---Dynamic State is a heterogeneous container of parameters that can be optionally saved or manipulated with mods or scripts.
---@class FDynamicState
---@field public OnAnyValueChanged MulticastDelegate|fun(PropertyName: string, PropertyType: EStatePropertyType) @Only fires when changing data from API (UDynamicStateLib), which is a preferred method for modifying properties.
---@field protected Properties_Numeric TMap<string, FStateProperty_Numeric>
---@field protected Properties_Name TMap<string, FStateProperty_Name>
---@field protected Properties_String TMap<string, FStateProperty_String>
FDynamicState = {}
