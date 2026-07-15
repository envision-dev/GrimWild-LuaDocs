---@class USteamUtilityLibrary : UBlueprintFunctionLibrary
USteamUtilityLibrary = {}

---Converts a Steam EResult value into a human-readable string.
---@param OutString string @[out] The resulting formatted string.
---@param Res integer @The EResult value returned by a Steam API call.
---@param bIncludeDescription? boolean @[default: false] When true, appends the official description.
function USteamUtilityLibrary.EResultToString(OutString, Res, bIncludeDescription) end

