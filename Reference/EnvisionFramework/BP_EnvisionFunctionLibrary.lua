---@class BP_EnvisionFunctionLibrary_C : UBlueprintFunctionLibrary
BP_EnvisionFunctionLibrary_C = {}

---@param Bool boolean
---@param __WorldContext UObject
---@param CheckedState ECheckBoxState @[out]
function BP_EnvisionFunctionLibrary_C.BoolToCheckedState(Bool, __WorldContext, CheckedState) end

---@param Bool boolean
---@param Invert boolean
---@param VisibilityType ESlateVisibility
---@param __WorldContext UObject
---@param Visibility ESlateVisibility @[out]
function BP_EnvisionFunctionLibrary_C.BoolToVisibility(Bool, Invert, VisibilityType, __WorldContext, Visibility) end

---@param Str string
---@param __WorldContext UObject
---@param Date string @[out]
function BP_EnvisionFunctionLibrary_C.DateToText(Str, __WorldContext, Date) end

---@param Key FInputActionKeyMapping
---@param __WorldContext UObject
---@param Result string @[out]
BP_EnvisionFunctionLibrary_C["Get Full Action Key Mapping Name"] = function(Key, __WorldContext, Result) end

---"русский" -> "Русский"
---@param CultureCode string
---@param __WorldContext UObject
---@param VisibleName string @[out]
function BP_EnvisionFunctionLibrary_C.GetCultureVisibleName(CultureCode, __WorldContext, VisibleName) end

---Removes Build Number data
---@param FullString string
---@param __WorldContext UObject
---@param Version string @[out]
function BP_EnvisionFunctionLibrary_C.GetVersionFromProjectVersionString(FullString, __WorldContext, Version) end

---@param Num integer
---@param __WorldContext UObject
---@param Text string @[out]
function BP_EnvisionFunctionLibrary_C.Int32AsShortText(Num, __WorldContext, Text) end

---@param Index integer
---@param __WorldContext UObject
---@param Text string @[out]
function BP_EnvisionFunctionLibrary_C.MonthNumberToShortText(Index, __WorldContext, Text) end

