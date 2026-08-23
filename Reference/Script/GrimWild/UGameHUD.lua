---@meta
---HUD used in GameMap
---@class UGameHUD : UHUDBase
---@field protected GameMenu UGameMenu
---@field protected CameraStickClass TSoftClassPtr<UCameraStick>
---@field protected CameraStickWidget UCameraStick
---@field protected PhotoModeWindowClass TSoftClassPtr<UPhotoModeWindow>
---@field protected PhotoModeWindow UPhotoModeWindow
UGameHUD = {}

---@return boolean
function UGameHUD:IsPhotoModeActive() end

function UGameHUD:SwitchGameMenu() end

