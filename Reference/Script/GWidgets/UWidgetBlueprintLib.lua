---@class UWidgetBlueprintLib : UBlueprintFunctionLibrary
UWidgetBlueprintLib = {}

---Blueprint-exposed converting method
---@param Hex string
---@return FColor
function UWidgetBlueprintLib.ColorFromHex(Hex) end

---Makes the target canvas panel slot fill the whole parent Canvas widget
---@param InSlot UCanvasPanelSlot
function UWidgetBlueprintLib.FillCanvasWithSlot(InSlot) end

---Usage: Given Background shade, we return the shade that should be used for foreground widget
---Example: for High emphasis button, we should use dark foreground color
---@param InBackgroundShade EColorShade
---@return EColorShade
function UWidgetBlueprintLib.GetForegroundColorShade(InBackgroundShade) end

---@param InStyle FColorStyle
---@param InEmphasis EWidgetEmphasis
---@return FEmphasisColor
function UWidgetBlueprintLib.GetStyleColor(InStyle, InEmphasis) end

---@param InStyle FColorStyle
---@param InWidgetColor FWidgetColorStyle
---@return FColor
function UWidgetBlueprintLib.GetStyleColorShade(InStyle, InWidgetColor) end

---@param InTextType ETextType
---@return FTextStyle
function UWidgetBlueprintLib.GetTextStyle(InTextType) end

---Blueprint-exposed converting method. Format: "#RRGGBBAA" (AA optional)
---@param Color FColor
---@param bNoAlpha? boolean @[default: false]
---@return string
function UWidgetBlueprintLib.HexFromColor(Color, bNoAlpha) end

