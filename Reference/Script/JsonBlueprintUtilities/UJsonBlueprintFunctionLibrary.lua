---@class UJsonBlueprintFunctionLibrary : UBlueprintFunctionLibrary
UJsonBlueprintFunctionLibrary = {}

---Creates a JsonObject from the provided Json file.
---@param WorldContextObject UObject
---@param File FFilePath
---@param OutJsonObject FJsonObjectWrapper @[out]
---@return boolean
function UJsonBlueprintFunctionLibrary.FromFile(WorldContextObject, File, OutJsonObject) end

---Creates a JsonObject from the provided Json string.
---@param WorldContextObject UObject
---@param JsonString string
---@param OutJsonObject FJsonObjectWrapper @[out]
---@return boolean
function UJsonBlueprintFunctionLibrary.FromString(WorldContextObject, JsonString, OutJsonObject) end

---Gets the value of the specified field.
---@param JsonObject FJsonObjectWrapper
---@param FieldName string
---@param OutValue integer @[out]
---@return boolean
function UJsonBlueprintFunctionLibrary.GetField(JsonObject, FieldName, OutValue) end

---Gets all field names on the JsonObject
---@param JsonObject FJsonObjectWrapper
---@param FieldNames TArray<string> @[out]
---@return boolean
function UJsonBlueprintFunctionLibrary.GetFieldNames(JsonObject, FieldNames) end

---Checks if the field exists on the object.
---@param JsonObject FJsonObjectWrapper
---@param FieldName string
---@return boolean
function UJsonBlueprintFunctionLibrary.HasField(JsonObject, FieldName) end

---Adds (new) or sets (existing) the value of the specified field.
---@param JsonObject FJsonObjectWrapper
---@param FieldName string
---@param Value integer
---@return boolean
function UJsonBlueprintFunctionLibrary.SetField(JsonObject, FieldName, Value) end

---@param Struct integer
---@param OutJsonString string @[out]
---@return boolean
function UJsonBlueprintFunctionLibrary.StructToJsonString(Struct, OutJsonString) end

---Creates a file from the provided JsonObject.
---@param JsonObject FJsonObjectWrapper
---@param File FFilePath
---@return boolean
function UJsonBlueprintFunctionLibrary.ToFile(JsonObject, File) end

---Creates a Json string from the provided JsonObject.
---@param JsonObject FJsonObjectWrapper
---@param OutJsonString string @[out]
---@return boolean
function UJsonBlueprintFunctionLibrary.ToString(JsonObject, OutJsonString) end

