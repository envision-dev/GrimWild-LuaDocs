---@meta
---Stores a color with 8 bits of precision per channel. (BGRA).
---A colour with eight bits per channel, in the order B, G, R, A. Values run from 0 to 255.
---@class FColor : Struct
---@field public B integer
---@field public G integer
---@field public R integer
---@field public A integer
---@overload fun(): FColor @Every channel zero, alpha included, so fully transparent black.
---@overload fun(Packed: integer): FColor @A single packed 32-bit value, not a per-channel value. FColor(255) is blue, not white.
---@overload fun(R: integer, G: integer, B: integer): FColor @Alpha becomes zero.
---@overload fun(R: integer, G: integer, B: integer, A: integer): FColor
---@overload fun(Other: FColor): FColor @A copy.
---@operator add(FColor): FColor @Returns a new colour. Add() changes this colour instead. Channels saturate at 255 rather than wrapping.
FColor = {}

---@type FColor
FColor.White = nil

---@type FColor
FColor.Black = nil

---@type FColor
FColor.Red = nil

---@type FColor
FColor.Green = nil

---@type FColor
FColor.Blue = nil

---@type FColor
FColor.Yellow = nil

---@type FColor
FColor.Cyan = nil

---@type FColor
FColor.Magenta = nil

---@type FColor
FColor.Orange = nil

---@type FColor
FColor.Purple = nil

---@type FColor
FColor.Turquoise = nil

---@type FColor
FColor.Silver = nil

---@type FColor
FColor.Emerald = nil

---Adds another colour to this one. Use '+' to get a new colour instead.
---@param Rhs FColor 
function FColor:Add(Rhs) end

---Each channel divided by 255, with no gamma correction applied. A channel of 128 becomes 0.502, not 0.216. When the colour came from a colour picker or an image, this is not the conversion that preserves its appearance.
---@return FLinearColor
function FColor:ToLinearColor() end

---Writes channels of this colour. Arguments left off the end are not touched. A channel cannot be skipped: passing nil is an error.
---@param R? integer
---@param G? integer
---@param B? integer
---@param A? integer
function FColor:Set(R, G, B, A) end
