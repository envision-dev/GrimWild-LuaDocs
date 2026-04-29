---@class UKismetStringLibrary : UBlueprintFunctionLibrary
UKismetStringLibrary = {}

---Converts a boolean->string, creating a new string in the form AppendTo+Prefix+InBool+Suffix
---@param AppendTo string @- An existing string to use as the start of the conversion string
---@param Prefix string @- A string to use as a prefix, after the AppendTo string
---@param InBool boolean @- The bool value to convert. Will add "true" or "false" to the conversion string
---@param Suffix string @- A suffix to append to the end of the conversion string
---@return string
function UKismetStringLibrary.BuildString_Bool(AppendTo, Prefix, InBool, Suffix) end

---Converts a color->string, creating a new string in the form AppendTo+Prefix+InColor+Suffix
---@param AppendTo string @- An existing string to use as the start of the conversion string
---@param Prefix string @- A string to use as a prefix, after the AppendTo string
---@param InColor FLinearColor @- The linear color value to convert. Uses the standard ToString conversion
---@param Suffix string @- A suffix to append to the end of the conversion string
---@return string
function UKismetStringLibrary.BuildString_Color(AppendTo, Prefix, InColor, Suffix) end

---Converts a double->string, create a new string in the form AppendTo+Prefix+InDouble+Suffix
---@param AppendTo string @- An existing string to use as the start of the conversion string
---@param Prefix string @- A string to use as a prefix, after the AppendTo string
---@param InDouble number @- The double value to convert
---@param Suffix string @- A suffix to append to the end of the conversion string
---@return string
function UKismetStringLibrary.BuildString_Double(AppendTo, Prefix, InDouble, Suffix) end

---Converts a int->string, creating a new string in the form AppendTo+Prefix+InInt+Suffix
---@param AppendTo string @- An existing string to use as the start of the conversion string
---@param Prefix string @- A string to use as a prefix, after the AppendTo string
---@param InInt integer @- The int value to convert
---@param Suffix string @- A suffix to append to the end of the conversion string
---@return string
function UKismetStringLibrary.BuildString_Int(AppendTo, Prefix, InInt, Suffix) end

---Converts an IntVector->string, creating a new string in the form AppendTo+Prefix+InIntVector+Suffix
---@param AppendTo string @- An existing string to use as the start of the conversion string
---@param Prefix string @- A string to use as a prefix, after the AppendTo string
---@param InIntVector FIntVector @- The intVector value to convert. Uses the standard FVector::ToString conversion
---@param Suffix string @- A suffix to append to the end of the conversion string
---@return string
function UKismetStringLibrary.BuildString_IntVector(AppendTo, Prefix, InIntVector, Suffix) end

---Converts a color->string, creating a new string in the form AppendTo+Prefix+InName+Suffix
---@param AppendTo string @- An existing string to use as the start of the conversion string
---@param Prefix string @- A string to use as a prefix, after the AppendTo string
---@param InName string @- The name value to convert
---@param Suffix string @- A suffix to append to the end of the conversion string
---@return string
function UKismetStringLibrary.BuildString_Name(AppendTo, Prefix, InName, Suffix) end

---Converts a object->string, creating a new string in the form AppendTo+Prefix+object name+Suffix
---@param AppendTo string @- An existing string to use as the start of the conversion string
---@param Prefix string @- A string to use as a prefix, after the AppendTo string
---@param InObj UObject @- The object to convert. Will insert the name of the object into the conversion string
---@param Suffix string @- A suffix to append to the end of the conversion string
---@return string
function UKismetStringLibrary.BuildString_Object(AppendTo, Prefix, InObj, Suffix) end

---Converts a rotator->string, creating a new string in the form AppendTo+Prefix+InRot+Suffix
---@param AppendTo string @- An existing string to use as the start of the conversion string
---@param Prefix string @- A string to use as a prefix, after the AppendTo string
---@param InRot FRotator
---@param Suffix string @- A suffix to append to the end of the conversion string
---@return string
function UKismetStringLibrary.BuildString_Rotator(AppendTo, Prefix, InRot, Suffix) end

---Converts a vector->string, creating a new string in the form AppendTo+Prefix+InVector+Suffix
---@param AppendTo string @- An existing string to use as the start of the conversion string
---@param Prefix string @- A string to use as a prefix, after the AppendTo string
---@param InVector FVector @- The vector value to convert. Uses the standard FVector::ToString conversion
---@param Suffix string @- A suffix to append to the end of the conversion string
---@return string
function UKismetStringLibrary.BuildString_Vector(AppendTo, Prefix, InVector, Suffix) end

