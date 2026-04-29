---A numerical entry box that allows for direct entry of the number or allows the user to click and slide the number.
---@class UGSpinBoxBase : UWidget
---@field public Value number @Value stored in this spin box
---@field public ValueDelegate Delegate|fun(): number @A bindable delegate to allow logic to drive the value of the widget
---@field public DisplayFormat EGSpinBoxDisplayFormat
---@field public WidgetStyle FSpinBoxStyle @The Style
---@field public MinFractionalDigits integer @The minimum required fractional digits - default 1
---@field public MaxFractionalDigits integer @The maximum required fractional digits - default 6
---@field public bAlwaysUsesDeltaSnap boolean @Whether this spin box should use the delta snapping logic for typed values - default false
---@field public bEnableSlider boolean @Whether this spin box should have slider feature enabled
---@field public Delta number @The amount by which to change the spin box value as the slider moves.
---@field public SliderExponent number @The exponent by which to increase the delta as the mouse moves. 1 is constant (never increases the delta).
---@field public Font FSlateFontInfo @Font color and opacity (overrides style)
---@field public Justification integer @The justification the value text should appear as.
---@field public MinDesiredWidth number @The minimum width of the spin box
---@field public KeyboardType integer @If we're on a platform that requires a virtual keyboard, what kind of keyboard should this widget use?
---@field public ClearKeyboardFocusOnCommit boolean @Whether to remove the keyboard focus from the spin box when the value is committed
---@field public SelectAllTextOnCommit boolean @Whether to select the text in the spin box when the value is committed
---@field public ForegroundColor FSlateColor
---@field public OnValueChanged MulticastDelegate|fun(InValue: number) @Called when the value is changed interactively by the user
---@field public OnValueCommitted MulticastDelegate|fun(InValue: number, CommitMethod: integer) @Called when the value is committed. Occurs when the user presses Enter or the text box loses focus.
---@field public OnBeginSliderMovement MulticastDelegate|fun() @Called right before the slider begins to move
---@field public OnEndSliderMovement MulticastDelegate|fun(InValue: number) @Called right after the slider handle is released by the user
---@field protected DragSpeedMultiplier number
---@field protected bOverride_MinValue boolean @Whether the optional MinValue attribute of the widget is set
---@field protected bOverride_MaxValue boolean @Whether the optional MaxValue attribute of the widget is set
---@field protected bOverride_MinSliderValue boolean @Whether the optional MinSliderValue attribute of the widget is set
---@field protected bOverride_MaxSliderValue boolean @Whether the optional MaxSliderValue attribute of the widget is set
---@field protected MinValue number @The minimum allowable value that can be manually entered into the spin box
---@field protected MaxValue number @The maximum allowable value that can be manually entered into the spin box
---@field protected MinSliderValue number @The minimum allowable value that can be specified using the slider
---@field protected MaxSliderValue number @The maximum allowable value that can be specified using the slider
UGSpinBoxBase = {}

---Clear the maximum value that can be specified using the slider.
function UGSpinBoxBase:ClearMaxSliderValue() end

---Clear the maximum value that can be manually set in the spin box.
function UGSpinBoxBase:ClearMaxValue() end

---Clear the minimum value that can be specified using the slider.
function UGSpinBoxBase:ClearMinSliderValue() end

---Clear the minimum value that can be manually set in the spin box.
function UGSpinBoxBase:ClearMinValue() end

---Get whether the spin box uses delta snap on type.
---@return boolean
function UGSpinBoxBase:GetAlwaysUsesDeltaSnap() end

---Get the current delta for the spin box.
---@return number
function UGSpinBoxBase:GetDelta() end

---@return EGSpinBoxDisplayFormat
function UGSpinBoxBase:GetDisplayFormat() end

---Get the current Max Fractional Digits for the spin box.
---@return integer
function UGSpinBoxBase:GetMaxFractionalDigits() end

---Get the current maximum value that can be specified using the slider.
---@return number
function UGSpinBoxBase:GetMaxSliderValue() end

---Get the current maximum value that can be manually set in the spin box.
---@return number
function UGSpinBoxBase:GetMaxValue() end

---Get the current Min Fractional Digits for the spin box.
---@return integer
function UGSpinBoxBase:GetMinFractionalDigits() end

---Get the current minimum value that can be specified using the slider.
---@return number
function UGSpinBoxBase:GetMinSliderValue() end

---Get the current minimum value that can be manually set in the spin box.
---@return number
function UGSpinBoxBase:GetMinValue() end

---Get the current value of the spin box.
---@return number
function UGSpinBoxBase:GetValue() end

function UGSpinBoxBase:OnSpinBoxBeginSliderMovement__DelegateSignature() end

---@param InValue number
function UGSpinBoxBase:OnSpinBoxValueChangedEvent__DelegateSignature(InValue) end

---@param InValue number
---@param CommitMethod integer
function UGSpinBoxBase:OnSpinBoxValueCommittedEvent__DelegateSignature(InValue, CommitMethod) end

---Set whether the spin box uses delta snap on type.
---@param bNewValue boolean
function UGSpinBoxBase:SetAlwaysUsesDeltaSnap(bNewValue) end

---Set the delta for the spin box.
---@param NewValue number
function UGSpinBoxBase:SetDelta(NewValue) end

---@param InFormat EGSpinBoxDisplayFormat
function UGSpinBoxBase:SetDisplayFormat(InFormat) end

---@param InForegroundColor FSlateColor
function UGSpinBoxBase:SetForegroundColor(InForegroundColor) end

---Set the Max Fractional Digits for the spin box.
---@param NewValue integer
function UGSpinBoxBase:SetMaxFractionalDigits(NewValue) end

---Set the maximum value that can be specified using the slider.
---@param NewValue number
function UGSpinBoxBase:SetMaxSliderValue(NewValue) end

---Set the maximum value that can be manually set in the spin box.
---@param NewValue number
function UGSpinBoxBase:SetMaxValue(NewValue) end

---Set the Min Fractional Digits for the spin box.
---@param NewValue integer
function UGSpinBoxBase:SetMinFractionalDigits(NewValue) end

---Set the minimum value that can be specified using the slider.
---@param NewValue number
function UGSpinBoxBase:SetMinSliderValue(NewValue) end

---Set the minimum value that can be manually set in the spin box.
---@param NewValue number
function UGSpinBoxBase:SetMinValue(NewValue) end

---Set the value of the spin box.
---@param NewValue number
function UGSpinBoxBase:SetValue(NewValue) end

---Silently push a new display value without firing any delegates and without disturbing an active drag.
---@param NewValue number
function UGSpinBoxBase:UpdateValue(NewValue) end

