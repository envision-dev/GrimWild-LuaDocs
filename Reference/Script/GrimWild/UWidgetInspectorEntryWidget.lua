---@class UWidgetInspectorEntryWidget : UUserWidget
UWidgetInspectorEntryWidget = {}

---@return UImage
function UWidgetInspectorEntryWidget:CreateImageWidget() end

---@param MyObject UWidgetInspectorObject
---@param CurrentRoot UWidget
---@return string
function UWidgetInspectorEntryWidget:GetPathToCurrentRoot(MyObject, CurrentRoot) end

