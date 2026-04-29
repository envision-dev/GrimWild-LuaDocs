---@class UBPTextCleaner : UBlueprintFunctionLibrary
UBPTextCleaner = {}

---@param RawText string
---@return string
function UBPTextCleaner.CleanBlueprintText(RawText) end

---Returns compression ratio as a string like "47% smaller"
---@param Original string
---@param Cleaned string
---@return string
function UBPTextCleaner.GetCompressionStats(Original, Cleaned) end

