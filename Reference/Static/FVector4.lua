---@class FVector4
FVector4 = {}

---@param P0 FVector4 
---@param P1 FVector4 
---@return number
function FVector4.Dot3(P0, P1) end

---@param P0 FVector4 
---@return FVector4
function FVector4:Cross(P0) end

---@return number
function FVector4:Size() end

---@return number
function FVector4:Size3() end

---@return number
function FVector4:SizeSquared() end

---@return number
function FVector4:SizeSquared3() end

---@return FRotator
function FVector4:ToRotator() end

---@return FQuat
function FVector4:ToQuat() end
