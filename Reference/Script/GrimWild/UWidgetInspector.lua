---Developer tool that shows the widget hierarchy of any widget as a tree view.
---@class UWidgetInspector : UDraggableWindow
---@field public TV_Content UTreeView
---@field public Highlighter UWidgetHighlighter
UWidgetInspector = {}

---@param InObject UWidgetInspectorObject
---@return TArray<UWidgetInspectorObject>
function UWidgetInspector:CreateOrGetChildObjects(InObject) end

---@param InRootWidget UWidget
---@return UWidgetInspectorObject
function UWidgetInspector:CreateRootObject(InRootWidget) end

---@param ItemToSelect UWidgetInspectorObject
function UWidgetInspector:TrySelectItem(ItemToSelect) end

