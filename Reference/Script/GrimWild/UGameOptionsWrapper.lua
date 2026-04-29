---Just a wrapper to support saving, loading, visual editing and BP access.
---NOTE: Every Manager instance references the same GameOption singleton.
---@class UGameOptionsWrapper : UGameInstanceSubsystem
UGameOptionsWrapper = {}

---READ-ONLY, BP changes won't affect the original state
---@return FDynamicState
function UGameOptionsWrapper.GetGameOptions() end

---READ-ONLY, BP changes won't affect the original state
---@return FDynamicState
function UGameOptionsWrapper.GetGameOptionsDefaults() end

