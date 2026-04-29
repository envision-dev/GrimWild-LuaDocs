---A simple static text widget.
---* No Children
---* Text
---@class UTextBlock : UTextLayoutWidget
---@field public Text string @The text to display
---@field public TextDelegate Delegate @A bindable delegate to allow logic to drive the text of the widget
---@field public ColorAndOpacity FSlateColor @The color of the text
---@field public ColorAndOpacityDelegate Delegate @A bindable delegate for the ColorAndOpacity.
---@field public Font FSlateFontInfo @The font to render the text with
---@field public StrikeBrush FSlateBrush @The brush to strike through text with
---@field public ShadowOffset FVector2D @The direction the shadow is cast
---@field public ShadowColorAndOpacity FLinearColor @The color of the shadow
---@field public ShadowColorAndOpacityDelegate Delegate @A bindable delegate for the ShadowColorAndOpacity.
---@field public MinDesiredWidth number @The minimum desired size for the text
---@field public bWrapWithInvalidationPanel boolean @If true, it will automatically wrap this text widget with an invalidation panel
---@field public TextTransformPolicy ETextTransformPolicy @The text transformation policy to apply to this text block.
---@field public TextOverflowPolicy ETextOverflowPolicy @Sets what happens to text that is clipped and doesn't fit within the clip rect for this widget
---@field protected bSimpleTextMode boolean @If this is enabled, text shaping, wrapping, justification are disabled in favor of much faster text layout and measurement. This feature is only suitable for "simple" text (ie, text containing only numbers or basic ASCII) as it disables the complex text rendering support required for certain languages (such as Arabic and Thai). It is significantly faster for text that can take advantage of it (particularly if that text changes frequently), but shouldn't be used for localized user-facing text.
UTextBlock = {}

---@return UMaterialInstanceDynamic
function UTextBlock:GetDynamicFontMaterial() end

---@return UMaterialInstanceDynamic
function UTextBlock:GetDynamicOutlineMaterial() end

---Gets the widget text
---@return string
function UTextBlock:GetText() end

---Set the auto wrap for this text block.
---@param InAutoTextWrap boolean @to turn wrap on or off.
function UTextBlock:SetAutoWrapText(InAutoTextWrap) end

---Sets the color and opacity of the text in this text block
---@param InColorAndOpacity FSlateColor
function UTextBlock:SetColorAndOpacity(InColorAndOpacity) end

---Dynamically set the font info for this text block
---@param InFontInfo FSlateFontInfo @The new font info
function UTextBlock:SetFont(InFontInfo) end

---@param InMaterial UMaterialInterface
function UTextBlock:SetFontMaterial(InMaterial) end

---@param InMaterial UMaterialInterface
function UTextBlock:SetFontOutlineMaterial(InMaterial) end

---Set the minimum desired width for this text block
---@param InMinDesiredWidth number @new minimum desired width
function UTextBlock:SetMinDesiredWidth(InMinDesiredWidth) end

---Sets the opacity of the text in this text block
---@param InOpacity number
function UTextBlock:SetOpacity(InOpacity) end

---Sets the color and opacity of the text drop shadow
---Note: if opacity is zero no shadow will be drawn
---@param InShadowColorAndOpacity FLinearColor
function UTextBlock:SetShadowColorAndOpacity(InShadowColorAndOpacity) end

---Sets the offset that the text drop shadow should be drawn at
---@param InShadowOffset FVector2D
function UTextBlock:SetShadowOffset(InShadowOffset) end

---Dynamically set the strike brush for this text block
---@param InStrikeBrush FSlateBrush @The new brush to use to strike through text
function UTextBlock:SetStrikeBrush(InStrikeBrush) end

---Directly sets the widget text.
---Warning: This will wipe any binding created for the Text property!
---@param InText string @The text to assign to the widget
function UTextBlock:SetText(InText) end

---Set the text overflow policy for this text block.
---@param InOverflowPolicy ETextOverflowPolicy @the new text overflow policy.
function UTextBlock:SetTextOverflowPolicy(InOverflowPolicy) end

---Set the text transformation policy for this text block.
---@param InTransformPolicy ETextTransformPolicy @the new text transformation policy.
function UTextBlock:SetTextTransformPolicy(InTransformPolicy) end

