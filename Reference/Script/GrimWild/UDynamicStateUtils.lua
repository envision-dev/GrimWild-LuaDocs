---Since USTRUCTs cannot have methods, we should expose them to BP here
---@class UDynamicStateUtils : UBlueprintFunctionLibrary
UDynamicStateUtils = {}

---Bind Event
---@param InState FDynamicState @[out]
---@param PropertyName string
---@param PropertyType EStatePropertyType
---@param Event Delegate|fun()
---@return boolean
function UDynamicStateUtils.BindEventOnPropertyChange(InState, PropertyName, PropertyType, Event) end

---@param InState FDynamicState
---@param PropertyName string
---@return boolean
function UDynamicStateUtils.Contains_Name(InState, PropertyName) end

---Contains
---@param InState FDynamicState
---@param PropertyName string
---@return boolean
function UDynamicStateUtils.Contains_Numeric(InState, PropertyName) end

---@param InState FDynamicState
---@param PropertyName string
---@return boolean
function UDynamicStateUtils.Contains_String(InState, PropertyName) end

---Debug
---@param InState FDynamicState
---@return string
function UDynamicStateUtils.DebugDynamicState(InState) end

---@param InState FDynamicState @[out]
---@return TMap<string, FStateProperty_Name>
function UDynamicStateUtils.GetProperties_Name(InState) end

---Get Properties Ref
---@param InState FDynamicState @[out]
---@return TMap<string, FStateProperty_Numeric>
function UDynamicStateUtils.GetProperties_Numeric(InState) end

---@param InState FDynamicState @[out]
---@return TMap<string, FStateProperty_String>
function UDynamicStateUtils.GetProperties_String(InState) end

---@param InState FDynamicState @[out]
---@param PropertyName string
---@return FStateProperty_Name
function UDynamicStateUtils.GetProperty_Name(InState, PropertyName) end

---Get Property
---@param InState FDynamicState @[out]
---@param PropertyName string
---@return FStateProperty_Numeric
function UDynamicStateUtils.GetProperty_Numeric(InState, PropertyName) end

---@param InState FDynamicState @[out]
---@param PropertyName string
---@return FStateProperty_String
function UDynamicStateUtils.GetProperty_String(InState, PropertyName) end

---@param InProperty FStateProperty_Name
---@return EStatePropertyFlags
function UDynamicStateUtils.GetPropertyFlags_Name(InProperty) end

---Get Flags
---@param InProperty FStateProperty_Numeric
---@return EStatePropertyFlags
function UDynamicStateUtils.GetPropertyFlags_Numeric(InProperty) end

---@param InProperty FStateProperty_String
---@return EStatePropertyFlags
function UDynamicStateUtils.GetPropertyFlags_String(InProperty) end

---@param InState FDynamicState
---@param PropertyName string
---@return EStatePropertyType
function UDynamicStateUtils.GetPropertyType(InState, PropertyName) end

---@param InState FDynamicState
---@param PropertyName string
---@param OutCopy FStateProperty_Name @[out]
---@return boolean
function UDynamicStateUtils.GetPropertyUnchecked_Name(InState, PropertyName, OutCopy) end

---Get Property (Unchecked)
---@param InState FDynamicState
---@param PropertyName string
---@param OutCopy FStateProperty_Numeric @[out]
---@return boolean
function UDynamicStateUtils.GetPropertyUnchecked_Numeric(InState, PropertyName, OutCopy) end

---@param InState FDynamicState
---@param PropertyName string
---@param OutCopy FStateProperty_String @[out]
---@return boolean
function UDynamicStateUtils.GetPropertyUnchecked_String(InState, PropertyName, OutCopy) end

---@param InState FDynamicState
---@param PropertyName string
---@return string
function UDynamicStateUtils.GetPropertyValue_Name(InState, PropertyName) end

---Get Value
---@param InState FDynamicState
---@param PropertyName string
---@return number
function UDynamicStateUtils.GetPropertyValue_Numeric(InState, PropertyName) end

---@param InState FDynamicState
---@param PropertyName string
---@return string
function UDynamicStateUtils.GetPropertyValue_String(InState, PropertyName) end

---@param InState FDynamicState @[out]
---@param PropertyName string
function UDynamicStateUtils.Remove_Name(InState, PropertyName) end

---Remove
---@param InState FDynamicState @[out]
---@param PropertyName string
function UDynamicStateUtils.Remove_Numeric(InState, PropertyName) end

---@param InState FDynamicState @[out]
---@param PropertyName string
function UDynamicStateUtils.Remove_String(InState, PropertyName) end

---@param InProperty FStateProperty_Name @[out]
---@param NewFlags EStatePropertyFlags
function UDynamicStateUtils.SetPropertyFlags_Name(InProperty, NewFlags) end

---Set Flags
---@param InProperty FStateProperty_Numeric @[out]
---@param NewFlags EStatePropertyFlags
function UDynamicStateUtils.SetPropertyFlags_Numeric(InProperty, NewFlags) end

---@param InProperty FStateProperty_String @[out]
---@param NewFlags EStatePropertyFlags
function UDynamicStateUtils.SetPropertyFlags_String(InProperty, NewFlags) end

---@param InState FDynamicState @[out]
---@param PropertyName string
---@param NewValue string
function UDynamicStateUtils.SetPropertyValue_Name(InState, PropertyName, NewValue) end

---Set
---@param InState FDynamicState @[out]
---@param PropertyName string
---@param NewValue number
function UDynamicStateUtils.SetPropertyValue_Numeric(InState, PropertyName, NewValue) end

---@param InState FDynamicState @[out]
---@param PropertyName string
---@param NewValue string
function UDynamicStateUtils.SetPropertyValue_String(InState, PropertyName, NewValue) end

---Note: even if the Event was not bound here, it returns true. We check for property existence only
---@param InState FDynamicState @[out]
---@param PropertyName string
---@param PropertyType EStatePropertyType
---@param Event Delegate|fun()
---@return boolean
function UDynamicStateUtils.UnbindEventOnPropertyChange(InState, PropertyName, PropertyType, Event) end

