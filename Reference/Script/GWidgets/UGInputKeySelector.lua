---Copied from UInputKeySelector (the original works terrible with Global Invalidation)
---@class UGInputKeySelector : UWidget
---@field public TextType ETextType
---@field public WidgetStyle FButtonStyle @The button style used at runtime
---@field public TextStyle FTextBlockStyle @The button style used at runtime
---@field public SelectedKey FInputChord @The currently selected key chord.
---@field public Margin FMargin @The amount of blank space around the text used to display the currently selected key.
---@field public KeySelectionText string @Sets the text which is displayed while selecting keys.
---@field public NoKeySpecifiedText string @Sets the text to display when no key text is available or not selecting a key.
---@field public bAllowModifierKeys boolean @When true modifier keys such as control and alt are allowed in the input chord representing the selected key, if false modifier keys are ignored.
---@field public bAllowGamepadKeys boolean @When true gamepad keys are allowed in the input chord representing the selected key, otherwise they are ignored.
---@field public EscapeKeys TArray<FKey> @When true gamepad keys are allowed in the input chord representing the selected key, otherwise they are ignored.
---@field public OnKeySelected MulticastDelegate|fun(SelectedKey: FInputChord) @Called whenever a new key is selected by the user.
---@field public OnIsSelectingKeyChanged MulticastDelegate|fun() @Called whenever the key selection mode starts or stops.
UGInputKeySelector = {}

---Returns true if the widget is currently selecting a key, otherwise returns false.
---@return boolean
function UGInputKeySelector:GetIsSelectingKey() end

function UGInputKeySelector:OnIsSelectingKeyChanged__DelegateSignature() end

---@param SelectedKey FInputChord
function UGInputKeySelector:OnKeySelected__DelegateSignature(SelectedKey) end

---Sets whether or not gamepad keys are allowed in the selected key.
---@param bInAllowGamepadKeys boolean
function UGInputKeySelector:SetAllowGamepadKeys(bInAllowGamepadKeys) end

---Sets whether or not modifier keys are allowed in the selected key.
---@param bInAllowModifierKeys boolean
function UGInputKeySelector:SetAllowModifierKeys(bInAllowModifierKeys) end

---Sets escape keys.
---@param InKeys TArray<FKey>
function UGInputKeySelector:SetEscapeKeys(InKeys) end

---Sets the text which is displayed while selecting keys.
---@param InKeySelectionText string
function UGInputKeySelector:SetKeySelectionText(InKeySelectionText) end

---Sets the text to display when no key text is available or not selecting a key.
---@param InNoKeySpecifiedText string
function UGInputKeySelector:SetNoKeySpecifiedText(InNoKeySpecifiedText) end

---Sets the currently selected key.
---@param InSelectedKey FInputChord
function UGInputKeySelector:SetSelectedKey(InSelectedKey) end

---Sets the visibility of the text block.
---@param InVisibility ESlateVisibility
function UGInputKeySelector:SetTextBlockVisibility(InVisibility) end

---@param NewType ETextType
function UGInputKeySelector:SetTextType(NewType) end

function UGInputKeySelector:ApplyStyle() end

