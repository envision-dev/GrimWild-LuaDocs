---@class UMathInputBPLib : UBlueprintFunctionLibrary
UMathInputBPLib = {}

---Create a MathOp input from a scalar float (broadcasts to all four channels).
---@param Value number
---@return FBPMathInput
function UMathInputBPLib.MathInput_FromScalar(Value) end

---Create a MathOp input from a render-target texture.
---@param Texture UTexture
---@return FBPMathInput
function UMathInputBPLib.MathInput_FromTexture(Texture) end

---Create a MathOp input from an RGBA color value.
---@param Vector FLinearColor
---@return FBPMathInput
function UMathInputBPLib.MathInput_FromVector(Vector) end

