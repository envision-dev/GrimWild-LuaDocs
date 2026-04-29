---In-game pause menu widget.
---@class UGameMenu : UUserWidget
---@field protected B_Continue UGButton
---@field protected B_SaveGame UGButton
---@field protected B_LoadGame UGButton
---@field protected B_Options UGButton
---@field protected B_QuitToMenu UGButton
UGameMenu = {}

function UGameMenu:ForceQuitToMenu() end

function UGameMenu:OnContinuePressed() end

function UGameMenu:OnLoadGamePressed() end

---@param InVisibility ESlateVisibility
function UGameMenu:OnMenuVisibilityChanged(InVisibility) end

function UGameMenu:OnOptionsPressed() end

function UGameMenu:OnQuitToMenuPressed() end

function UGameMenu:OnSaveGamePressed() end

