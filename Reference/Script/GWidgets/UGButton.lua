---@class UGButton : UButton
---@field public WidgetColorStyle FWidgetColorStyle
---@field public OnStyleApplied MulticastDelegate|fun()
---@field public bUseCustomCornerRadii boolean @Note: instead of hiding these props as protected and using getters and setters, we're free to modify them directly, so we can call ApplyStyle() manually once (not after every field change).
---@field public CustomCornerRadii FVector4 @X = Top Left, Y = Top Right, Z = Bottom Right, W = Bottom Left (matches FSlateBrushOutlineSettings::CornerRadii)
---@field public bNoBrushOutline boolean
UGButton = {}

---@param NewStyle FWidgetColorStyle
function UGButton:SetWidgetColorStyle(NewStyle) end

function UGButton:ApplyStyle() end

