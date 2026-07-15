---@class UPropertySlotStyle_ComboBox : UPropertySlotStyle
---@field public bTranslateText boolean @True = options are FName keys that need translation; false = raw FString display.
---@field public bTranslateText_OnGenerateItemText Delegate|fun(OptionId: string): string @Bind to override how each item's visible text is generated. Requires bTranslateText == true.
UPropertySlotStyle_ComboBox = {}

