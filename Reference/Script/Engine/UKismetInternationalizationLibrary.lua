---@class UKismetInternationalizationLibrary : UBlueprintFunctionLibrary
UKismetInternationalizationLibrary = {}

---Clear the given asset group category culture.
---@param AssetGroup string @The asset group to clear the culture for.
---@param SaveToConfig? boolean @[default: false] If true, save the new setting to the users' "GameUserSettings" config so that it persists after a reload.
function UKismetInternationalizationLibrary.ClearCurrentAssetGroupCulture(AssetGroup, SaveToConfig) end

---Get the display name of the given culture.
---@param Culture string @The culture to get the display name of, as an IETF language tag (eg, "zh-Hans-CN")
---@param Localized? boolean @[default: true] True to get the localized display name (the name of the culture in its own language), or False to get the display name in the current language.
---@return string
function UKismetInternationalizationLibrary.GetCultureDisplayName(Culture, Localized) end

---Get the given asset group category culture.
---@param AssetGroup string @The asset group to get the culture for.
---@return string
function UKismetInternationalizationLibrary.GetCurrentAssetGroupCulture(AssetGroup) end

---Get the current culture as an IETF language tag:
--- - A two-letter ISO 639-1 language code (eg, "zh").
--- - An optional four-letter ISO 15924 script code (eg, "Hans").
--- - An optional two-letter ISO 3166-1 country code (eg, "CN").
---@return string
function UKismetInternationalizationLibrary.GetCurrentCulture() end

---Get the current language (for localization) as an IETF language tag:
--- - A two-letter ISO 639-1 language code (eg, "zh").
--- - An optional four-letter ISO 15924 script code (eg, "Hans").
--- - An optional two-letter ISO 3166-1 country code (eg, "CN").
---@return string
function UKismetInternationalizationLibrary.GetCurrentLanguage() end

---Get the current locale (for internationalization) as an IETF language tag:
--- - A two-letter ISO 639-1 language code (eg, "zh").
--- - An optional four-letter ISO 15924 script code (eg, "Hans").
--- - An optional two-letter ISO 3166-1 country code (eg, "CN").
---@return string
function UKismetInternationalizationLibrary.GetCurrentLocale() end

---Get the list of cultures that have localization data available for them.
---@param IncludeGame? boolean @[default: true] Check for localized game resources.
---@param IncludeEngine? boolean @[default: false] Check for localized engine resources.
---@param IncludeEditor? boolean @[default: false] Check for localized editor resources.
---@param IncludeAdditional? boolean @[default: false] Check for localized additional (eg, plugin) resources.
---@return TArray<string>
function UKismetInternationalizationLibrary.GetLocalizedCultures(IncludeGame, IncludeEngine, IncludeEditor, IncludeAdditional) end

---Get the native culture for the given localization category.
---@param TextCategory ELocalizedTextSourceCategory
---@return string
function UKismetInternationalizationLibrary.GetNativeCulture(TextCategory) end

---Given a list of available cultures, try and find the most suitable culture from the list based on culture prioritization.
---  eg) If your list was [en, fr, de] and the given culture was "en-US", this function would return "en".
---  eg) If your list was [zh, ar, pl] and the given culture was "en-US", this function would return the fallback culture.
---@param AvailableCultures TArray<string> @List of available cultures to filter against (see GetLocalizedCultures).
---@param CultureToMatch string @Culture to try and match (see GetCurrentLanguage).
---@param FallbackCulture? string @[default: en] The culture to return if there is no suitable match in the list (typically your native culture, see GetNativeCulture).
---@return string
function UKismetInternationalizationLibrary.GetSuitableCulture(AvailableCultures, CultureToMatch, FallbackCulture) end

---Set the given asset group category culture from an IETF language tag (eg, "zh-Hans-CN").
---@param AssetGroup string @The asset group to set the culture for.
---@param Culture string @The culture to set, as an IETF language tag (eg, "zh-Hans-CN").
---@param SaveToConfig? boolean @[default: false] If true, save the new setting to the users' "GameUserSettings" config so that it persists after a reload.
---@return boolean
function UKismetInternationalizationLibrary.SetCurrentAssetGroupCulture(AssetGroup, Culture, SaveToConfig) end

---Set the current culture.
---@param Culture string @The culture to set, as an IETF language tag (eg, "zh-Hans-CN").
---@param SaveToConfig? boolean @[default: false] If true, save the new setting to the users' "GameUserSettings" config so that it persists after a reload.
---@return boolean
function UKismetInternationalizationLibrary.SetCurrentCulture(Culture, SaveToConfig) end

---Set *only* the current language (for localization).
---@param Culture string @The language to set, as an IETF language tag (eg, "zh-Hans-CN").
---@param SaveToConfig? boolean @[default: false] If true, save the new setting to the users' "GameUserSettings" config so that it persists after a reload.
---@return boolean
function UKismetInternationalizationLibrary.SetCurrentLanguage(Culture, SaveToConfig) end

---Set the current language (for localization) and locale (for internationalization).
---@param Culture string @The language and locale to set, as an IETF language tag (eg, "zh-Hans-CN").
---@param SaveToConfig? boolean @[default: false] If true, save the new setting to the users' "GameUserSettings" config so that it persists after a reload.
---@return boolean
function UKismetInternationalizationLibrary.SetCurrentLanguageAndLocale(Culture, SaveToConfig) end

---Set *only* the current locale (for internationalization).
---@param Culture string @The locale to set, as an IETF language tag (eg, "zh-Hans-CN").
---@param SaveToConfig? boolean @[default: false] If true, save the new setting to the users' "GameUserSettings" config so that it persists after a reload.
---@return boolean
function UKismetInternationalizationLibrary.SetCurrentLocale(Culture, SaveToConfig) end

