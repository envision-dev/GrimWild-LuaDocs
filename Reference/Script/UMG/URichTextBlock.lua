---The rich text block
---* Fancy Text
---* No Children
---@class URichTextBlock : UTextLayoutWidget
---@field protected Text string @The text to display
---@field protected TextStyleSet UDataTable
---@field protected DecoratorClasses TArray<TSubclassOf<URichTextBlockDecorator>>
---@field protected bOverrideDefaultStyle boolean @True to specify the default text style for this rich text inline, overriding any default provided in the style set table
---@field protected DefaultTextStyleOverride FTextBlockStyle @Text style to apply by default to text in this block
---@field protected MinDesiredWidth number @The minimum desired size for the text
---@field protected TextTransformPolicy ETextTransformPolicy @The text transformation policy to apply to this text block
---@field protected TextOverflowPolicy ETextOverflowPolicy @Sets what happens to text that is clipped and doesn't fit within the clip rect for this widget
---@field protected DefaultTextStyle FTextBlockStyle
---@field protected InstanceDecorators TArray<URichTextBlockDecorator>
URichTextBlock = {}

---Remove all overrides made to the default text style and return to the style specified in the style set data table
function URichTextBlock:ClearAllDefaultStyleOverrides() end

---@param DecoratorClass TSubclassOf<URichTextBlockDecorator>
---@return URichTextBlockDecorator
function URichTextBlock:GetDecoratorByClass(DecoratorClass) end

---Creates a dynamic material for the default font or returns it if it already
---exists
---@return UMaterialInstanceDynamic
function URichTextBlock:GetDefaultDynamicMaterial() end

---Returns widgets text.
---@return string
function URichTextBlock:GetText() end

---@return UDataTable
function URichTextBlock:GetTextStyleSet() end

---Causes the text to reflow it's layout and re-evaluate any decorators
function URichTextBlock:RefreshTextLayout() end

---Set the auto wrap for this rich text block
---@param InAutoTextWrap boolean @to turn wrap on or off
function URichTextBlock:SetAutoWrapText(InAutoTextWrap) end

---Replaces the existing decorators with the list provided
---@param InDecoratorClasses TArray<TSubclassOf<URichTextBlockDecorator>>
function URichTextBlock:SetDecorators(InDecoratorClasses) end

---Sets the color and opacity of the default text in this rich text block
---@param InColorAndOpacity FSlateColor
function URichTextBlock:SetDefaultColorAndOpacity(InColorAndOpacity) end

---Dynamically set the default font info for this rich text block
---@param InFontInfo FSlateFontInfo @The new font info
function URichTextBlock:SetDefaultFont(InFontInfo) end

---@param InMaterial UMaterialInterface
function URichTextBlock:SetDefaultMaterial(InMaterial) end

---Sets the color and opacity of the default text drop shadow
---Note: if opacity is zero no shadow will be drawn
---@param InShadowColorAndOpacity FLinearColor
function URichTextBlock:SetDefaultShadowColorAndOpacity(InShadowColorAndOpacity) end

---Sets the offset that the default text drop shadow should be drawn at
---@param InShadowOffset FVector2D
function URichTextBlock:SetDefaultShadowOffset(InShadowOffset) end

---Dynamically set the default strike brush for this rich text block
---@param InStrikeBrush FSlateBrush @The new brush to use to strike through text
function URichTextBlock:SetDefaultStrikeBrush(InStrikeBrush) end

---Wholesale override of the currently established default text style
---@param InDefaultTextStyle FTextBlockStyle @The new text style to apply to all default (i.e. undecorated) text in the block
function URichTextBlock:SetDefaultTextStyle(InDefaultTextStyle) end

---Set the minimum desired width for this rich text block
---@param InMinDesiredWidth number @new minimum desired width
function URichTextBlock:SetMinDesiredWidth(InMinDesiredWidth) end

---Directly sets the widget text.
---Warning: This will wipe any binding created for the Text property!
---@param InText string @The text to assign to the widget
function URichTextBlock:SetText(InText) end

---Set the text overflow policy for this text block.
---@param InOverflowPolicy ETextOverflowPolicy @the new text overflow policy.
function URichTextBlock:SetTextOverflowPolicy(InOverflowPolicy) end

---@param NewTextStyleSet UDataTable
function URichTextBlock:SetTextStyleSet(NewTextStyleSet) end

---Set the text transformation policy for this text block.
---@param InTransformPolicy ETextTransformPolicy @the new text transformation policy.
function URichTextBlock:SetTextTransformPolicy(InTransformPolicy) end

