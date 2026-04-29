---@class UKismetTextLibrary : UBlueprintFunctionLibrary
UKismetTextLibrary = {}

---Converts a passed in float to a text formatted as a currency
---@param Value number
---@param RoundingMode integer
---@param bAlwaysSign? boolean @[default: false]
---@param bUseGrouping? boolean @[default: true]
---@param MinimumIntegralDigits? integer @[default: 1]
---@param MaximumIntegralDigits? integer @[default: 324]
---@param MinimumFractionalDigits? integer @[default: 0]
---@param MaximumFractionalDigits? integer @[default: 3]
---@param CurrencyCode string
---@return string
function UKismetTextLibrary.AsCurrency_Float(Value, RoundingMode, bAlwaysSign, bUseGrouping, MinimumIntegralDigits, MaximumIntegralDigits, MinimumFractionalDigits, MaximumFractionalDigits, CurrencyCode) end

---Converts a passed in integer to a text formatted as a currency
---@param Value integer
---@param RoundingMode integer
---@param bAlwaysSign? boolean @[default: false]
---@param bUseGrouping? boolean @[default: true]
---@param MinimumIntegralDigits? integer @[default: 1]
---@param MaximumIntegralDigits? integer @[default: 324]
---@param MinimumFractionalDigits? integer @[default: 0]
---@param MaximumFractionalDigits? integer @[default: 3]
---@param CurrencyCode string
---@return string
function UKismetTextLibrary.AsCurrency_Integer(Value, RoundingMode, bAlwaysSign, bUseGrouping, MinimumIntegralDigits, MaximumIntegralDigits, MinimumFractionalDigits, MaximumFractionalDigits, CurrencyCode) end

---Generate an FText that represents the passed number as currency in the current culture.
---BaseVal is specified in the smallest fractional value of the currency and will be converted for formatting according to the selected culture.
---Keep in mind the CurrencyCode is completely independent of the culture it's displayed in (and they do not imply one another).
---For example: FText::AsCurrencyBase(650, TEXT("EUR")); would return an FText of "<EUR>6.50" in most English cultures (en_US/en_UK) and "6,50<EUR>" in Spanish (es_ES) (where <EUR> is U+20AC)
---@param BaseValue integer
---@param CurrencyCode string
---@return string
function UKismetTextLibrary.AsCurrencyBase(BaseValue, CurrencyCode) end

---Converts a passed in date & time to a text, formatted as a date using an invariant timezone. This will use the given date & time as-is, so it's assumed to already be in the correct timezone.
---@param InDateTime FDateTime
---@return string
function UKismetTextLibrary.AsDate_DateTime(InDateTime) end

---Converts a passed in date & time to a text, formatted as a date & time using an invariant timezone. This will use the given date & time as-is, so it's assumed to already be in the correct timezone.
---@param In FDateTime
---@return string
function UKismetTextLibrary.AsDateTime_DateTime(In) end

---Converts a passed in float to a text, formatted as a percent
---@param Value number
---@param RoundingMode integer
---@param bAlwaysSign? boolean @[default: false]
---@param bUseGrouping? boolean @[default: true]
---@param MinimumIntegralDigits? integer @[default: 1]
---@param MaximumIntegralDigits? integer @[default: 324]
---@param MinimumFractionalDigits? integer @[default: 0]
---@param MaximumFractionalDigits? integer @[default: 3]
---@return string
function UKismetTextLibrary.AsPercent_Float(Value, RoundingMode, bAlwaysSign, bUseGrouping, MinimumIntegralDigits, MaximumIntegralDigits, MinimumFractionalDigits, MaximumFractionalDigits) end

---Converts a passed in date & time to a text, formatted as a time using an invariant timezone. This will use the given date & time as-is, so it's assumed to already be in the correct timezone.
---@param In FDateTime
---@return string
function UKismetTextLibrary.AsTime_DateTime(In) end

---Converts a passed in time span to a text, formatted as a time span
---@param InTimespan FTimespan
---@return string
function UKismetTextLibrary.AsTimespan_Timespan(InTimespan) end