---Converts a vector2d->string, creating a new string in the form AppendTo+Prefix+InVector2d+Suffix
---@param AppendTo string @- An existing string to use as the start of the conversion string
---@param Prefix string @- A string to use as a prefix, after the AppendTo string
---@param InVector2d FVector2D @- The vector2d value to convert. Uses the standard FVector2D::ToString conversion
---@param Suffix string @- A suffix to append to the end of the conversion string
---@return string
function UKismetStringLibrary.BuildString_Vector2d(AppendTo, Prefix, InVector2d, Suffix) end

---Concatenates two strings together to make a new string
---@param A string @- The original string
---@param B string @- The string to append to A
---@return string
function UKismetStringLibrary.Concat_StrStr(A, B) end

---Returns whether this string contains the specified substring.
---@param SearchIn string
---@param Substring string
---@param bUseCase? boolean @[default: false]
---@param bSearchFromEnd? boolean @[default: false]
---@return boolean
function UKismetStringLibrary.Contains(SearchIn, Substring, bUseCase, bSearchFromEnd) end

---Converts a boolean value to a string, either 'true' or 'false'
---@param InBool boolean
---@return string
function UKismetStringLibrary.Conv_BoolToString(InBool) end

---Converts a byte value to a string
---@param InByte integer
---@return string
function UKismetStringLibrary.Conv_ByteToString(InByte) end

---Converts a linear color value to a string, in the form '(R=,G=,B=,A=)'
---@param InColor FLinearColor
---@return string
function UKismetStringLibrary.Conv_ColorToString(InColor) end

---Converts a double value to a string
---@param InDouble number
---@return string
function UKismetStringLibrary.Conv_DoubleToString(InDouble) end

---Converts a InputDeviceId value to a string
---@param InDeviceId FInputDeviceId
---@return string
function UKismetStringLibrary.Conv_InputDeviceIdToString(InDeviceId) end

---Converts an 64-bit integer value to a string
---@param InInt integer
---@return string
function UKismetStringLibrary.Conv_Int64ToString(InInt) end

---Converts an IntPoint value to a string, in the form 'X= Y='
---@param InIntPoint FIntPoint
---@return string
function UKismetStringLibrary.Conv_IntPointToString(InIntPoint) end

---Converts an integer value to a string
---@param InInt integer
---@return string
function UKismetStringLibrary.Conv_IntToString(InInt) end

---Converts an IntVector value to a string, in the form 'X= Y= Z='
---@param InIntVec FIntVector
---@return string
function UKismetStringLibrary.Conv_IntVectorToString(InIntVec) end

---Converts a name value to a string
---@param InMatrix FMatrix
---@return string
function UKismetStringLibrary.Conv_MatrixToString(InMatrix) end

---Converts a name value to a string
---@param InName string
---@return string
function UKismetStringLibrary.Conv_NameToString(InName) end

---Converts a UObject value to a string by calling the object's GetName method
---@param InObj UObject
---@return string
function UKismetStringLibrary.Conv_ObjectToString(InObj) end

---Converts a PlatformUserId value to a string
---@param InPlatformUserId FPlatformUserId
---@return string
function UKismetStringLibrary.Conv_PlatformUserIdToString(InPlatformUserId) end

---Converts a rotator value to a string, in the form 'P= Y= R='
---@param InRot FRotator
---@return string
function UKismetStringLibrary.Conv_RotatorToString(InRot) end

---Convert String Back To Color. IsValid indicates whether or not the string could be successfully converted.
---@param InString string
---@param OutConvertedColor FLinearColor @[out]
---@param OutIsValid boolean @[out]
function UKismetStringLibrary.Conv_StringToColor(InString, OutConvertedColor, OutIsValid) end

---Converts a string to a double value
---@param InString string
---@return number
function UKismetStringLibrary.Conv_StringToDouble(InString) end

---Converts a string to a int value
---@param InString string
---@return integer
function UKismetStringLibrary.Conv_StringToInt(InString) end

---Converts a string to a int value
---@param InString string
---@return integer
function UKismetStringLibrary.Conv_StringToInt64(InString) end

---Converts a string to a name value
---@param InString string
---@return string
function UKismetStringLibrary.Conv_StringToName(InString) end

---Convert String Back To Rotator. IsValid indicates whether or not the string could be successfully converted.
---@param InString string
---@param OutConvertedRotator FRotator @[out]
---@param OutIsValid boolean @[out]
function UKismetStringLibrary.Conv_StringToRotator(InString, OutConvertedRotator, OutIsValid) end

---Convert String Back To Vector. IsValid indicates whether or not the string could be successfully converted.
---@param InString string
---@param OutConvertedVector FVector @[out]
---@param OutIsValid boolean @[out]
function UKismetStringLibrary.Conv_StringToVector(InString, OutConvertedVector, OutIsValid) end

