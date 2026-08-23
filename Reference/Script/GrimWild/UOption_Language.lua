---@meta
---NOTE: underlying option value is Culture, not LanguageData option ID!
---e.g. if the user has two mods that both add Spanish language, they'll all add just "Spanish" into the option window.
---In this case, their text elements merge, and the latter overwrites existing values.
---@class UOption_Language : UOptionData
UOption_Language = {}

---@param OptionId string
---@return string
function UOption_Language:GetComboBoxOptionName(OptionId) end

---Gathers all useful object instance debug data into string
---@return string DebugString @gathered debug data. Use Append() to support gathering from child subclasses
function UOption_Language:GatherDebugData() end

