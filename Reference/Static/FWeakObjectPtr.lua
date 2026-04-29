---@class FWeakObjectPtr
FWeakObjectPtr = {}

function FWeakObjectPtr:Reset() end

---@param P0 UObject 
function FWeakObjectPtr:Set(P0) end

---@return UObject
function FWeakObjectPtr:Get() end

---@return boolean
function FWeakObjectPtr:IsValid() end
