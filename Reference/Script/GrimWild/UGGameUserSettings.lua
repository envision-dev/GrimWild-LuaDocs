---@class UGGameUserSettings : UGameUserSettings
---@field protected bDevModeEnabled boolean
---@field protected CameraMoveSensitivity number
---@field protected CameraZoomSensitivity number
UGGameUserSettings = {}

---@return UGGameUserSettings
function UGGameUserSettings.Get() end

---@return number
function UGGameUserSettings:GetCameraMoveSensitivity() end

---@return number
function UGGameUserSettings:GetCameraZoomSensitivity() end

---@return boolean
function UGGameUserSettings:GetDevModeEnabled() end

---@return integer
function UGGameUserSettings.GetSpritePoolCycleInterval() end

---@return integer
function UGGameUserSettings.GetSpritePoolLifespan() end

---@return integer
function UGGameUserSettings.GetTextureAtlasSizeInSlots() end

---@return integer
function UGGameUserSettings.GetTextureQualityMultiplier() end

---@param NewValue integer
function UGGameUserSettings.SetSpritePoolCycleInterval(NewValue) end

---@param NewValue integer
function UGGameUserSettings.SetSpritePoolLifespan(NewValue) end

---Please, double check this and TextureSizePerCell values so atlas size is always a power of 2 in size.
---Dangerous to use by mod devs. Game level should be restarted to apply changes.
---@param NewValue integer
function UGGameUserSettings.SetTextureAtlasSizeInSlots(NewValue) end

---Can only be 1, 0.5 or 0.25. Dangerous to use by mod devs. Game level should be restarted to apply changes.
---@param NewValue number
function UGGameUserSettings.SetTextureQualityMultiplier(NewValue) end

