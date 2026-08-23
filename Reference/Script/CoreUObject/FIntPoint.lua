---@meta
---Screen coordinates.
---A point in 2-D space with whole-number components (X, Y). Commonly used for screen and texture sizes.
---@class FIntPoint : Struct
---@field public X integer
---@field public Y integer
---@overload fun(): FIntPoint @Both components zero.
---@overload fun(XY: integer): FIntPoint @The same value in both components.
---@overload fun(X: integer, Y: integer): FIntPoint
---@overload fun(Other: FIntPoint): FIntPoint @A copy.
---@operator add(FIntPoint|integer): FIntPoint @Returns a new point. A number must be on the right. Add() changes this point instead.
---@operator sub(FIntPoint|integer): FIntPoint @Returns a new point. A number must be on the right. Sub() changes this point instead.
---@operator mul(FIntPoint|integer): FIntPoint @Component by component, or scaled by a number on the right. Mul() changes this point instead.
---@operator div(FIntPoint|integer): FIntPoint @Integer division. Div() changes this point instead.
---@operator unm: FIntPoint
FIntPoint = {}

---Distance from the origin, truncated to a whole number: a point at (1, 1) reports 1 rather than 1.41. Not suitable for comparing two distances; use SizeSquared for that.
---@return integer
function FIntPoint:Size() end

---Cheaper than Size and enough for comparing two lengths.
---@return integer
function FIntPoint:SizeSquared() end

---Writes components of this point. Arguments left off the end are not touched. A component cannot be skipped: passing nil is an error.
---@param X? integer
---@param Y? integer
function FIntPoint:Set(X, Y) end

---Adds to this point. Use '+' to get a new point instead.
---@param Rhs FIntPoint|integer
function FIntPoint:Add(Rhs) end

---Subtracts from this point. Use '-' to get a new point instead.
---@param Rhs FIntPoint|integer
function FIntPoint:Sub(Rhs) end

---Multiplies this point. Use '*' to get a new point instead.
---@param Rhs FIntPoint|integer
function FIntPoint:Mul(Rhs) end

---Divides this point. Use '/' to get a new point instead.
---@param Rhs FIntPoint|integer
function FIntPoint:Div(Rhs) end
