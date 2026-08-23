---@meta
---Quaternion.
---A rotation in 3-D space stored as a quaternion. Free of the gimbal lock FRotator can suffer, and the right choice for interpolating between rotations.
---@class FQuat : Struct
---@field public X number
---@field public Y number @Alias for float/double depending on LWC status. Note: Will be refactored to double before UE5 ships.
---@field public Z number
---@field public W number
---@overload fun(): FQuat @All components zero, which is not a valid rotation. Use FQuat(0, 0, 0, 1) for no rotation.
---@overload fun(X: number, Y: number, Z: number, W: number): FQuat
---@overload fun(Other: FQuat): FQuat @A copy.
---@operator add(FQuat): FQuat @Returns a new quaternion. Adding quaternions is not the same as combining rotations; use '*' for that. Add() changes this quaternion instead.
---@operator sub(FQuat): FQuat @Returns a new quaternion. Sub() changes this quaternion instead.
---@operator mul(FQuat|number): FQuat @Two quaternions combine into the rotation that applies both. A number scales the components. Mul() changes this quaternion instead.
---@operator div(number): FQuat @Returns a new quaternion. Div() changes this quaternion instead.
FQuat = {}

---A copy scaled to unit length. This quaternion is left as it is.
---@param P0 number 
---@return FQuat
function FQuat:GetNormalized(P0) end

---Whether this quaternion is of unit length, within a small tolerance. Only a unit quaternion is a valid rotation.
---@return boolean
function FQuat:IsNormalized() end

---@return number
function FQuat:Size() end

---Cheaper than Size and enough for comparing two lengths.
---@return number
function FQuat:SizeSquared() end

---The rotation that undoes this one.
---@return FQuat
function FQuat:Inverse() end

---Rotates a vector by this rotation.
---@param Vec FVector 
---@return FVector
function FQuat:RotateVector(Vec) end

---Applies the inverse of this rotation to a vector, undoing RotateVector.
---@param Vec FVector 
---@return FVector
function FQuat:UnrotateVector(Vec) end

---The X axis of this rotation, as a unit vector. GetForwardVector is the same function under another name.
---@return FVector
function FQuat:GetAxisX() end

---The Y axis of this rotation, as a unit vector. GetRightVector is the same function under another name.
---@return FVector
function FQuat:GetAxisY() end

---The Z axis of this rotation, as a unit vector. GetUpVector is the same function under another name.
---@return FVector
function FQuat:GetAxisZ() end

---The direction this rotation faces, as a unit vector.
---@return FVector
function FQuat:GetForwardVector() end

---The direction to the right of this rotation, as a unit vector.
---@return FVector
function FQuat:GetRightVector() end

---The direction above this rotation, as a unit vector.
---@return FVector
function FQuat:GetUpVector() end

---Interpolates along the shortest arc between two rotations, which is what makes quaternions worth using. Called with a dot, not a colon.
---@param A FQuat 
---@param B FQuat 
---@param Alpha number @0 gives A, 1 gives B.
---@return FQuat
function FQuat.Slerp(A, B, Alpha) end

---The three angles as a vector, with Roll in X, Pitch in Y and Yaw in Z.
---@return FVector
function FQuat:ToEuler() end

---@return FRotator
function FQuat:ToRotator() end

---@param P0 FQuat 
---@return FQuat
function FQuat:__add(P0) end

---@param P0 FQuat 
---@return FQuat
function FQuat:__sub(P0) end

---@param P0 number 
---@return FQuat
function FQuat:__div(P0) end

---Adds to this quaternion and returns it. Use '+' to get a new quaternion instead.
---@param Rhs FQuat 
---@return FQuat
function FQuat:Add(Rhs) end

---Subtracts from this quaternion and returns it. Use '-' to get a new quaternion instead.
---@param Rhs FQuat 
---@return FQuat
function FQuat:Sub(Rhs) end

---Divides this quaternion and returns it. Use '/' to get a new quaternion instead.
---@param Rhs number 
---@return FQuat
function FQuat:Div(Rhs) end

---Scales this quaternion to unit length in place. Unlike FVector:Normalize this reports nothing about whether it succeeded.
---@param Tolerance? number @Compared against the squared length, not the length.
function FQuat:Normalize(Tolerance) end

---Builds a rotation from an axis and an angle. Called with a dot, not a colon.
---@param Axis FVector @Should be of unit length.
---@param Angle number @In radians, not degrees.
---@param Out? FQuat @When given, the result is written into it and it is returned. Must be a valid FQuat, never nil.
---@return FQuat
function FQuat.FromAxisAndAngle(Axis, Angle, Out) end

---The axis this rotation turns about and how far it turns.
---@return FVector @The axis, as a unit vector.
---@return number @The angle in radians, not degrees.
function FQuat:ToAxisAndAngle() end

---Writes components of this quaternion. Arguments left off the end are not touched. A component cannot be skipped: passing nil is an error.
---@param X? number
---@param Y? number
---@param Z? number
---@param W? number
function FQuat:Set(X, Y, Z, W) end

---Combines this rotation with another, or scales it by a number. Use '*' to get a new quaternion instead.
---@param Rhs FQuat|number
function FQuat:Mul(Rhs) end
