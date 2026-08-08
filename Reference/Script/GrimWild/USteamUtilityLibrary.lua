---@class USteamUtilityLibrary : UBlueprintFunctionLibrary
USteamUtilityLibrary = {}

---Converts a Steam EResult value into a human-readable string.
---@param Res integer @The EResult value returned by a Steam API call.
---@param bIncludeDescription? boolean @[default: false] When true, appends the official description.
---@return string OutString @The resulting formatted string.
function USteamUtilityLibrary.EResultToString(Res, bIncludeDescription) end

---Strips characters the file system rejects, ".." sequences, and trailing dots/spaces, using the same
---mechanism UEnvisionStatics::IsSafeDirectoryName checks with so the two can never disagree. May return
---an empty string when nothing survives; callers handle the fallback.
---@param Name string
---@return string
function USteamUtilityLibrary.SanitizeDirectoryName(Name) end

