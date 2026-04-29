---Some useful methods exposed to blueprints
---@class UEnvisionStatics : UBlueprintFunctionLibrary
UEnvisionStatics = {}

---
---@param StringToAppend string
---@param LocalDirectory string @should start with name and end with slash (e.g. "Saved/Logs/")
---@param FileName string
---@return boolean
function UEnvisionStatics.AppendStringToFile(StringToAppend, LocalDirectory, FileName) end

---@param InCelsius number
---@return number
function UEnvisionStatics.CelsiusToFahrenheit(InCelsius) end

---Copies the contents of the source texture (or RT) to the given render target.
---Formats of the two textures must match.
---@param SourceTexture UTexture
---@param RenderTarget UTextureRenderTarget2D
function UEnvisionStatics.CopyTextureToRenderTarget(SourceTexture, RenderTarget) end

---Transfers FString to the clipboard
---@param String string
function UEnvisionStatics.CopyToClipboard(String) end

---Version that applies Filter before render target initialization
---@param WorldContextObject UObject
---@param Width integer
---@param Height integer
---@param Format integer
---@param InFilter? integer @[default: TF_Nearest]
---@param ClearColor? FLinearColor @[default: (R=0.000000,G=0.000000,B=0.000000,A=0.000000)]
---@param bAutoGenerateMipMaps? boolean @[default: false]
---@param bSupportUAVs? boolean @[default: true]
---@return UTextureRenderTarget2D
function UEnvisionStatics.CreateRenderTarget2D(WorldContextObject, Width, Height, Format, InFilter, ClearColor, bAutoGenerateMipMaps, bSupportUAVs) end

---Time
---@param InDateTime FDateTime
---@return string
function UEnvisionStatics.DateTimeToString(InDateTime) end

---Utilities
---@param OutString string @[out]
function UEnvisionStatics.DebugGPUInfo(OutString) end

---@param InString string
---@param OutValue number @[out]
---@return boolean
function UEnvisionStatics.EvaluateString(InString, OutValue) end

---Constructs an absolute path for the given filename in target local directory
---@param LocalDirectory string @should start with name and end with slash (e.g. "Saved/Logs/")
---@param FileName string
---@return string
function UEnvisionStatics.GetAbsoluteFilenamePath(LocalDirectory, FileName) end

---@return number
function UEnvisionStatics.GetApplicationScale() end

---@param Class TSubclassOf<UObject>
---@return UObject
function UEnvisionStatics.GetClassDefaultObject(Class) end

---Return format: C:/Path/To/Project/
---@return string
function UEnvisionStatics.GetFullProjectPath() end

---@param Object UObject
---@param OuterClass TSubclassOf<UObject>
---@return UObject
function UEnvisionStatics.GetOuterObjectOfClass(Object, OuterClass) end

---Gets the ProjectVersion field config value defined in Project Settings
---@return string
function UEnvisionStatics.GetProjectVersion() end

---Gets the current size of the object in memory
---@param Object UObject
---@return integer
function UEnvisionStatics.GetResourceSizeBytes(Object) end

---@param Curve FRuntimeFloatCurve
---@param Time number
---@return number
function UEnvisionStatics.GetRuntimeCurveFloatValue(Curve, Time) end

---Returns a nice-looking formatted string from the given time. Format: 01:02:03 (24-hour)
---@param InDateTime FDateTime
---@param Result string @[out]
function UEnvisionStatics.GetTime24String(InDateTime, Result) end

---//For Lua
---@param Value FIntVector2
---@return string
function UEnvisionStatics.IntVector2ToString(Value) end

---Works even in Shipping
---@param StatName string
---@return boolean
function UEnvisionStatics.IsStatEnabled(StatName) end

---Launches the given URL.
---Can be Windows path to open directory/file in Windows explorer (file:///c:/path/to/file.txt)
---Or it can be web URL that needs to be opened with web browser
---@param URL string
---@param WebParams string
function UEnvisionStatics.LaunchURL(URL, WebParams) end

---Allows us to select Curve Float assets from Content Browser without creating BP variables
---@param Curve UCurveFloat
---@return UCurveFloat
function UEnvisionStatics.LiteralCurveFloat(Curve) end

---
---@param LocalDirectory string @should start with name and end with slash (e.g. "Saved/Logs/")
---@param FileName string
---@param OutString string @[out]
---@return boolean
function UEnvisionStatics.LoadStringFromFile(LocalDirectory, FileName, OutString) end

---1 << Element index
---@param InBits TArray<boolean>
---@return integer
function UEnvisionStatics.MakeBitmask(InBits) end

---@param OutString string @[out]
function UEnvisionStatics.PasteFromClipboard(OutString) end

---Saves string to .txt file in local game or project directory.
---@param StringToSave string
---@param LocalDirectory string @should start with name and end with slash (e.g. "Saved/Logs/")
---@param FileName string
---@param bAllowOverwriting? boolean @[default: false]
---@return boolean
function UEnvisionStatics.SaveStringToFile(StringToSave, LocalDirectory, FileName, bAllowOverwriting) end

---@param NewValue number
function UEnvisionStatics.SetApplicationScale(NewValue) end

---@param X integer
---@param Y integer
---@param WindowMode integer
function UEnvisionStatics.SetScreenResolution(X, Y, WindowMode) end

---@param NewValue number
function UEnvisionStatics.SetUnfocusedVolumeMultiplier(NewValue) end

---@param Hour integer
---@param Minute integer
---@return string
function UEnvisionStatics.Time24To12Format(Hour, Minute) end

