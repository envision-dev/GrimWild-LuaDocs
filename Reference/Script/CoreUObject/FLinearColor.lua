---@meta
---A linear, 32-bit/component floating point RGBA color.
---A colour with a floating point value per channel, normally running from 0 to 1 but not limited to it. What materials and lights work in.
---@class FLinearColor : Struct
---@field public R number
---@field public G number
---@field public B number
---@field public A number
---@overload fun(): FLinearColor @Every channel zero, alpha included.
---@overload fun(R: number, G: number, B: number): FLinearColor @Alpha becomes one.
---@overload fun(R: number, G: number, B: number, A: number): FLinearColor
---@overload fun(Other: FLinearColor): FLinearColor @A copy.
---@operator add(FLinearColor|number): FLinearColor @Returns a new colour. A number must be on the right. Add() changes this colour instead.
---@operator sub(FLinearColor|number): FLinearColor @Returns a new colour. Sub() changes this colour instead.
---@operator mul(FLinearColor|number): FLinearColor @Channel by channel, or scaled by a number on the right. Mul() changes this colour instead.
---@operator div(FLinearColor|number): FLinearColor @Div() changes this colour instead.
FLinearColor = {}

---@type FLinearColor
FLinearColor.Black = nil

---@type FLinearColor
FLinearColor.White = nil

---@type FLinearColor
FLinearColor.Red = nil

---@type FLinearColor
FLinearColor.Green = nil

---@type FLinearColor
FLinearColor.Blue = nil

---@type FLinearColor
FLinearColor.Yellow = nil

---@type FLinearColor
FLinearColor.Gray = nil

---Converts to eight bits per channel. The argument has no default and the call fails silently without it, returning nothing.
---@param SRGB boolean @True encodes for display, which is what a colour headed for the interface wants. False multiplies each channel by 255 unchanged.
---@return FColor
function FLinearColor:ToFColor(SRGB) end

---A copy with every channel brought into the given range. This colour is left as it is.
---@param Min number 
---@param Max number 
---@return FLinearColor
function FLinearColor:Clamp(Min, Max) end

---Writes channels of this colour. Arguments left off the end are not touched. A channel cannot be skipped: passing nil is an error.
---@param R? number
---@param G? number
---@param B? number
---@param A? number
function FLinearColor:Set(R, G, B, A) end

---Adds to this colour. Use '+' to get a new colour instead.
---@param Rhs FLinearColor|number
function FLinearColor:Add(Rhs) end

---Subtracts from this colour. Use '-' to get a new colour instead.
---@param Rhs FLinearColor|number
function FLinearColor:Sub(Rhs) end

---Multiplies this colour. Use '*' to get a new colour instead.
---@param Rhs FLinearColor|number
function FLinearColor:Mul(Rhs) end

---Divides this colour. Use '/' to get a new colour instead.
---@param Rhs FLinearColor|number
function FLinearColor:Div(Rhs) end
