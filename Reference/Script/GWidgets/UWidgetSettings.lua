---Usage:
---C++: GetDefault<UWidgetSettings>
---Blueprints: Get Class Defaults (UWidgetSettings)
---!!! NOTE: Don't call SaveConfig() from runtime! We use config values as default ones,
---making transient changes to in-memory variables. So every time the game resets to the default Cfg state, and during the initial load, we insert the changes.
---Example: Color Palette option
---@class UWidgetSettings : UDeveloperSettings
---@field protected TextStyles_New TArray<FTextStyle> @Text Block styles. Order == ETextType. Number of elements here MUST be equal to ETextType::NUM.
---@field public DefaultButtonStyle FButtonStyle @Every GButton in the game uses this style. When we change the color styles, the FButtonStyle does not change. Instead, ColorAndOpacity and BackgroundColors are changed. Note that this is set to "Config", i.e. players can change it (from the cfg file), and there is no way to restore it. I think it's totally fine, since in-game there is no possibility to change it
---@field public CheckBoxStyle FCheckBoxStyle
---@field public ScrollBoxStyle FGScrollBoxStyle
---@field public SliderStyle FSliderStyle
---@field public SpinBoxStyle FGSpinBoxStyle
---@field public EditableTextBoxStyle FGEditableTextBoxStyle
---@field public MainProgressBarStyle FProgressBarStyle
---@field public AlternateProgressBarStyle FProgressBarStyle
---@field public ComboBoxStyle FGComboBoxStyle
---@field public InputKeySelectorButtonStyle FGInputKeySelectorStyle
---@field public ExpandableAreaStyle FGExpandableAreaStyle
---@field public LogMessageColor_Note FLinearColor
---@field public LogMessageColor_Warning FLinearColor
---@field public LogMessageColor_Error FLinearColor
---@field protected ColorStyle_New FColorStyle @Current color style used in game. Can be changed at runtime To get default color style (defined in Editor), use FColorStyle::GetDefaultStyle(). NOTE: Custom color palettes are in-memory changes only. We shouldn't call SaveConfig() from runtime.
UWidgetSettings = {}

---@param __WorldContextObject UObject
function UWidgetSettings.ApplyStyleToAllWidgets(__WorldContextObject) end

---Get Settings object
---@return UWidgetSettings
function UWidgetSettings.Get() end

---@return FColorStyle
function UWidgetSettings.GetColorStyle() end

---Gets the shade of the current color style (not the default one)
---@param InWidgetColor FWidgetColorStyle
---@return FColor
function UWidgetSettings:GetColorStyleShade(InWidgetColor) end

---Gets the shade of the current color style (not the default one)
---@param InWidgetColor FWidgetColorStyle
---@return FSlateColor
function UWidgetSettings:GetSlateColorStyleShade(InWidgetColor) end

---@param __WorldContextObject UObject
function UWidgetSettings.UpdateTranslationForAllWidgets(__WorldContextObject) end

