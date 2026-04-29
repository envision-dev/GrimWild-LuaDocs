---Main UI window used in Main Menu
---@class UMenuHUD : UHUDBase
---@field protected NewGameWindowClass TSoftClassPtr<UNewGameWindow>
---@field protected NewGameWindowWidget UNewGameWindow
---@field protected LoadGameWindowClass TSoftClassPtr<ULoadGameWindow>
---@field protected LoadGameWindowWidget ULoadGameWindow
---@field protected ModsWindowClass TSoftClassPtr<UModsWindow>
---@field protected ModsWindowWidget UModsWindow
---@field public B_NewGame UGButton
---@field public B_LoadGame UGButton
---@field public B_Mods UGButton
---@field public B_Options UGButton
---@field public B_Quit UGButton
---@field public TB_GameVersion UGTextBlock
---@field public B_OpenLog UGButton
---@field public B_OpenDevConsole UGButton
UMenuHUD = {}

---@return integer
function UMenuHUD.GetMenuWindowsZOrder() end

function UMenuHUD:OnLoadGamePressed() end

function UMenuHUD:OnModsPressed() end

function UMenuHUD:OnNewGamePressed() end

function UMenuHUD:OnOpenDevConsolePressed() end

function UMenuHUD:OnOpenLogPressed() end

function UMenuHUD:OnOptionsPressed() end

function UMenuHUD:OnQuitPressed() end