---Convert String Back To Vector2D. IsValid indicates whether or not the string could be successfully converted.
---@param InString string
---@param OutConvertedVector2D FVector2D @[out]
---@param OutIsValid boolean @[out]
function UKismetStringLibrary.Conv_StringToVector2D(InString, OutConvertedVector2D, OutIsValid) end

---Convert String Back To Float Vector. IsValid indicates whether or not the string could be successfully converted.
---@param InString string
---@param OutConvertedVector FVector3f @[out]
---@param OutIsValid boolean @[out]
function UKismetStringLibrary.Conv_StringToVector3f(InString, OutConvertedVector, OutIsValid) end

---Converts a transform value to a string, in the form 'Translation: X= Y= Z= Rotation: P= Y= R= Scale: X= Y= Z='
---@param InTrans FTransform
---@return string
function UKismetStringLibrary.Conv_TransformToString(InTrans) end

---Converts a vector2d value to a string, in the form 'X= Y='
---@param InVec FVector2D
---@return string
function UKismetStringLibrary.Conv_Vector2dToString(InVec) end

---Converts a float vector value to a string, in the form 'X= Y= Z='
---@param InVec FVector3f
---@return string
function UKismetStringLibrary.Conv_Vector3fToString(InVec) end

---Converts a vector value to a string, in the form 'X= Y= Z='
---@param InVec FVector
---@return string
function UKismetStringLibrary.Conv_VectorToString(InVec) end

---Takes an array of strings and removes any zero length entries.
---@param SourceString string
---@param InArray TArray<string> @[out]
---@return integer
function UKismetStringLibrary.CullArray(SourceString, InArray) end

---Test whether this string ends with given string.
---@param SourceString string
---@param InSuffix string
---@param SearchCase? integer @[default: IgnoreCase]
---@return boolean
function UKismetStringLibrary.EndsWith(SourceString, InSuffix, SearchCase) end

---Test if the input strings are equal (A == B), ignoring case
---@param A string @- The string to compare against
---@param B string @- The string to compare
---@return boolean
function UKismetStringLibrary.EqualEqual_StriStri(A, B) end

---Test if the input strings are equal (A == B)
---@param A string @- The string to compare against
---@param B string @- The string to compare
---@return boolean
function UKismetStringLibrary.EqualEqual_StrStr(A, B) end

---Finds the starting index of a substring in the a specified string
---@param SearchIn string @The string to search within
---@param Substring string @The string to look for in the SearchIn string
---@param bUseCase? boolean @[default: false] Whether or not to be case-sensitive
---@param bSearchFromEnd? boolean @[default: false] Whether or not to start the search from the end of the string instead of the beginning
---@param StartPosition? integer @[default: -1] The position to start the search from
---@return integer
function UKismetStringLibrary.FindSubstring(SearchIn, Substring, bUseCase, bSearchFromEnd, StartPosition) end

---Returns an array that contains one entry for each character in SourceString
---@param SourceString string
---@return TArray<string>
function UKismetStringLibrary.GetCharacterArrayFromString(SourceString) end

---Gets a single character from the string (as an integer)
---@param SourceString string @- The string to convert
---@param Index? integer @[default: 0] - Location of the character whose value is required
---@return integer
function UKismetStringLibrary.GetCharacterAsNumber(SourceString, Index) end

---Returns a substring from the string starting at the specified position
---@param SourceString string @- The string to get the substring from
---@param StartIndex? integer @[default: 0] - The location in SourceString to use as the start of the substring
---@param Length? integer @[default: 1] The length of the requested substring
---@return string
function UKismetStringLibrary.GetSubstring(SourceString, StartIndex, Length) end

---Returns true if the string is empty
---@param InString string @- The string to check
---@return boolean
function UKismetStringLibrary.IsEmpty(InString) end

---* Checks if a string contains only numeric characters
---* @@param       SourceString    The string to check
---* @@return true if the string only contains numeric characters
---@param SourceString string
---@return boolean
function UKismetStringLibrary.IsNumeric(SourceString) end

---Concatenates an array of strings into a single string.
---@param SourceArray TArray<string> @- The array of strings to concatenate.
---@param Separator? string @[default:  ] - The string used to separate each element.
---@return string
function UKismetStringLibrary.JoinStringArray(SourceArray, Separator) end

---Returns the left most given number of characters
---@param SourceString string
---@param Count integer
---@return string
function UKismetStringLibrary.Left(SourceString, Count) end

---Returns the left most characters from the string chopping the given number of characters from the end
---@param SourceString string
---@param Count integer
---@return string
function UKismetStringLibrary.LeftChop(SourceString, Count) end

