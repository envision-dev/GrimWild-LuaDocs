---@meta
---A vector in 2-D space composed of components (X, Y) with floating point precision.
---A vector in 2-D space composed of components (X, Y) with floating point precision.
---@class FVector2D : Struct
---@field public X number
---@field public Y number
---@overload fun(): FVector2D @Both components zero.
---@overload fun(XY: number): FVector2D @The same value in both components.
---@overload fun(X: number, Y: number): FVector2D
---@overload fun(Other: FVector2D): FVector2D @A copy.
---@operator add(FVector2D|number): FVector2D @Returns a new vector. A number must be on the right: '2 + V' is an error. Add() changes this vector instead.
---@operator sub(FVector2D|number): FVector2D @Returns a new vector. A number must be on the right. Sub() changes this vector instead.
---@operator mul(FVector2D|number): FVector2D @Component by component, or scaled by a number on the right. Mul() changes this vector instead.
---@operator div(FVector2D|number): FVector2D @Division by zero gives infinity rather than an error. Div() changes this vector instead.
---@operator unm: FVector2D
FVector2D = {}

---@type FVector2D
FVector2D.ZeroVector = nil

---Dot product. Zero when the two vectors are perpendicular.
---@param Other FVector2D 
---@return number
function FVector2D:Dot(Other) end

---Magnitude of the cross product. Positive when Other lies counter-clockwise of this vector.
---@param Other FVector2D 
---@return number
function FVector2D:Cross(Other) end

---@return number
function FVector2D:Size() end

---Cheaper than Size and enough for comparing two lengths.
---@return number
function FVector2D:SizeSquared() end

---@param A FVector2D 
---@param B FVector2D 
---@return number
function FVector2D.Dist(A, B) end

---Cheaper than Dist and enough for comparing two distances.
---@param A FVector2D 
---@param B FVector2D 
---@return number
function FVector2D.DistSquared(A, B) end

---Writes components of this vector. Arguments left off the end are not touched, so Set(9) changes only X. A component cannot be skipped: passing nil is an error.
---@param X? number
---@param Y? number
function FVector2D:Set(X, Y) end

---Scales this vector to unit length. A vector shorter than the tolerance is left as it is.
---@param Tolerance? number @Compared against the squared length, not the length.
function FVector2D:Normalize(Tolerance) end

---Whether the vector is of unit length, within a small tolerance.
---@return boolean
function FVector2D:IsNormalized() end

---Adds to this vector. Use '+' to get a new vector instead.
---@param Rhs FVector2D|number @A number is added to every component.
function FVector2D:Add(Rhs) end

---Subtracts from this vector. Use '-' to get a new vector instead.
---@param Rhs FVector2D|number @A number is subtracted from every component.
function FVector2D:Sub(Rhs) end

---Multiplies this vector. Use '*' to get a new vector instead.
---@param Rhs FVector2D|number @A number scales every component.
function FVector2D:Mul(Rhs) end

---Divides this vector. Use '/' to get a new vector instead. Division by zero gives infinity rather than an error.
---@param Rhs FVector2D|number @A number divides every component.
function FVector2D:Div(Rhs) end
