---Stylized UBorder wrapper with Envision color style support.
---@class UGBorder : UBorder
---@field public WidgetColorStyle FWidgetColorStyle
---@field public bUseButtonBrush boolean
---@field public bUseButtonBrushTransparency boolean
UGBorder = {}

---@param bNewUseButtonBrush boolean
function UGBorder:SetUseButtonBrush(bNewUseButtonBrush) end

---@param bNewUseBrushTransparency boolean
function UGBorder:SetUseButtonBrushTransparency(bNewUseBrushTransparency) end

---@param NewStyle FWidgetColorStyle
function UGBorder:SetWidgetColorStyle(NewStyle) end

function UGBorder:ApplyStyle() end

