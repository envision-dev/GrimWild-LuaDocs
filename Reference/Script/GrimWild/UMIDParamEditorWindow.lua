---@class UMIDParamEditorWindow : UDraggableWindow
---@field public VB_Content UVerticalBox
---@field public MIDPtr TWeakObjectPtr<UMaterialInstanceDynamic>
---@field public SlotClass TSubclassOf<UMIDParamEditorSlot>
UMIDParamEditorWindow = {}

---@param SearchText string
function UMIDParamEditorWindow:FilterSlots(SearchText) end

---@return UMaterialInstanceDynamic
function UMIDParamEditorWindow:GetDynamicMaterialInstance() end

---@param MID UMaterialInstanceDynamic
function UMIDParamEditorWindow:Init(MID) end

---@param AddedSlot UVerticalBoxSlot
function UMIDParamEditorWindow:K2_CustomizeSlot(AddedSlot) end

function UMIDParamEditorWindow:K2_PostInit() end

