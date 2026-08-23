---@meta
---An orthogonal rotation in 3d space.
---An orthogonal rotation in 3-D space, in degrees.
---@class FRotator : Struct
---@field public Pitch number @Pitch (degrees) around Y axis
---@field public Yaw number @Yaw (degrees) around Z axis
---@field public Roll number @Roll (degrees) around X axis
---@overload fun(): FRotator @All three angles zero.
---@overload fun(Angle: number): FRotator @The same angle in Pitch, Yaw and Roll, which is rarely what is wanted.
---@overload fun(Pitch: number, Yaw: number, Roll: number): FRotator
---@overload fun(Other: FRotator): FRotator @A copy.
---@operator add(FRotator): FRotator @Returns a new rotator. Add() changes this rotator instead.
---@operator sub(FRotator): FRotator @Returns a new rotator. Sub() changes this rotator instead.
---@operator mul(number): FRotator @Every angle scaled. Mul() changes this rotator instead.
FRotator = {}

---Brings every angle into the range (-180, 180] in place.
function FRotator:Normalize() end

---A copy with every angle brought into the range (-180, 180]. This rotator is left as it is.
---@return FRotator
function FRotator:GetNormalized() end

---Rotates a vector by this rotation.
---@param Vec FVector 
---@return FVector
function FRotator:RotateVector(Vec) end

---Applies the inverse of this rotation to a vector, undoing RotateVector.
---@param Vec FVector 
---@return FVector
function FRotator:UnrotateVector(Vec) end

---A copy with every angle brought into the range [0, 360). Despite the name this does not clamp to a minimum and maximum. This rotator is left as it is.
---@return FRotator
function FRotator:Clamp() end

---The direction this rotation faces, as a unit vector. ToVector is the same function under another name.
---@return FVector
function FRotator:GetForwardVector() end

---The direction this rotation faces, as a unit vector. GetForwardVector is the same function under another name.
---@return FVector
function FRotator:ToVector() end

---The three angles as a vector, with Roll in X, Pitch in Y and Yaw in Z.
---@return FVector
function FRotator:ToEuler() end

---@return FQuat
function FRotator:ToQuat() end

---The rotation that undoes this one.
---@return FRotator
function FRotator:Inverse() end

---@param P0 FRotator 
---@return FRotator
function FRotator:__add(P0) end

---@param P0 FRotator 
---@return FRotator
function FRotator:__sub(P0) end

---@param P0 number 
---@return FRotator
function FRotator:__mul(P0) end

---Adds to this rotator and returns it. Use '+' to get a new rotator instead.
---@param Rhs FRotator 
---@return FRotator
function FRotator:Add(Rhs) end

---Subtracts from this rotator and returns it. Use '-' to get a new rotator instead.
---@param Rhs FRotator 
---@return FRotator
function FRotator:Sub(Rhs) end

---Scales every angle of this rotator and returns it. Use '*' to get a new rotator instead.
---@param Rhs number 
---@return FRotator
function FRotator:Mul(Rhs) end

---The direction to the right of this rotation, as a unit vector.
---@param Out? FVector @When given, the result is written into it and it is returned. Must be a valid FVector, never nil.
---@return FVector
function FRotator:GetRightVector(Out) end

---The direction above this rotation, as a unit vector.
---@param Out? FVector @When given, the result is written into it and it is returned. Must be a valid FVector, never nil.
---@return FVector
function FRotator:GetUpVector(Out) end

---One axis of this rotation, as a unit vector.
---@param Axis integer @1 for X, 2 for Y, 3 for Z.
---@param Out? FVector @When given, the result is written into it and it is returned. Must be a valid FVector, never nil.
---@return FVector
function FRotator:GetUnitAxis(Axis, Out) end

---Writes angles of this rotator. Arguments left off the end are not touched. A component cannot be skipped: passing nil is an error.
---@param Pitch? number
---@param Yaw? number
---@param Roll? number
function FRotator:Set(Pitch, Yaw, Roll) end
