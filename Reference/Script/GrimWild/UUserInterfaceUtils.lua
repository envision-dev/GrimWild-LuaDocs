---TODO Rename
---@class UUserInterfaceUtils : UBlueprintFunctionLibrary
UUserInterfaceUtils = {}

---Returns a text used primarily in tooltips. Format is held in "InputOptionTooltipText" translation key.
---{Option asset Visible Name}
---Shortcut: {Key}
---Note: returns plain String, so runtime language change won't affect the result.
---@param OptionAssetId FPrimaryAssetId
---@return string
function UUserInterfaceUtils.GetInputOptionTooltip(OptionAssetId) end

---Returns user-friendly input option value like "Shift+V" or "Middle Mouse Button"
---@param OptionAssetId FPrimaryAssetId
---@return string
function UUserInterfaceUtils.GetInputOptionVisibleKeyName(OptionAssetId) end

