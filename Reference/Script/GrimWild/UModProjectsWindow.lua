---@meta
---Standalone window for creating, forking, editing and inspecting local mod projects.
---@class UModProjectsWindow : UUserWidget
---@field protected SearchBox USearchBox
---@field protected ML_ModProjects UModList
---@field protected ModInfo UModInfo
---@field protected B_CreateNewMod UGButton
---@field protected B_ForkMod UGButton
---@field protected B_Refresh UGButton
---@field protected B_Close UGButton
---@field protected CreateNewModWindowWidget UCreateNewModWindow @Owned dialogs, created on demand and destroyed on close. UModEditor is the one exception: it is lazily created, cached, and hidden/shown instead.
---@field protected ForkModOptionsWindowWidget UForkModOptionsWindow
---@field protected ModDownloadWindowWidget UModDownloadWindow_SteamWorkshop
---@field protected ModEditorWidget UModEditor
---@field protected CodeWorkspaceGenerator UModCodeWorkspaceGenerator @The only strong reference keeping a generation alive; non-null doubles as the busy guard.
UModProjectsWindow = {}

function UModProjectsWindow:OnClosePressed() end

---@param bSuccess boolean
---@param ResultPath string
function UModProjectsWindow:OnCodeWorkspaceGeneratorCompleted(bSuccess, ResultPath) end

function UModProjectsWindow:OnCreateNewModPressed() end

function UModProjectsWindow:OnCreateNewModWindowCloseRequested() end

function UModProjectsWindow:OnForkModOptionsWindowCloseRequested() end

function UModProjectsWindow:OnForkModPressed() end

function UModProjectsWindow:OnManagerDiscoveredModsChanged() end

function UModProjectsWindow:OnModDownloadWindowCloseRequested() end

---@param Reference FModReference
function UModProjectsWindow:OnModInfoGetFromWorkshopClicked(Reference) end

function UModProjectsWindow:OnRefreshPressed() end

---@param SearchText string
function UModProjectsWindow:OnSearchTextChanged(SearchText) end

---@param InSlot UModSlot
function UModProjectsWindow:OnSlotCreated(InSlot) end

---@param InSlot UModSlot
function UModProjectsWindow:OnSlotEditClicked(InSlot) end

---@param InSlot UModSlot
function UModProjectsWindow:OnSlotForkClicked(InSlot) end

---@param InSlot UModSlot
function UModProjectsWindow:OnSlotGenerateCodeWorkspaceClicked(InSlot) end

---@param InSlot UModSlot
function UModProjectsWindow:OnSlotGetFromWorkshopClicked(InSlot) end

---@param InSlot UModSlot
function UModProjectsWindow:OnSlotSelected(InSlot) end

---Shows the window and re-runs mod discovery. Scroll positions are preserved by the lists themselves.
function UModProjectsWindow:Open() end