---Converts a passed in date & time to a text, formatted as a date using the given timezone (default is the local timezone). This will convert the given date & time from UTC to the given timezone (taking into account DST).
---@param InDateTime FDateTime
---@param InTimeZone string
---@return string
function UKismetTextLibrary.AsTimeZoneDate_DateTime(InDateTime, InTimeZone) end

---Converts a passed in date & time to a text, formatted as a date & time using the given timezone (default is the local timezone). This will convert the given date & time from UTC to the given timezone (taking into account DST).
---@param InDateTime FDateTime
---@param InTimeZone string
---@return string
function UKismetTextLibrary.AsTimeZoneDateTime_DateTime(InDateTime, InTimeZone) end

---Converts a passed in date & time to a text, formatted as a time using the given timezone (default is the local timezone). This will convert the given date & time from UTC to the given timezone (taking into account DST).
---@param InDateTime FDateTime
---@param InTimeZone string
---@return string
function UKismetTextLibrary.AsTimeZoneTime_DateTime(InDateTime, InTimeZone) end

---Converts a boolean value to formatted text, either 'true' or 'false'
---@param InBool boolean
---@return string
function UKismetTextLibrary.Conv_BoolToText(InBool) end

---Converts a byte value to formatted text
---@param Value integer
---@return string
function UKismetTextLibrary.Conv_ByteToText(Value) end

---Converts a linear color value to localized formatted text, in the form '(R=,G=,B=,A=)'
---@param InColor FLinearColor
---@return string
function UKismetTextLibrary.Conv_ColorToText(InColor) end

---Converts a passed in double to text based on formatting options
---@param Value number
---@param RoundingMode integer
---@param bAlwaysSign? boolean @[default: false]
---@param bUseGrouping? boolean @[default: true]
---@param MinimumIntegralDigits? integer @[default: 1]
---@param MaximumIntegralDigits? integer @[default: 324]
---@param MinimumFractionalDigits? integer @[default: 0]
---@param MaximumFractionalDigits? integer @[default: 3]
---@return string
function UKismetTextLibrary.Conv_DoubleToText(Value, RoundingMode, bAlwaysSign, bUseGrouping, MinimumIntegralDigits, MaximumIntegralDigits, MinimumFractionalDigits, MaximumFractionalDigits) end

---Converts a passed in integer to text based on formatting options
---@param Value integer
---@param bAlwaysSign? boolean @[default: false]
---@param bUseGrouping? boolean @[default: true]
---@param MinimumIntegralDigits? integer @[default: 1]
---@param MaximumIntegralDigits? integer @[default: 324]
---@return string
function UKismetTextLibrary.Conv_Int64ToText(Value, bAlwaysSign, bUseGrouping, MinimumIntegralDigits, MaximumIntegralDigits) end

---Converts a passed in integer to text based on formatting options
---@param Value integer
---@param bAlwaysSign? boolean @[default: false]
---@param bUseGrouping? boolean @[default: true]
---@param MinimumIntegralDigits? integer @[default: 1]
---@param MaximumIntegralDigits? integer @[default: 324]
---@return string
function UKismetTextLibrary.Conv_IntToText(Value, bAlwaysSign, bUseGrouping, MinimumIntegralDigits, MaximumIntegralDigits) end

---Converts Name to culture invariant text
---@param InName string
---@return string
function UKismetTextLibrary.Conv_NameToText(InName) end

---Converts a UObject value to culture invariant text by calling the object's GetName method
---@param InObj UObject
---@return string
function UKismetTextLibrary.Conv_ObjectToText(InObj) end

---Converts a rotator value to localized formatted text, in the form 'P= Y= R='
---@param InRot FRotator
---@return string
function UKismetTextLibrary.Conv_RotatorToText(InRot) end

---Converts string to culture invariant text. Use Format or Make Literal Text to create localizable text
---@param InString string
---@return string
function UKismetTextLibrary.Conv_StringToText(InString) end

---Converts localizable text to the string
---@param InText string
---@return string
function UKismetTextLibrary.Conv_TextToString(InText) end

---Converts a transform value to localized formatted text, in the form 'Translation: X= Y= Z= Rotation: P= Y= R= Scale: X= Y= Z='
---@param InTrans FTransform
---@return string
function UKismetTextLibrary.Conv_TransformToText(InTrans) end

