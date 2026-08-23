---@meta
---Storage of the player's option intent.
---Game thread only. If you need thread safety, connect the option value to a c++ console variable.
---Setting an option value from code or UI goes through UOptionData::SetOptionValue() only. Writing into the state
---directly skips the validation and the apply step, leaving the saved value and the running game out of sync.
---UE options (VSync, WindowMode...) are mirrored here to have the standardized API.
---@class UGameOptions : UEngineSubsystem
---@field public CurrentState FDynamicState
---@field public DefaultState FDynamicState @Transient archetype of the options. We don't save (to disk) options that have values equal to defaults.
UGameOptions = {}

---@return UGameOptions
function UGameOptions.Get() end

---BP version. Identical to Get()
---@return UGameOptions
function UGameOptions.GetGameOptions() end

---@param OptionName string
---@return UOptionData
function UGameOptions.GetOptionData(OptionName) end

---@param OptionId FStatePropertyId
---@return boolean
---@return string OutValue
function UGameOptions:GetOptionValue(OptionId) end

---Resets CurrentState to Default values and flags, keeping the bound delegates
function UGameOptions:ResetAllToDefault() end

