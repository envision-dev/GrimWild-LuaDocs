---@class FVector2D
FVector2D = {}


---@type FVector2D 
FVector2D.ZeroVector = nil
---@param P0 FVector2D 
---@return number
function FVector2D:Dot(P0) end

---@param P0 FVector2D 
---@return number
function FVector2D:Cross(P0) end

---@return number
function FVector2D:Size() end

---@return number
function FVector2D:SizeSquared() end

---@param P0 FVector2D 
---@param P1 FVector2D 
---@return number
function FVector2D.Dist(P0, P1) end

---@param P0 FVector2D 
---@param P1 FVector2D 
---@return number
function FVector2D.DistSquared(P0, P1) end
