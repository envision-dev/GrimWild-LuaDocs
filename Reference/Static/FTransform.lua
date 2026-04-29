---@class FTransform
FTransform = {}

---@return FTransform
function FTransform:Inverse() end

---@param P0 FVector 
---@return FVector
function FTransform:TransformPosition(P0) end

---@param P0 FVector 
---@return FVector
function FTransform:TransformPositionNoScale(P0) end

---@param P0 FVector 
---@return FVector
function FTransform:InverseTransformPosition(P0) end

---@param P0 FVector 
---@return FVector
function FTransform:InverseTransformPositionNoScale(P0) end

---@param P0 FVector 
---@return FVector
function FTransform:TransformVector(P0) end

---@param P0 FVector 
---@return FVector
function FTransform:TransformVectorNoScale(P0) end

---@param P0 FVector 
---@return FVector
function FTransform:InverseTransformVector(P0) end

---@param P0 FVector 
---@return FVector
function FTransform:InverseTransformVectorNoScale(P0) end

---@param P0 FQuat 
---@return FQuat
function FTransform:TransformRotation(P0) end

---@param P0 FQuat 
---@return FQuat
function FTransform:InverseTransformRotation(P0) end

---@param P0 FTransform 
---@return FTransform
function FTransform:__add(P0) end

---@param P0 FTransform 
---@return FTransform
function FTransform:Add(P0) end
