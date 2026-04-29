---Visible Text value can be set using several ways:
---1) (prioritized) changing FText Text field by SetText() - used for formatted texts
---2) changing FEText EText field - handles automatic text getting and translation updating
---Use SetText() for regular FText.
---Use GetTargetText() and GetTargetToolTipText() for every type of text (E/F), it returns what's visible on the screen.
---@class UGTextBlock : UTextBlock
---@field protected EText FEText
---@field protected ETextToolTip FEText @Intended use: bind this value to SetupTooltip. UE default tooltip won't show this text, use TextTooltip field instead.
---@field public TextType ETextType
---@field public UseColorStyle boolean @If true, we use color style over the custom value defined in ColorAndOpacity field.
---@field public WidgetColorStyle FWidgetColorStyle
---@field public bDrawShadow boolean
---@field public bClipText boolean
UGTextBlock = {}

---Clears FText, making EText visible
function UGTextBlock:ClearFText() end

---@return FEText
function UGTextBlock:GetEText() end

---@return FEText
function UGTextBlock:GetETextToolTip() end

---@return string
function UGTextBlock:GetTargetText() end

---@return string
function UGTextBlock:GetTargetToolTipText() end

---@param bInDrawShadow boolean
function UGTextBlock:SetDrawShadow(bInDrawShadow) end

---Note: regular FText overrides EText if both are used. Clear the Text field to start showing EText.
---@param InEText FEText
function UGTextBlock:SetEText(InEText) end

---Note: regular FText overrides EText if both are used.
---@param InETextToolTip FEText
function UGTextBlock:SetETextToolTip(InETextToolTip) end

---@param bInClipText boolean
function UGTextBlock:SetTextClipping(bInClipText) end

---@param NewType ETextType
function UGTextBlock:SetTextType(NewType) end

function UGTextBlock:ApplyStyle() end

