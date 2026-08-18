---FDynamicState API for Blueprint and Lua.
---@class UDynamicStateLib : UBlueprintFunctionLibrary
UDynamicStateLib = {}

---@param Handle FDynamicStateHandle
---@param PropertyName string
---@param PropertyType EStatePropertyType
---@param Event fun()
---@return boolean
function UDynamicStateLib.BindOnValueChanged(Handle, PropertyName, PropertyType, Event) end

---@param Handle FDynamicStateHandle
---@param PropertyName string
---@param Type EStatePropertyType
---@return boolean
function UDynamicStateLib.Contains(Handle, PropertyName, Type) end

---@param Handle FDynamicStateHandle
---@return string
function UDynamicStateLib.DebugState(Handle) end

---@param Handle FDynamicStateHandle
---@param PropertyName string
---@param Type EStatePropertyType
---@return EStatePropertyFlags
function UDynamicStateLib.GetFlags(Handle, PropertyName, Type) end

---@param Handle FDynamicStateHandle
---@param Type EStatePropertyType
---@return TArray<string>
function UDynamicStateLib.GetPropertyNames(Handle, Type) end

---@param Handle FDynamicStateHandle
---@param PropertyName string
---@return EStatePropertyType
function UDynamicStateLib.GetPropertyType(Handle, PropertyName) end

---@param Handle FDynamicStateHandle
---@param PropertyName string
---@return string
function UDynamicStateLib.GetValue_Name(Handle, PropertyName) end

---@param Handle FDynamicStateHandle
---@param PropertyName string
---@return number
function UDynamicStateLib.GetValue_Numeric(Handle, PropertyName) end

---@param Handle FDynamicStateHandle
---@param PropertyName string
---@return string
function UDynamicStateLib.GetValue_String(Handle, PropertyName) end

---@param Handle FDynamicStateHandle
---@param PropertyName string
---@param Type EStatePropertyType
---@return string
function UDynamicStateLib.GetValueAsString(Handle, PropertyName, Type) end

---Reports whether the state a handle refers to still exists. A handle does not keep its state
---alive, so one stored across frames can outlive it.
---@param Handle FDynamicStateHandle
---@return boolean
function UDynamicStateLib.IsHandleAlive(Handle) end

---Make FDynamicStateHandle from FDynamicState.
---@param State FDynamicState @[out, modified in place]
---@return FDynamicStateHandle
function UDynamicStateLib.MakeHandle(State) end

---@param Handle FDynamicStateHandle
---@param PropertyName string
---@param Type EStatePropertyType
function UDynamicStateLib.Remove(Handle, PropertyName, Type) end

---@param Handle FDynamicStateHandle
---@param PropertyName string
---@param Type EStatePropertyType
---@param NewFlags EStatePropertyFlags
function UDynamicStateLib.SetFlags(Handle, PropertyName, Type, NewFlags) end

---@param Handle FDynamicStateHandle
---@param PropertyName string
---@param NewValue string
function UDynamicStateLib.SetValue_Name(Handle, PropertyName, NewValue) end

---@param Handle FDynamicStateHandle
---@param PropertyName string
---@param NewValue number
function UDynamicStateLib.SetValue_Numeric(Handle, PropertyName, NewValue) end

---@param Handle FDynamicStateHandle
---@param PropertyName string
---@param NewValue string
function UDynamicStateLib.SetValue_String(Handle, PropertyName, NewValue) end

---@param Handle FDynamicStateHandle
---@param PropertyName string
---@param Type EStatePropertyType
---@param NewValue string
function UDynamicStateLib.SetValueFromString(Handle, PropertyName, Type, NewValue) end

---The return value reports whether the property exists, not whether a listener was removed:
---the underlying delegate gives no way to tell.
---@param Handle FDynamicStateHandle
---@param PropertyName string
---@param PropertyType EStatePropertyType
---@param Event fun()
---@return boolean
function UDynamicStateLib.UnbindOnValueChanged(Handle, PropertyName, PropertyType, Event) end

