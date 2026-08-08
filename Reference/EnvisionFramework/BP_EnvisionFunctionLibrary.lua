---@class BP_EnvisionFunctionLibrary_C : UBlueprintFunctionLibrary
BP_EnvisionFunctionLibrary_C = {}

---@param Bool boolean
---@param __WorldContext UObject
---@return ECheckBoxState CheckedState
function BP_EnvisionFunctionLibrary_C.BoolToCheckedState(Bool, __WorldContext) end

---@param Bool boolean
---@param Invert boolean
---@param VisibilityType ESlateVisibility
---@param __WorldContext UObject
---@return ESlateVisibility Visibility
function BP_EnvisionFunctionLibrary_C.BoolToVisibility(Bool, Invert, VisibilityType, __WorldContext) end

---@param Str string
---@param __WorldContext UObject
---@return string Date
function BP_EnvisionFunctionLibrary_C.DateToText(Str, __WorldContext) end

---@param Key FInputActionKeyMapping
---@param __WorldContext UObject
---@return string Result
BP_EnvisionFunctionLibrary_C["Get Full Action Key Mapping Name"] = function(Key, __WorldContext) end

---"русский" -> "Русский"
---@param CultureCode string
---@param __WorldContext UObject
---@return string VisibleName
function BP_EnvisionFunctionLibrary_C.GetCultureVisibleName(CultureCode, __WorldContext) end

---Removes Build Number data
---@param FullString string
---@param __WorldContext UObject
---@return string Version
function BP_EnvisionFunctionLibrary_C.GetVersionFromProjectVersionString(FullString, __WorldContext) end

---@param Num integer
---@param __WorldContext UObject
---@return string Text
function BP_EnvisionFunctionLibrary_C.Int32AsShortText(Num, __WorldContext) end

---@param Index integer
---@param __WorldContext UObject
---@return string Text
function BP_EnvisionFunctionLibrary_C.MonthNumberToShortText(Index, __WorldContext) end

