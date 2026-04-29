---@class ULoadingScreen : UUserWidget
---@field protected StatusText UTextBlock
---@field protected OverlayRenderTarget UTextureRenderTarget2D @Valid only with Overlay type. Destroyed after the loading screen is done
---@field protected Type ELoadingScreenType
ULoadingScreen = {}

function ULoadingScreen:Init_BP() end

---@param NewStatus string
function ULoadingScreen:SetStatusText(NewStatus) end

