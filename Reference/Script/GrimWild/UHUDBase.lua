---Base class for creating UI windows.
---Subclassed for GameMap and MainMenu maps.
---@class UHUDBase : UUserWidget
---@field public RootPanel UCanvasPanel @Main canvas. Cannot be hidden
---@field public SwitchablePanel UCanvasPanel @Canvas for widgets that can be hidden
---@field protected DevConsoleClass TSoftClassPtr<UDevConsole>
---@field protected DevConsoleWidget UDevConsole
---@field protected LogWindowClass TSoftClassPtr<ULogWindow>
---@field protected LogWindowWidget ULogWindow
---@field protected TextTooltipClass TSoftClassPtr<UTextTooltip>
---@field protected TextTooltipWidget UTextTooltip
---@field protected ConfirmationWindowClass TSoftClassPtr<UConfirmationWindow>
---@field protected OptionsWindowClass TSoftClassPtr<UOptionsWindow>
---@field protected OptionsWindowWidget UOptionsWindow
---@field protected ColorPickerWidget UColorPicker
UHUDBase = {}

---@param String string
---@param OnConfirmed Delegate
---@return UConfirmationWindow
function UHUDBase:CreateConfirmationWindow(String, OnConfirmed) end

---@param Text FEText
---@param OnConfirmed Delegate
---@return UConfirmationWindow
function UHUDBase:CreateConfirmationWindow_EText(Text, OnConfirmed) end

---@return UColorPicker
function UHUDBase:GetColorPicker() end

---@return ULogWindow
function UHUDBase:GetLogWindow() end

---@return UOptionsWindow
function UHUDBase:GetOptionsWindow() end

---@param InClass TSubclassOf<UUserWidget>
---@param InPosition FVector2D
---@param InZOrder integer
---@return UUserWidget
function UHUDBase:K2_CreateDraggableWindow(InClass, InPosition, InZOrder) end

---@param InClass TSubclassOf<UUserWidget>
---@param InZOrder integer
---@return UUserWidget
function UHUDBase:K2_CreateFullScreenWindow(InClass, InZOrder) end

---Does everything necessary to return a valid text tooltip widget with the given text
---@param __WorldContext UObject
---@param String string
---@return UTextTooltip
function UHUDBase.SetupTooltip(__WorldContext, String) end

---@param __WorldContext UObject
---@param Text FEText
---@return UTextTooltip
function UHUDBase.SetupTooltip_EText(__WorldContext, Text) end

function UHUDBase:SwitchDevConsole() end

function UHUDBase:SwitchLogWindow() end

function UHUDBase:SwitchVisibility() end

---Should be called from Options after the Dev Mode is turned off
function UHUDBase:TryDestroyDevConsole() end

