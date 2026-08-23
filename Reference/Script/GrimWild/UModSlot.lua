---@meta
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
---@field protected B_GenerateCodeWorkspace UGButton
---@field protected B_MoveUp UGButton
---@field protected B_MoveDown UGButton
---@field protected B_GetFromWorkshop UGButton @Visible only when the mod is absent from disk; lets the player search the Workshop for a replacement.
---@field protected B_FixDependencies UGButton @Named for what it moves: it lifts this mod's dependencies above it, it never moves this mod.
---@field protected I_HasWarnings UGImage @There is deliberately no error counterpart: an error-severity issue describes a relationship between several mods, so hanging it off one row would point the player at the wrong one.
---@field protected PB_Download UGProgressBar
---@field protected TB_DownloadStatus UGTextBlock
---@field protected I_IsProject UGImage @Visible only when the resolved mod's EModSource is LocalProject; visibility is driven from C++ in Init().
---@field protected I_IsLocal UGImage @Visible only when the resolved mod's EModSource is Local; visibility is driven from C++ in Init().
---@field protected Issues TArray<FModOrderIssue> @Validation findings that name this mod, kept as structured data so severity and text are derived where they are needed rather than stored twice.
---@field public OnSelected MulticastDelegate|fun(Slot: UModSlot)
---@field public OnEnableClicked MulticastDelegate|fun(Slot: UModSlot)
---@field public OnDisableClicked MulticastDelegate|fun(Slot: UModSlot)
---@field public OnEditClicked MulticastDelegate|fun(Slot: UModSlot)
---@field public OnForkClicked MulticastDelegate|fun(Slot: UModSlot)
---@field public OnGenerateCodeWorkspaceClicked MulticastDelegate|fun(Slot: UModSlot)
---@field public OnMoveUpClicked MulticastDelegate|fun(Slot: UModSlot)
---@field public OnMoveDownClicked MulticastDelegate|fun(Slot: UModSlot)
---@field public OnGetFromWorkshopClicked MulticastDelegate|fun(Slot: UModSlot)
---@field public OnFixDependenciesClicked MulticastDelegate|fun(Slot: UModSlot)
UModSlot = {}

---@return EModDiskState
function UModSlot:GetDiskState() end

---@return EModSlotLocation
function UModSlot:GetLocation() end

---@return UWidget
function UModSlot:GetModNameTooltip() end

---@return FModReference
function UModSlot:GetModReference() end

---Every issue naming this mod, one per line.
---@return string
function UModSlot:GetProblemText() end

---@return UMod
function UModSlot:GetResolvedMod() end

---@return UWidget
function UModSlot:GetWarningsTooltip() end

---True when a dependency of this mod is enabled but ordered after it, hard or optional.
---@return boolean
function UModSlot:HasOrderingIssue() end

---@return boolean
function UModSlot:HasProblem() end

---@return boolean
function UModSlot:IsMissing() end

---@return boolean
function UModSlot:IsSelected() end

function UModSlot:OnBackgroundReleased() end

function UModSlot:OnDisableReleased() end

function UModSlot:OnEditReleased() end

function UModSlot:OnEnableReleased() end

function UModSlot:OnFixDependenciesReleased() end

function UModSlot:OnForkReleased() end

function UModSlot:OnGenerateCodeWorkspaceReleased() end

function UModSlot:OnGetFromWorkshopReleased() end

function UModSlot:OnMoveDownReleased() end

function UModSlot:OnMoveUpReleased() end

---UMG hook: restyle for problem state. State is read back via HasProblem()/GetProblemText().
function UModSlot:OnProblemChanged() end

---UMG hook: restyle for selection state. State is read back via IsSelected().
function UModSlot:OnSelectionChanged() end

---UMG hook fired at the end of Init, e.g. to restyle for the absent state.
function UModSlot:OnSlotInitialized() end

---Fed from UModManager's download tracker by the owning window; the slot never polls Steam itself.
---@param bDownloading boolean
---@param BytesDownloaded integer
---@param BytesTotal integer
function UModSlot:SetDownloadProgress(bDownloading, BytesDownloaded, BytesTotal) end

---@param InIssues TArray<FModOrderIssue>
function UModSlot:SetIssues(InIssues) end

---@param bInSelected boolean
function UModSlot:SetSelected(bInSelected) end

---@param SearchString string
---@return boolean
function UModSlot:MatchesTextFilter(SearchString) end

