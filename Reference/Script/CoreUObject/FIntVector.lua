---@meta
---An integer vector in 3D space.
---A vector in 3-D space composed of whole-number components (X, Y, Z). Arithmetic truncates rather than rounding.
---@class FIntVector : Struct
---@field public X integer
---@field public Y integer
---@field public Z integer
---@overload fun(): FIntVector @All components zero.
---@overload fun(XYZ: integer): FIntVector @The same value in all three components.
---@overload fun(X: integer, Y: integer, Z: integer): FIntVector
---@overload fun(Other: FIntVector): FIntVector @A copy.
---@operator add(FIntVector|integer): FIntVector @Returns a new vector. A number must be on the right. Add() changes this vector instead.
---@operator sub(FIntVector|integer): FIntVector @Returns a new vector. A number must be on the right. Sub() changes this vector instead.
---@operator mul(FIntVector|integer): FIntVector @Component by component, or scaled by a number on the right. Mul() changes this vector instead.
---@operator div(FIntVector|integer): FIntVector @Integer division. Div() changes this vector instead.
---@operator unm: FIntVector
FIntVector = {}

---Length of the vector, truncated to a whole number: a vector of (1, 1, 1) reports 1 rather than 1.73. Not suitable for comparing two lengths; use SizeSquared for that.
---@return integer
function FIntVector:Size() end

---Writes components of this vector. Arguments left off the end are not touched. A component cannot be skipped: passing nil is an error.
---@param X? integer
---@param Y? integer
---@param Z? integer
function FIntVector:Set(X, Y, Z) end

---Cheaper than Size and enough for comparing two lengths.
---@return integer
function FIntVector:SizeSquared() end

---Adds to this vector. Use '+' to get a new vector instead.
---@param Rhs FIntVector|integer
function FIntVector:Add(Rhs) end

---Subtracts from this vector. Use '-' to get a new vector instead.
---@param Rhs FIntVector|integer
function FIntVector:Sub(Rhs) end

---Multiplies this vector. Use '*' to get a new vector instead.
---@param Rhs FIntVector|integer
function FIntVector:Mul(Rhs) end

---Divides this vector. Use '/' to get a new vector instead.
---@param Rhs FIntVector|integer
function FIntVector:Div(Rhs) end
