---@meta
---Main menu window for enabling/disabling mods. Player actions on ML_Discovered/ML_Enabled only edit a
---local draft; the draft is validated after every change but only reaches UModManager when the player
---explicitly presses Apply, Fix (locally) or ForceApply.
---@class UModsWindow : UUserWidget
---@field protected B_Close UGButton
---@field protected SearchBox USearchBox
---@field protected ML_Discovered UModList
---@field protected ML_Enabled UModList
---@field protected B_Apply UGButton
---@field protected B_ForceApply UGButton
---@field protected B_Fix UGButton
---@field protected B_Reset UGButton
---@field protected B_ModPacks UGButton
---@field protected B_SaveAsPack UGButton
---@field protected B_DisableAll UGButton
---@field protected B_Refresh UGButton
---@field protected B_DownloadMissing UGButton @Visible only while the draft holds at least one entry that resolves to nothing installed.
---@field protected I_UnappliedChangesPresent UGImage @Decorative indicator only (unlike I_ApplyBlocker/I_ForceApplyBlocker, Close is never hard-blocked); the confirmation happens in OnClosePressed.
---@field protected I_UnappliedChanges UGImage
---@field protected I_ApplyBlocker UGImage @Overlay that eats the click when Apply is blocked; B_Apply itself stays enabled permanently so it always looks clickable and can carry its own tooltip.
---@field protected I_ForceApplyBlocker UGImage @Same click-eating role as I_ApplyBlocker.
---@field protected HB_Issues_Warnings UHorizontalBox
---@field protected TB_IssueNumber_Warning UGTextBlock
---@field protected HB_Issues_Errors UHorizontalBox
---@field protected TB_IssueNumber_Error UGTextBlock
---@field protected ModInfo UModInfo
---@field protected ForkModOptionsWindowWidget UForkModOptionsWindow @Owned dialogs, created on demand and destroyed on close (see OnCloseRequested handlers below).
---@field protected ModDownloadWindowWidget UModDownloadWindow_SteamWorkshop
---@field protected ModPacksWindowWidget UModPacksWindow
---@field protected SaveModListAsPackWindowWidget USaveModListAsPackWindow
---@field protected CodeWorkspaceGenerator UModCodeWorkspaceGenerator @The only strong reference keeping a generation alive; non-null doubles as the busy guard.
UModsWindow = {}

---@return integer
function UModsWindow:GetErrorCount() end

---@return UWidget
function UModsWindow:GetErrorsTooltip() end

---@return integer
function UModsWindow:GetWarningCount() end

---@return UWidget
function UModsWindow:GetWarningsTooltip() end

function UModsWindow:OnApplyPressed() end

function UModsWindow:OnCloseConfirmed() end

function UModsWindow:OnClosePressed() end

---@param bSuccess boolean
---@param ResultPath string
function UModsWindow:OnCodeWorkspaceGeneratorCompleted(bSuccess, ResultPath) end

function UModsWindow:OnDisableAllConfirmed() end

function UModsWindow:OnDisableAllPressed() end

function UModsWindow:OnDownloadMissingPressed() end

---@param bSuccess boolean
---@param FileId string
function UModsWindow:OnDownloadMissingSubscribeComplete(bSuccess, FileId) end

function UModsWindow:OnFixPressed() end

function UModsWindow:OnForceApplyConfirmed() end

function UModsWindow:OnForceApplyPressed() end

function UModsWindow:OnForkModOptionsWindowCloseRequested() end

function UModsWindow:OnManagerDiscoveredModsChanged() end

function UModsWindow:OnManagerEnabledModsChanged() end

function UModsWindow:OnModDownloadWindowCloseRequested() end

---@param Reference FModReference
function UModsWindow:OnModInfoGetFromWorkshopClicked(Reference) end

function UModsWindow:OnModPacksPressed() end

function UModsWindow:OnModPacksWindowCloseRequested() end

---@param PackFile FModPackFile
function UModsWindow:OnPackChosen(PackFile) end

function UModsWindow:OnRefreshPressed() end

function UModsWindow:OnReplaceDraftWithPackConfirmed() end

function UModsWindow:OnResetConfirmed() end

function UModsWindow:OnResetPressed() end

function UModsWindow:OnSaveAsPackPressed() end

function UModsWindow:OnSaveModListAsPackWindowCloseRequested() end

---@param SearchText string
function UModsWindow:OnSearchTextChanged(SearchText) end

---@param InSlot UModSlot
function UModsWindow:OnSlotCreated(InSlot) end

---@param InSlot UModSlot
function UModsWindow:OnSlotDisableClicked(InSlot) end

---@param InSlot UModSlot
function UModsWindow:OnSlotEnableClicked(InSlot) end

---@param InSlot UModSlot
function UModsWindow:OnSlotFixDependenciesClicked(InSlot) end

---@param InSlot UModSlot
function UModsWindow:OnSlotForkClicked(InSlot) end

---@param InSlot UModSlot
function UModsWindow:OnSlotGenerateCodeWorkspaceClicked(InSlot) end

---@param InSlot UModSlot
function UModsWindow:OnSlotGetFromWorkshopClicked(InSlot) end

---@param InSlot UModSlot
function UModsWindow:OnSlotMoveDownClicked(InSlot) end

---@param InSlot UModSlot
function UModsWindow:OnSlotMoveUpClicked(InSlot) end

---@param InSlot UModSlot
function UModsWindow:OnSlotSelected(InSlot) end

---@param Progress TArray<FWorkshopDownloadProgress>
function UModsWindow:OnWorkshopDownloadProgressUpdated(Progress) end

---Shows the window and re-runs mod discovery. Called by UMenuHUD in place of a bare SetVisibility.
function UModsWindow:Open() end

