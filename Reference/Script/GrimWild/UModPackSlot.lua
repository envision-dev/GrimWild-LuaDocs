---@meta
---One entry in a UModList: a single mod pack file. Never touches the file itself; owners decide what a
---click means and perform the actual read, write or delete themselves.
---@class UModPackSlot : UUserWidget
---@field protected TB_Name UGTextBlock
---@field protected I_CreatedByPlayer UGImage
---@field protected I_ShippedWithMod UGImage
---@field protected B_SetAsCurrent UGButton
---@field protected B_Delete UGButton
---@field public OnSetAsCurrentClicked MulticastDelegate|fun(PackSlot: UModPackSlot)
---@field public OnDeleteClicked MulticastDelegate|fun(PackSlot: UModPackSlot)
UModPackSlot = {}

---@return FModPackFile
function UModPackSlot:GetPackFile() end

---@return UWidget
function UModPackSlot:GetPathTooltip() end

function UModPackSlot:OnDeleteReleased() end

function UModPackSlot:OnSetAsCurrentReleased() end

---UMG hook fired at the end of Init.
function UModPackSlot:OnSlotInitialized() end

---@param SearchString string
---@return boolean
function UModPackSlot:MatchesTextFilter(SearchString) end

