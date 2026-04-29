---By default, it generates visible text gathered from translation manager, using option IDs as Translation keys.
---To change this behavior, bind custom function to OnGenerateItemText delegate.
---@class UGComboBoxKey : UWidget
---@field private Options TArray<string> @List of option name keys available in the combo box.
---@field private SelectedOption string @The currently selected option key.
---@field public WidgetStyle FComboBoxStyle @The combobox style.
---@field public ItemStyle FTableRowStyle @The item row style.
---@field public ScrollBarStyle FScrollBarStyle @The scroll bar style.
---@field public ForegroundColor FSlateColor @The foreground color to pass through the hierarchy.
---@field public ContentPadding FMargin
---@field public MaxListHeight number @The max height of the combobox list that opens
---@field public bHasDownArrow boolean @When false, the down arrow is not generated and it is up to the API consumer to make their own visual hint that this is a drop down.
---@field public bEnableGamepadNavigationMode boolean @When false, directional keys will change the selection. When true, ComboBox must be activated and will only capture arrow input while activated.
---@field public bIsFocusable boolean @When true, allows the combo box to receive keyboard focus
---@field public OnSelectionChanged MulticastDelegate @Called when a new item is selected in the combobox.
---@field public OnOpening MulticastDelegate @Called when the combobox is opening
---@field public TextType ETextType
---@field public OnGenerateItemText Delegate
UGComboBoxKey = {}

---Add an element to the option list.
---@param Option string
function UGComboBoxKey:AddOption(Option) end

function UGComboBoxKey:ClearOnGenerateItemText() end

---Remove all the elements of the option list.
function UGComboBoxKey:ClearOptions() end

---Clear the current selection.
function UGComboBoxKey:ClearSelection() end

---@return integer
function UGComboBoxKey:GetSelectedIndex() end

---Get the current selected option
---@return string
function UGComboBoxKey:GetSelectedOption() end

---Is the combobox menu opened.
---@return boolean
function UGComboBoxKey:IsOpen() end

function UGComboBoxKey:OnOpeningEvent__DelegateSignature() end

---@param SelectedItem string
---@param SelectionType integer
function UGComboBoxKey:OnSelectionChangedEvent__DelegateSignature(SelectedItem, SelectionType) end

---Remove an element to the option list.
---@param Option string
---@return boolean
function UGComboBoxKey:RemoveOption(Option) end

---@param NewListener Delegate
function UGComboBoxKey:SetOnGenerateItemText(NewListener) end

---Set the current selected option.
---@param Option string
function UGComboBoxKey:SetSelectedOption(Option) end

function UGComboBoxKey:ApplyStyle() end

