---@meta
---Main UI window used in Main Menu
---@class UMenuHUD : UHUDBase
---@field protected NewGameWindowClass TSoftClassPtr<UNewGameWindow>
---@field protected NewGameWindowWidget UNewGameWindow
---@field protected LoadGameWindowClass TSoftClassPtr<ULoadGameWindow>
---@field protected LoadGameWindowWidget ULoadGameWindow
---@field protected ModsWindowWidget UModsWindow
---@field protected ModProjectsWindowWidget UModProjectsWindow
---@field public B_NewGame UGButton
---@field public B_LoadGame UGButton
---@field public B_Mods UGButton
---@field public B_MyMods UGButton
---@field public B_Options UGButton
---@field public B_Quit UGButton
---@field public B_OpenLog UGButton
---@field public B_OpenDevConsole UGButton
UMenuHUD = {}

---@return integer
function UMenuHUD.GetMenuWindowsZOrder() end

function UMenuHUD:OnLoadGamePressed() end

function UMenuHUD:OnModsPressed() end

function UMenuHUD:OnMyModsPressed() end

function UMenuHUD:OnNewGamePressed() end

function UMenuHUD:OnOpenDevConsolePressed() end

function UMenuHUD:OnOpenLogPressed() end

function UMenuHUD:OnOptionsPressed() end

function UMenuHUD:OnQuitPressed() end

