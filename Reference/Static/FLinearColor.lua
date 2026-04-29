---@class FLinearColor
FLinearColor = {}


---@type FLinearColor 
FLinearColor.Black = nil

---@type FLinearColor 
FLinearColor.White = nil

---@type FLinearColor 
FLinearColor.Red = nil

---@type FLinearColor 
FLinearColor.Green = nil

---@type FLinearColor 
FLinearColor.Blue = nil

---@type FLinearColor 
FLinearColor.Yellow = nil

---@type FLinearColor 
FLinearColor.Gray = nil
---@param P0 boolean 
---@return FColor
function FLinearColor:ToFColor(P0) end

---@param P0 number 
---@param P1 number 
---@return FLinearColor
function FLinearColor:Clamp(P0, P1) end
