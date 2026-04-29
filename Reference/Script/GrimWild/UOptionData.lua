---Holds one game option only.
---OptionName == this.PrimaryAssetName. It allows us to exclude option name collision. Also, we can refer to any Option's parent asset from anywhere.
---Logic chain on in-game option edit: Option Window -> GameOptions Property -> OptionData::OnChanged -> Custom Logic.
---@class UOptionData : UGAssetBase
---@field protected VAsset_WidgetStyleBinaryData TArray<integer> @Workaround to let VAssets save and load Instanced object "Widget Style". How it works: During VAsset object save (not UE standard serialization), we fill this string with binary WidgetStyle data. This field gets saved to disk. After we have loaded this field, we create a new WidgetStyle dummy, fill it with data from this field and remove the data. Original WidgetStyle field is not marked with Transient field to make UAssets work properly. It means that in VAsset raw data file this saved field (in format of Path/To/Object.Object) is totally useless, but we can't get rid of it.
---@field public bIsInputAction boolean @Set to true for Input Action (control) options
---@field public OptionType EStatePropertyType
---@field public Category FPrimaryAssetId @Category in Options window
---@field public Priority number @Determines the order in which all widgets are placed in Options Window
---@field public bReadOnlyInGame boolean @True: this option can be changed in Main Menu level only
---@field public WidgetType EPropertySlotType
---@field public WidgetStyle UPropertySlotStyleBase
---@field public OnValueChanged MulticastDelegate|fun() @Fires after the option value changes and applies
UOptionData = {}

---Fires when our underlying runtime option has changed, and we need to apply it.
---Example: VSync needs to set console variable; Window mode should change window mode from code.
---If the option is "pure data" (used as property in gameplay, no special updates needed), you may leave it unimplemented.
function UOptionData:ApplyChanges() end

---Apply custom rules to the value set from code/UI before it's stored in the option map.
---DO NOT make changes to the game here. Do it from ApplyOptionChanges().
---@param ValueToSet string @[out]
function UOptionData:ConfigureValueToSet(ValueToSet) end

---Used in ComboBoxes to generate the list of all available values for this option.
---If bTranslateText == true in Style, provide the list of Translation Keys (FNames); or plain strings otherwise.
---@param Options TArray<string> @[out]
function UOptionData:GetAvailableOptions(Options) end

---Gets the Default option value (from Game Options map)
---@param OutValue string @[out]
---@return boolean
function UOptionData:GetDefaultOptionValue(OutValue) end

---@return FStatePropertyId
function UOptionData:GetOptionId() end

---@return string
function UOptionData:GetOptionName() end

---Gets the option value (from Game Options map)
---@param OutValue string @[out]
function UOptionData:GetOptionValue(OutValue) end

---Callback for underlying Dynamic State Property change
function UOptionData:OnUnderlyingPropertyValueChanged() end

---Called when the user changes the value using UI or code.
---@param NewValue string
function UOptionData:SetOptionValue(NewValue) end

---Non-const version for delegate callbacks
---@param NewValue string @[out]
function UOptionData:SetOptionValue_Listener(NewValue) end

---Gathers all useful object instance debug data into string
---@param DebugString string @[out]
function UOptionData:GatherDebugData(DebugString) end

