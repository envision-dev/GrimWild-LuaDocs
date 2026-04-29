---Asset class that contains a list of parameter names and their default values.
---Any number of materials can reference these parameters and get new values when the parameter values are changed.
---@class UMaterialParameterCollection : UObject
---@field public StateId FGuid @Used by materials using this collection to know when to recompile.
---@field public ScalarParameters TArray<FCollectionScalarParameter>
---@field public VectorParameters TArray<FCollectionVectorParameter>
UMaterialParameterCollection = {}

---Gets the default value of a scalar parameter from a material collection.
---@param ParameterName string @- The name of the value to get the value of
---@param bParameterFound boolean @[out] - if a parameter with the input name was found
---@return number
function UMaterialParameterCollection:GetScalarParameterDefaultValue(ParameterName, bParameterFound) end

---Returns an array of the names of all the scalar parameters in this Material Parameter Collection *
---@return TArray<string>
function UMaterialParameterCollection:GetScalarParameterNames() end

---Gets the default value of a scalar parameter from a material collection.
---@param ParameterName string @- The name of the value to get the value of
---@param bParameterFound boolean @[out] - if a parameter with the input name was found
---@return FLinearColor
function UMaterialParameterCollection:GetVectorParameterDefaultValue(ParameterName, bParameterFound) end

---Returns an array of the names of all the vector parameters in this Material Parameter Collection *
---@return TArray<string>
function UMaterialParameterCollection:GetVectorParameterNames() end

