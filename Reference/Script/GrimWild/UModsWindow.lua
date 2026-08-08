---Main menu window for enabling/disabling mods. Player actions on ML_Discovered/ML_Enabled only edit a
---local draft; the draft is validated after every change but only reaches UModManager when the player
---explicitly presses Apply, Fix (locally) or ForceApply.
---@class UModsWindow : UUserWidget
---@field protected B_Close UGButton
---@field protected ML_Discovered UModList
---@field protected ML_Enabled UModList
---@field protected B_Apply UGButton
---@field protected B_ForceApply UGButton
---@field protected B_Fix UGButton
---@field protected B_Reset UGButton
---@field protected I_CloseBlocker UGImage
---@field protected I_UnappliedChanges UGImage
---@field protected I_ApplyBlocker UGImage @Visible when the apply action is blocked (draft clean, or the draft has validation issues). Eats the click and can carry a UMG tooltip explaining why; B_Apply itself stays enabled permanently.
---@field protected I_ForceApplyBlocker UGImage @Visible when the force-apply action is blocked (draft clean). Same click-eating role as I_ApplyBlocker.
---@field protected TB_ProblemCount UGTextBlock
---@field protected ModInfo UModInfo
---@field protected ForkModOptionsWindowWidget UForkModOptionsWindow @Owned dialogs, created on demand and destroyed on close (see OnCloseRequested handlers below).
---@field protected ModDownloadWindowWidget UModDownloadWindow_SteamWorkshop
UModsWindow = {}

function UModsWindow:OnApplyPressed() end

function UModsWindow:OnClosePressed() end

function UModsWindow:OnFixPressed() end

function UModsWindow:OnForceApplyConfirmed() end

function UModsWindow:OnForceApplyPressed() end

function UModsWindow:OnForkModOptionsWindowCloseRequested() end

function UModsWindow:OnManagerDiscoveredModsChanged() end

function UModsWindow:OnManagerEnabledModsChanged() end

function UModsWindow:OnModDownloadWindowCloseRequested() end

---@param Reference FModReference
function UModsWindow:OnModInfoGetFromWorkshopClicked(Reference) end

function UModsWindow:OnResetConfirmed() end

function UModsWindow:OnResetPressed() end

---@param InSlot UModSlot
function UModsWindow:OnSlotCreated(InSlot) end

---@param InSlot UModSlot
function UModsWindow:OnSlotDisableClicked(InSlot) end

---@param InSlot UModSlot
function UModsWindow:OnSlotEnableClicked(InSlot) end

---@param InSlot UModSlot
function UModsWindow:OnSlotForkClicked(InSlot) end

---@param InSlot UModSlot
function UModsWindow:OnSlotGetFromWorkshopClicked(InSlot) end

---@param InSlot UModSlot
function UModsWindow:OnSlotMoveDownClicked(InSlot) end

---@param InSlot UModSlot
function UModsWindow:OnSlotMoveUpClicked(InSlot) end

---@param InSlot UModSlot
function UModsWindow:OnSlotSelected(InSlot) end

---Shows the window and re-runs mod discovery. Called by UMenuHUD in place of a bare SetVisibility.
function UModsWindow:Open() end

