---@class UContentWidget : UPanelWidget
UContentWidget = {}

---@return UWidget
function UContentWidget:GetContent() end

---@return UPanelSlot
function UContentWidget:GetContentSlot() end

---@param Content UWidget
---@return UPanelSlot
function UContentWidget:SetContent(Content) end

