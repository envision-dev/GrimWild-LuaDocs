---Stylized UImage wrapper with optional Envision color style tinting.
---@class UGImage : UImage
---@field public bApplyColorStyle boolean
---@field public WidgetColorStyle FWidgetColorStyle
UGImage = {}

---@param bNewApplyColorStyle boolean
function UGImage:SetApplyColorStyle(bNewApplyColorStyle) end

---@param NewStyle FWidgetColorStyle
function UGImage:SetWidgetColorStyle(NewStyle) end

function UGImage:ApplyStyle() end

