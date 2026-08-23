---@meta
---A point or direction FVector in 3d space.
---A vector in 3-D space composed of components (X, Y, Z) with floating point precision.
---@class FVector : Struct
---@field public X number
---@field public Y number @Alias for float/double depending on LWC status. Note: Will be refactored to double before UE5 ships.
---@field public Z number
---@overload fun(): FVector @All components zero.
---@overload fun(XYZ: number): FVector @The same value in all three components.
---@overload fun(X: number, Y: number, Z: number): FVector
---@overload fun(Other: FVector): FVector @A copy.
---@operator add(FVector|number): FVector @Returns a new vector. A number must be on the right: '2 + V' is an error. Add() changes this vector instead.
---@operator sub(FVector|number): FVector @Returns a new vector. A number must be on the right. Sub() changes this vector instead.
---@operator mul(FVector|number): FVector @Component by component, or scaled by a number on the right. Mul() changes this vector instead.
---@operator div(FVector|number): FVector @Division by zero gives infinity rather than an error. Div() changes this vector instead.
---@operator unm: FVector
FVector = {}

---Dot product. Zero when the two vectors are perpendicular.
---@param Other FVector 
---@return number
function FVector:Dot(Other) end

---Cross product, perpendicular to both vectors.
---@param Other FVector 
---@return FVector
function FVector:Cross(Other) end

---@return number
function FVector:Size() end

---Length ignoring Z.
---@return number
function FVector:Size2D() end

---Cheaper than Size and enough for comparing two lengths.
---@return number
function FVector:SizeSquared() end

---Cheaper than Size2D and enough for comparing two lengths. Ignores Z.
---@return number
function FVector:SizeSquared2D() end

---@param A FVector 
---@param B FVector 
---@return number
function FVector.Dist(A, B) end

---Distance ignoring Z.
---@param A FVector 
---@param B FVector 
---@return number
function FVector.Dist2D(A, B) end

---Cheaper than Dist and enough for comparing two distances.
---@param A FVector 
---@param B FVector 
---@return number
function FVector.DistSquared(A, B) end

---Cheaper than Dist2D and enough for comparing two distances. Ignores Z.
---@param A FVector 
---@param B FVector 
---@return number
function FVector.DistSquared2D(A, B) end

---Whether the vector is of unit length, within a small tolerance.
---@return boolean
function FVector:IsNormalized() end

---Cosine of the angle between the two vectors projected onto the XY plane.
---@param Other FVector 
---@return number
function FVector:CosineAngle2D(Other) end

---A copy of this vector rotated about an axis. This vector is left as it is.
---@param AngleDeg number 
---@param Axis FVector 
---@return FVector
function FVector:RotateAngleAxis(AngleDeg, Axis) end

---The rotation pointing along this vector. Roll is always zero, since a direction alone does not determine it.
---@return FRotator
function FVector:ToRotator() end

---The rotation pointing along this vector. Roll is always zero.
---@return FQuat
function FVector:ToQuat() end

---Writes components of this vector. Arguments left off the end are not touched, so Set(9) changes only X. A component cannot be skipped: passing nil is an error.
---@param X? number
---@param Y? number
---@param Z? number
function FVector:Set(X, Y, Z) end

---Scales this vector to unit length. A vector shorter than the tolerance is left as it is.
---@param Tolerance? number @Compared against the squared length, not the length.
---@return boolean
function FVector:Normalize(Tolerance) end

---Adds to this vector. Use '+' to get a new vector instead.
---@param Rhs FVector|number @A number is added to every component.
function FVector:Add(Rhs) end

---Subtracts from this vector. Use '-' to get a new vector instead.
---@param Rhs FVector|number @A number is subtracted from every component.
function FVector:Sub(Rhs) end

---Multiplies this vector. Use '*' to get a new vector instead.
---@param Rhs FVector|number @A number scales every component.
function FVector:Mul(Rhs) end

---Divides this vector. Use '/' to get a new vector instead. Division by zero gives infinity rather than an error.
---@param Rhs FVector|number @A number divides every component.
function FVector:Div(Rhs) end