---Converts a vector2d value to localized formatted text, in the form 'X= Y='
---@param InVec FVector2D
---@return string
function UKismetTextLibrary.Conv_Vector2dToText(InVec) end

---Converts a vector value to localized formatted text, in the form 'X= Y= Z='
---@param InVec FVector
---@return string
function UKismetTextLibrary.Conv_VectorToText(InVec) end

---Returns true if A and B are linguistically equal (A == B), ignoring case.
---@param A string
---@param B string
---@return boolean
function UKismetTextLibrary.EqualEqual_IgnoreCase_TextText(A, B) end

---Returns true if A and B are linguistically equal (A == B).
---@param A string
---@param B string
---@return boolean
function UKismetTextLibrary.EqualEqual_TextText(A, B) end

---Attempts to find existing Text using the representation found in the loc tables for the specified namespace and key.
---@param Namespace string @The namespace of the text to find (if any).
---@param Key string @The key of the text to find.
---@param OutText string @[out]
---@param SourceString string @If set (not empty) then the found text must also have been created from this source string.
---@return boolean
function UKismetTextLibrary.FindTextInLocalizationTable(Namespace, Key, OutText, SourceString) end

---Used for formatting text using the FText::Format function and utilized by the UK2Node_FormatText
---@param InPattern string
---@param InArgs TArray<FFormatArgumentData>
---@return string
function UKismetTextLibrary.Format(InPattern, InArgs) end

---Returns an empty piece of text.
---@return string
function UKismetTextLibrary.GetEmptyText() end

---Check whether the given polyglot data is valid.
---@param PolyglotData FPolyglotTextData
---@param IsValid boolean @[out]
---@param ErrorMessage string @[out]
function UKismetTextLibrary.IsPolyglotDataValid(PolyglotData, IsValid, ErrorMessage) end

---Returns true if A and B are linguistically not equal (A != B), ignoring case.
---@param A string
---@param B string
---@return boolean
function UKismetTextLibrary.NotEqual_IgnoreCase_TextText(A, B) end

---Returns true if A and B are linguistically not equal (A != B).
---@param A string
---@param B string
---@return boolean
function UKismetTextLibrary.NotEqual_TextText(A, B) end

---Get the text instance created from this polyglot data.
---@param PolyglotData FPolyglotTextData
---@return string
function UKismetTextLibrary.PolyglotDataToText(PolyglotData) end

---Attempts to find the String Table ID and key used by the given text.
---@param Text string
---@param OutTableId string @[out]
---@param OutKey string @[out]
---@return boolean
function UKismetTextLibrary.StringTableIdAndKeyFromText(Text, OutTableId, OutKey) end

---Attempts to create a text instance from a string table ID and key.
---@param TableId string
---@param Key string
---@return string
function UKismetTextLibrary.TextFromStringTable(TableId, Key) end

---Returns true if text is culture invariant.
---@param InText string
---@return boolean
function UKismetTextLibrary.TextIsCultureInvariant(InText) end

---Returns true if text is empty.
---@param InText string
---@return boolean
function UKismetTextLibrary.TextIsEmpty(InText) end

---Returns true if the given text is referencing a string table.
---@param Text string
---@return boolean
function UKismetTextLibrary.TextIsFromStringTable(Text) end

---Returns true if text is transient.
---@param InText string
---@return boolean
function UKismetTextLibrary.TextIsTransient(InText) end

---Transforms the text to lowercase in a culture correct way.
---@param InText string
---@return string
function UKismetTextLibrary.TextToLower(InText) end

---Transforms the text to uppercase in a culture correct way.
---@param InText string
---@return string
function UKismetTextLibrary.TextToUpper(InText) end

---Removes whitespace characters from the front of the text.
---@param InText string
---@return string
function UKismetTextLibrary.TextTrimPreceding(InText) end

---Removes whitespace characters from the front and end of the text.
---@param InText string
---@return string
function UKismetTextLibrary.TextTrimPrecedingAndTrailing(InText) end

---Removes trailing whitespace characters.
---@param InText string
---@return string
function UKismetTextLibrary.TextTrimTrailing(InText) end

