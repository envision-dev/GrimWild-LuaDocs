---@class UGButton : UButton
---@field public WidgetColorStyle FWidgetColorStyle
---@field public bUseCustomCornerRadii boolean
---@field public CustomCornerRadii FVector4 @X = Top Left, Y = Top Right, Z = Bottom Right, W = Bottom Left (matches FSlateBrushOutlineSettings::CornerRadii)
---@field public OnStyleApplied MulticastDelegate|fun()
UGButton = {}

---@param NewStyle FWidgetColorStyle
function UGButton:SetWidgetColorStyle(NewStyle) end

function UGButton:ApplyStyle() end

