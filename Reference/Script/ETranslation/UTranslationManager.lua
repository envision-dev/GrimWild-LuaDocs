---Wrapper for interaction with FETranslationStorage.
---We can read values from FETranslationStorage directly.
---@class UTranslationManager : UGameInstanceSubsystem
---@field public GatherTranslation MulticastDelegate|fun(TargetCulture: string) @Every game content module (like a Mod) should bind their custom translation gathering processes to this delegate. Fired when the game
---@field public OnCultureSet MulticastDelegate|fun(NewCulture: string) @Called when the user changes current culture, right after regeneration of the text map
UTranslationManager = {}

---Appends current text elements set from the elements of the given source
---@param Source FTranslationSource
function UTranslationManager:AddTextFromSource(Source) end

---Appends the given map with values from json
---@param InJSON string
---@param TextMap TMap<string, string> @[out]
function UTranslationManager.AppendTextMapFromJSON(InJSON, TextMap) end

---@return UTranslationManager
function UTranslationManager.Get() end

---@return TSet<string>
function UTranslationManager.GetAvailableCultures() end

---@return string
function UTranslationManager.GetCulture() end

---@param CultureCode string
---@param bReturnNativeName boolean
---@return string
function UTranslationManager.GetCultureDisplayName(CultureCode, bReturnNativeName) end

---@return string
function UTranslationManager.GetDefaultCulture() end

---@param InText FEText
---@return string
function UTranslationManager.GetETextValue(InText) end

---@return TMap<string, string>
function UTranslationManager.GetTextMap() end

---@param InText FEText
---@return FEText
function UTranslationManager.MakeLiteralEText(InText) end

---Regenerates all the text elements (with the selected culture) from the scratch.
function UTranslationManager:RegenerateTextMap() end

---Updates all translation elements to match the selected culture.
---If not found, fallback culture is used instead (returns false in this case).
---@param NewCultureCode string
---@param bRegenerateTextMap? boolean @[default: true]
---@return boolean
function UTranslationManager:SetCulture(NewCultureCode, bRegenerateTextMap) end

---@param InMap TMap<string, string>
---@param OutJSON string @[out]
---@param bSort boolean
function UTranslationManager.TextMapToJSON(InMap, OutJSON, bSort) end

---Gathers all useful object instance debug data into string
---@param DebugString string @[out]
function UTranslationManager:GatherDebugData(DebugString) end

