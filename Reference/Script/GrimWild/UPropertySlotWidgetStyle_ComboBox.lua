---@class UPropertySlotWidgetStyle_ComboBox : UPropertySlotStyleBase
---@field public bTranslateText boolean @False = UOptionData::GetAvailableOptions() returns String elements that are shown in the widget as is (e.g. "1280x720"). True = UOptionData::GetAvailableOptions() returns keys to text elements that need to be translated (e.g. "Fullscreen") OR be processed manually by binding a function to bTranslateText_OnGenerateItemText delegate.
---@field public bTranslateText_OnGenerateItemText Delegate|fun(OptionId: string): string @Bind a function to overwrite the visible text generation.
UPropertySlotWidgetStyle_ComboBox = {}

---Bind a function to overwrite the visible text generation. NOTE: works only if bTranslateText == true
---@param NewListener Delegate|fun(OptionId: string): string
function UPropertySlotWidgetStyle_ComboBox:SetOnGenerateItemText(NewListener) end

