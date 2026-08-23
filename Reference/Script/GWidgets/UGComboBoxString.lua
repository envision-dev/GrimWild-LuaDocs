---@meta
---Stylized combo box widget using FString options.
---Fully reimplemented from UWidget (not UComboBoxString) to support UpdateSelectedOption() — Data -> Widget sync.
---@class UGComboBoxString : UWidget
---@field private DefaultOptions TArray<string> @The default list of items to be displayed on the combobox (serialized for Blueprint/editor).
---@field private SelectedOption string @The item in the combobox to select by default.
---@field public WidgetStyle FComboBoxStyle @The combobox style.
---@field public ItemStyle FTableRowStyle @The item row style.
---@field public ScrollBarStyle FScrollBarStyle @The scroll bar style.
---@field public ForegroundColor FSlateColor @The foreground color to pass through the hierarchy.
---@field public ContentPadding FMargin
---@field public MaxListHeight number @The max height of the combobox list that opens
---@field public bHasDownArrow boolean @When false, the down arrow is not generated and it is up to the API consumer to make their own visual hint that this is a drop down.
---@field public bEnableGamepadNavigationMode boolean @When false, directional keys will change the selection. When true, ComboBox must be activated and will only capture arrow input while activated.
---@field public bIsFocusable boolean @When true, allows the combo box to receive keyboard focus
---@field public OnSelectionChanged MulticastDelegate|fun(SelectedItem: string, SelectionType: integer) @Called when a new item is selected in the combobox.
---@field public OnOpening MulticastDelegate|fun() @Called when the combobox is opening
---@field public TextType ETextType
UGComboBoxString = {}

---Add an element to the option list.
---@param Option string
function UGComboBoxString:AddOption(Option) end

---Remove all the elements of the option list.
function UGComboBoxString:ClearOptions() end

---Clear the current selection.
function UGComboBoxString:ClearSelection() end

---Find the index of an option. Returns -1 if not found.
---@param Option string
---@return integer
function UGComboBoxString:FindOptionIndex(Option) end

---Get the option string at the given index.
---@param Index integer
---@return string
function UGComboBoxString:GetOptionAtIndex(Index) end

---Returns the number of options.
---@return integer
function UGComboBoxString:GetOptionCount() end

---@return integer
function UGComboBoxString:GetSelectedIndex() end

---Get the current selected option
---@return string
function UGComboBoxString:GetSelectedOption() end

---Is the combobox menu opened.
---@return boolean
function UGComboBoxString:IsOpen() end

function UGComboBoxString:OnOpeningEvent__DelegateSignature() end

---@param SelectedItem string
---@param SelectionType integer
function UGComboBoxString:OnSelectionChangedEvent__DelegateSignature(SelectedItem, SelectionType) end

---Refreshes the list of options. Call after modifying the options source externally.
function UGComboBoxString:RefreshOptions() end

---Remove an element from the option list.
---@param Option string
---@return boolean
function UGComboBoxString:RemoveOption(Option) end

---Set the selected option by index. Widget -> Data
---@param Index integer
function UGComboBoxString:SetSelectedIndex(Index) end

---Set the current selected option. Widget -> Data
---@param Option string
function UGComboBoxString:SetSelectedOption(Option) end

---Updates the selected option by index, without triggering delegates. Data -> Widget
---@param Index integer
function UGComboBoxString:UpdateSelectedIndex(Index) end

---Updates the current selection option, without triggering delegates. Data -> Widget
---@param Option string
function UGComboBoxString:UpdateSelectedOption(Option) end

function UGComboBoxString:ApplyStyle() end

