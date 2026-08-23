---@meta
---Root widget for the Mod Editor. Manages mod editor windows and tabs.
---@class UModEditor : UUserWidget
---@field protected B_Close UGButton
UModEditor = {}

---@return UMod
function UModEditor:GetProjectMod() end

---@return FModReference
function UModEditor:GetProjectReference() end

---Stub contract: always false today. The real editor will block closing while unsaved disk changes exist.
---@return boolean
function UModEditor:IsDirty() end

function UModEditor:OnClosePressed() end

