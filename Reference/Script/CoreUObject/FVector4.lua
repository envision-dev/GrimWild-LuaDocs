---@meta
---A 4-D homogeneous vector.
---A vector in 4-D space composed of components (X, Y, Z, W) with floating point precision.
---@class FVector4 : Struct
---@field public X number
---@field public Y number @Alias for float/double depending on LWC status. Note: Will be refactored to double before UE5 ships.
---@field public Z number
---@field public W number
---@overload fun(): FVector4 @All components zero, W included.
---@overload fun(X: number): FVector4 @Y and Z become zero and W becomes one, unlike the other vector types where a single argument fills every component.
---@overload fun(X: number, Y: number): FVector4 @Z becomes zero and W becomes one.
---@overload fun(X: number, Y: number, Z: number): FVector4 @W becomes one.
---@overload fun(X: number, Y: number, Z: number, W: number): FVector4
---@overload fun(Other: FVector4): FVector4 @A copy.
---@operator add(FVector4|number): FVector4 @Returns a new vector. A number must be on the right. Add() changes this vector instead.
---@operator sub(FVector4|number): FVector4 @Returns a new vector. A number must be on the right. Sub() changes this vector instead.
---@operator mul(FVector4|number): FVector4 @Component by component, or scaled by a number on the right. Mul() changes this vector instead.
---@operator div(FVector4|number): FVector4 @Division by zero gives infinity rather than an error. Div() changes this vector instead.
---@operator unm: FVector4
FVector4 = {}

---Dot product of the X, Y and Z components. W takes no part.
---@param A FVector4 
---@param B FVector4 
---@return number
function FVector4.Dot3(A, B) end

---Cross product. W takes no part.
---@param Other FVector4 
---@return FVector4
function FVector4:Cross(Other) end

---Length over all four components, W included.
---@return number
function FVector4:Size() end

---Length over X, Y and Z only.
---@return number
function FVector4:Size3() end

---Cheaper than Size and enough for comparing two lengths.
---@return number
function FVector4:SizeSquared() end

---Cheaper than Size3 and enough for comparing two lengths.
---@return number
function FVector4:SizeSquared3() end

---The rotation pointing along X, Y and Z. Roll is always zero, since a direction alone does not determine it.
---@return FRotator
function FVector4:ToRotator() end

---The rotation pointing along X, Y and Z. Roll is always zero.
---@return FQuat
function FVector4:ToQuat() end

---Writes components of this vector. Arguments left off the end are not touched. A component cannot be skipped: passing nil is an error.
---@param X? number
---@param Y? number
---@param Z? number
---@param W? number
function FVector4:Set(X, Y, Z, W) end

---Adds to this vector. Use '+' to get a new vector instead.
---@param Rhs FVector4|number @A number is added to every component.
function FVector4:Add(Rhs) end

---Subtracts from this vector. Use '-' to get a new vector instead.
---@param Rhs FVector4|number @A number is subtracted from every component.
function FVector4:Sub(Rhs) end

---Multiplies this vector. Use '*' to get a new vector instead.
---@param Rhs FVector4|number @A number scales every component.
function FVector4:Mul(Rhs) end

---Divides this vector. Use '/' to get a new vector instead. Division by zero gives infinity rather than an error.
---@param Rhs FVector4|number @A number divides every component.
function FVector4:Div(Rhs) end
