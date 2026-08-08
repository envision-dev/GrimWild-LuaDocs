---Standalone window for creating, forking, editing and inspecting local mod/modpack projects. The two
---project lists (mods, modpacks) share a single selection, mirroring UModsWindow's own pattern.
---@class UModProjectsWindow : UUserWidget
---@field protected ML_ModProjects UModList
---@field protected ML_ModPackProjects UModList
---@field protected ModInfo UModInfo
---@field protected B_CreateNewMod UGButton
---@field protected B_CreateNewModPack UGButton
---@field protected B_ForkMod UGButton
---@field protected B_ForkModPack UGButton
---@field protected B_Close UGButton
---@field protected CreateNewModWindowWidget UCreateNewModWindow @Owned dialogs, created on demand and destroyed on close. UModEditor is the one exception: it is lazily created, cached, and hidden/shown instead.
---@field protected ForkModOptionsWindowWidget UForkModOptionsWindow
---@field protected ModDownloadWindowWidget UModDownloadWindow_SteamWorkshop
---@field protected ModEditorWidget UModEditor
UModProjectsWindow = {}

function UModProjectsWindow:OnClosePressed() end

function UModProjectsWindow:OnCreateNewModPackPressed() end

function UModProjectsWindow:OnCreateNewModPressed() end

function UModProjectsWindow:OnCreateNewModWindowCloseRequested() end

function UModProjectsWindow:OnForkModOptionsWindowCloseRequested() end

function UModProjectsWindow:OnForkModPackPressed() end

function UModProjectsWindow:OnForkModPressed() end

function UModProjectsWindow:OnManagerDiscoveredModsChanged() end

function UModProjectsWindow:OnModDownloadWindowCloseRequested() end

---@param Reference FModReference
function UModProjectsWindow:OnModInfoGetFromWorkshopClicked(Reference) end

---@param InSlot UModSlot
function UModProjectsWindow:OnSlotCreated(InSlot) end

---@param InSlot UModSlot
function UModProjectsWindow:OnSlotEditClicked(InSlot) end

---@param InSlot UModSlot
function UModProjectsWindow:OnSlotForkClicked(InSlot) end

---@param InSlot UModSlot
function UModProjectsWindow:OnSlotGetFromWorkshopClicked(InSlot) end

---@param InSlot UModSlot
function UModProjectsWindow:OnSlotSelected(InSlot) end

---Shows the window and re-runs mod discovery. Scroll positions are preserved by the lists themselves.
function UModProjectsWindow:Open() end

