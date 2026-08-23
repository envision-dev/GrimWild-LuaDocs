---@meta
---@class UObjectUPropertyViewer : UDraggableWindow
---@field public VB_Content UVerticalBox
---@field public ObjectPtr TWeakObjectPtr<UObject>
UObjectUPropertyViewer = {}

---@param SearchText string
function UObjectUPropertyViewer:FilterSlots(SearchText) end

---@return UObject
function UObjectUPropertyViewer:GetObject() end

---@param InObject UObject
---@param InContext FPropertySlotBuildContext
---@param bForceReadOnly? boolean @[default: false]
function UObjectUPropertyViewer:Init(InObject, InContext, bForceReadOnly) end

function UObjectUPropertyViewer:K2_PostInit() end

