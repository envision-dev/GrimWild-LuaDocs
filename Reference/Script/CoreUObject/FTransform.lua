---@meta
---Transform composed of Quat/Translation/Scale.
---A position, rotation and scale together. What actors and components use to describe where they are.
---@class FTransform : Struct
---@field public Rotation FQuat @Rotation of this transformation, as a quaternion.
---@field public Translation FVector @Translation of this transformation, as a vector.
---@field public Scale3D FVector @3D scale (always applied in local space) as a vector.
---@overload fun(): FTransform @No rotation, no translation, unit scale.
---@overload fun(Rotation: FQuat|FRotator): FTransform
---@overload fun(Translation: FVector): FTransform
---@overload fun(Other: FTransform): FTransform @A copy.
---@overload fun(Rotation: FQuat|FRotator, Translation: FVector): FTransform
---@overload fun(Rotation: FQuat|FRotator, Translation: FVector, Scale: FVector): FTransform
---@operator add(FTransform): FTransform @Adds translation, rotation and scale component by component, which is rarely meaningful for scale. Use '*' to combine two transforms. Add() changes this transform instead.
---@operator mul(FTransform): FTransform @Composes the two transforms: 'A * B' applies A first and then B, which is the opposite of the usual matrix reading. Mul() changes this transform instead.
FTransform = {}

---The transform that undoes this one.
---@return FTransform
function FTransform:Inverse() end

---Moves a point from local space into the space this transform describes. Scale, rotation and translation all apply.
---@param Position FVector 
---@return FVector
function FTransform:TransformPosition(Position) end

---As TransformPosition, but scale is not applied.
---@param Position FVector 
---@return FVector
function FTransform:TransformPositionNoScale(Position) end

---Moves a point from the space this transform describes back into local space.
---@param Position FVector 
---@return FVector
function FTransform:InverseTransformPosition(Position) end

---As InverseTransformPosition, but scale is not applied.
---@param Position FVector 
---@return FVector
function FTransform:InverseTransformPositionNoScale(Position) end

---Moves a direction into the space this transform describes. Translation is not applied, which is what separates this from TransformPosition.
---@param Vec FVector 
---@return FVector
function FTransform:TransformVector(Vec) end

---As TransformVector, but scale is not applied either.
---@param Vec FVector 
---@return FVector
function FTransform:TransformVectorNoScale(Vec) end

---Moves a direction back into local space. Translation is not applied.
---@param Vec FVector 
---@return FVector
function FTransform:InverseTransformVector(Vec) end

---As InverseTransformVector, but scale is not applied either.
---@param Vec FVector 
---@return FVector
function FTransform:InverseTransformVectorNoScale(Vec) end

---Combines a rotation with this transform's rotation.
---@param Rotation FQuat 
---@return FQuat
function FTransform:TransformRotation(Rotation) end

---Removes this transform's rotation from a rotation, undoing TransformRotation.
---@param Rotation FQuat 
---@return FQuat
function FTransform:InverseTransformRotation(Rotation) end

---@param P0 FTransform 
---@return FTransform
function FTransform:__add(P0) end

---Adds another transform to this one component by component and returns it. Scales are added rather than combined, which is rarely what is wanted; use Mul to compose two transforms. Use '+' to get a new transform instead.
---@param Rhs FTransform 
---@return FTransform
function FTransform:Add(Rhs) end

---Replaces this transform with a blend of two others. This transform's previous value takes no part.
---@param A FTransform @The value at Alpha 0.
---@param B FTransform @The value at Alpha 1.
---@param Alpha number
function FTransform:Blend(A, B, Alpha) end

---Blends this transform towards another, in place.
---@param Other FTransform @The value at Alpha 1.
---@param Alpha number
function FTransform:BlendWith(Other, Alpha) end

---Composes another transform onto this one: this transform is applied first, then the other. Use '*' to get a new transform instead.
---@param Rhs FTransform
function FTransform:Mul(Rhs) end
