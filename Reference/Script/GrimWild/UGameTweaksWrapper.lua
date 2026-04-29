---@class UGameTweaksWrapper : UGameInstanceSubsystem
UGameTweaksWrapper = {}

---READ-ONLY, BP changes won't affect the original state
---@return FDynamicState
function UGameTweaksWrapper.GetGameTweaks() end

---READ-ONLY, BP changes won't affect the original state
---@return FDynamicState
function UGameTweaksWrapper.GetGameTweaksDefaults() end

