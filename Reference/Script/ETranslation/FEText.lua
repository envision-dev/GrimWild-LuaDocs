---Translated String
---@class FEText
---@field public bTranslate boolean @True = value gathered from FETranslationStorage. False = from inline string
---@field public TranslationKey string @Text element key. Works only if bTranslate == true
---@field public InlineText string @Untranslated text value: used if bTranslate == false instead of looking up in translation manager
FEText = {}
