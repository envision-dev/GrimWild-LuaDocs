---ULanguageData, Translation Visible Names, Selection from Options window = Game Module;
---Translation module = pure Culture Names, nothing more.
---Not to be confused with UOption_Language
---@class ULanguageData : UGAssetBase
---@field public CultureCode string @Defines culture (language and dates/numbers/text format). Format: ETF language tag. Multiple game translations may share the same language code. In this case, they'll all load the same translation files from mods.
ULanguageData = {}

---Gathers all useful object instance debug data into string
---@param DebugString string @[out]
function ULanguageData:GatherDebugData(DebugString) end

