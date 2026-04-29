---@class UWidgetInspectorObject : UObject
---@field public Widget UWidget @The original widget we're inspecting
---@field public ParentTreeView UTreeView
---@field public Depth integer @How far we're placed from Inspector's root widget
---@field public PanelChildIndex integer @My index inside parent's Children array (for children of Panel widgets only; value < 0 = invalid)
---@field public Parent UWidgetInspectorObject
---@field public Children TArray<UWidgetInspectorObject> @Generated at 1st attempt to get children. Stored in persistent place to prevent from GC
---@field public bExpanded boolean
UWidgetInspectorObject = {}

