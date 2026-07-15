---@class UDynamicStateViewer : UDraggableWindow
---@field public VB_Content UVerticalBox
---@field public ObjectPtr TWeakObjectPtr<UWorldObject>
UDynamicStateViewer = {}

---@param SearchText string
function UDynamicStateViewer:FilterSlots(SearchText) end

---@return UWorldObject
function UDynamicStateViewer:GetObject() end

---@param InObject UWorldObject
---@param bReadOnly? boolean @[default: false]
function UDynamicStateViewer:Init(InObject, bReadOnly) end

---@param AddedSlot UVerticalBoxSlot
function UDynamicStateViewer:K2_CustomizeSlot(AddedSlot) end

function UDynamicStateViewer:K2_PostInit() end

