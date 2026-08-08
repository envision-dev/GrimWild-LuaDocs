---One entry in a UModList: a single mod reference, resolved (or not) against UModManager's discovered mods.
---Never mutates UModManager; owners decide what a click means and perform the actual mutation themselves.
---@class UModSlot : UUserWidget
---@field protected I_Preview UGImage
---@field protected TB_Name UGTextBlock
---@field protected TB_Version UGTextBlock
---@field protected B_Background UButton
---@field protected B_Enable UGButton
---@field protected B_Disable UGButton
---@field protected B_Edit UGButton
---@field protected B_Fork UGButton
---@field protected B_MoveUp UGButton
---@field protected B_MoveDown UGButton
---@field protected B_GetFromWorkshop UGButton @Visible only when bMissing; lets the player search the Workshop for a replacement. Nothing binds OnGetFromWorkshopClicked in this prompt; the creator-side windows prompt wires it up.
---@field protected I_Modpack UGImage @Visible only when the resolved mod's EModType is ModPack; visibility is driven from C++ in Init().
---@field protected I_IsProject UGImage @Visible only when the resolved mod's EModSource is LocalProject; visibility is driven from C++ in Init().
---@field protected I_IsLocal UGImage @Visible only when the resolved mod's EModSource is Local; visibility is driven from C++ in Init().
---@field public OnSelected MulticastDelegate|fun(Slot: UModSlot)
---@field public OnEnableClicked MulticastDelegate|fun(Slot: UModSlot)
---@field public OnDisableClicked MulticastDelegate|fun(Slot: UModSlot)
---@field public OnEditClicked MulticastDelegate|fun(Slot: UModSlot)
---@field public OnForkClicked MulticastDelegate|fun(Slot: UModSlot)
---@field public OnMoveUpClicked MulticastDelegate|fun(Slot: UModSlot)
---@field public OnMoveDownClicked MulticastDelegate|fun(Slot: UModSlot)
---@field public OnGetFromWorkshopClicked MulticastDelegate|fun(Slot: UModSlot)
UModSlot = {}

---@return EModSlotLocation
function UModSlot:GetLocation() end

---@return FModReference
function UModSlot:GetModReference() end

---@return string
function UModSlot:GetProblemText() end

---@return UMod
function UModSlot:GetResolvedMod() end

---@return boolean
function UModSlot:HasProblem() end

---@return boolean
function UModSlot:IsMissing() end

---True when the resolved mod is a modpack. Also drives I_Modpack's visibility, set in Init().
---@return boolean
function UModSlot:IsResolvedModPack() end

---@return boolean
function UModSlot:IsSelected() end

function UModSlot:OnBackgroundReleased() end

function UModSlot:OnDisableReleased() end

function UModSlot:OnEditReleased() end

function UModSlot:OnEnableReleased() end

function UModSlot:OnForkReleased() end

function UModSlot:OnGetFromWorkshopReleased() end

function UModSlot:OnMoveDownReleased() end

function UModSlot:OnMoveUpReleased() end

---UMG hook: restyle for problem state. State is read back via HasProblem()/GetProblemText().
function UModSlot:OnProblemChanged() end

---UMG hook: restyle for selection state. State is read back via IsSelected().
function UModSlot:OnSelectionChanged() end

---UMG hook fired at the end of Init, e.g. to restyle for the missing state.
function UModSlot:OnSlotInitialized() end

---@param bInHasProblem boolean
---@param InProblemText string
function UModSlot:SetProblem(bInHasProblem, InProblemText) end

---@param bInSelected boolean
function UModSlot:SetSelected(bInSelected) end

---@param SearchString string
---@return boolean
function UModSlot:MatchesTextFilter(SearchString) end