---* Pad the left of this string for a specified number of characters
---* @@param       SourceString    The string to pad
---* @@param       ChCount                 Amount of padding required
---* @@return      The padded string
---@param SourceString string
---@param ChCount integer
---@return string
function UKismetStringLibrary.LeftPad(SourceString, ChCount) end

---Returns the number of characters in the string
---@param S string
---@return integer
function UKismetStringLibrary.Len(S) end

---Searches this string for a given wild card
---@param SourceString string
---@param Wildcard string
---@param SearchCase? integer @[default: IgnoreCase]
---@return boolean
function UKismetStringLibrary.MatchesWildcard(SourceString, Wildcard, SearchCase) end

---Returns the substring from Start position for Count characters.
---@param SourceString string
---@param Start integer
---@param Count integer
---@return string
function UKismetStringLibrary.Mid(SourceString, Start, Count) end

---Test if the input string are not equal (A != B), ignoring case differences
---@param A string @- The string to compare against
---@param B string @- The string to compare
---@return boolean
function UKismetStringLibrary.NotEqual_StriStri(A, B) end

---Test if the input string are not equal (A != B)
---@param A string @- The string to compare against
---@param B string @- The string to compare
---@return boolean
function UKismetStringLibrary.NotEqual_StrStr(A, B) end

---Gets an array of strings from a source string divided up by a separator and empty strings can optionally be culled.
---@param SourceString string @- The string to chop up
---@param Delimiter? string @[default:  ] - The string to delimit on
---@param CullEmptyStrings? boolean @[default: true] = true - Cull (true) empty strings or add them to the array (false)
---@return TArray<string>
function UKismetStringLibrary.ParseIntoArray(SourceString, Delimiter, CullEmptyStrings) end

---Replace all occurrences of a substring in this string
---@param SourceString string
---@param From string @substring to replace
---@param To string @substring to replace From with
---@param SearchCase? integer @[default: IgnoreCase]
---@return string
function UKismetStringLibrary.Replace(SourceString, From, To, SearchCase) end

---Replace all occurrences of SearchText with ReplacementText in this string.
---@param SourceString string @[out]
---@param SearchText string
---@param ReplacementText string
---@param SearchCase? integer @[default: IgnoreCase]
---@return integer
function UKismetStringLibrary.ReplaceInline(SourceString, SearchText, ReplacementText, SearchCase) end

---Returns a copy of this string, with the characters in reverse order
---@param SourceString string
---@return string
function UKismetStringLibrary.Reverse(SourceString) end

---Returns the string to the right of the specified location, counting back from the right (end of the word).
---@param SourceString string
---@param Count integer
---@return string
function UKismetStringLibrary.Right(SourceString, Count) end

---Returns the string to the right of the specified location, counting forward from the left (from the beginning of the word).
---@param SourceString string
---@param Count integer
---@return string
function UKismetStringLibrary.RightChop(SourceString, Count) end

---* Pad the right of this string for a specified number of characters
---* @@param       SourceString    The string to pad
---* @@param       ChCount                 Amount of padding required
---* @@return      The padded string
---@param SourceString string
---@param ChCount integer
---@return string
function UKismetStringLibrary.RightPad(SourceString, ChCount) end

---Splits this string at given string position case sensitive.
---@param SourceString string
---@param InStr string @The string to search and split at
---@param LeftS string @[out] out the string to the left of InStr, not updated if return is false
---@param RightS string @[out] out the string to the right of InStr, not updated if return is false
---@param SearchCase? integer @[default: IgnoreCase]
---@param SearchDir? integer @[default: FromStart]
---@return boolean
function UKismetStringLibrary.Split(SourceString, InStr, LeftS, RightS, SearchCase, SearchDir) end

---Test whether this string starts with given string.
---@param SourceString string
---@param InPrefix string
---@param SearchCase? integer @[default: IgnoreCase]
---@return boolean
function UKismetStringLibrary.StartsWith(SourceString, InPrefix, SearchCase) end

---Convert a number of seconds into minutes:seconds.milliseconds format string (including leading zeroes)
---@param InSeconds number
---@return string
function UKismetStringLibrary.TimeSecondsToString(InSeconds) end

---Returns a string converted to Lower case
---@param SourceString string
---@return string
function UKismetStringLibrary.ToLower(SourceString) end

---Returns a string converted to Upper case
---@param SourceString string
---@return string
function UKismetStringLibrary.ToUpper(SourceString) end

---Removes whitespace characters from the front of this string.
---@param SourceString string
---@return string
function UKismetStringLibrary.Trim(SourceString) end

---Removes trailing whitespace characters
---@param SourceString string
---@return string
function UKismetStringLibrary.TrimTrailing(SourceString) end

