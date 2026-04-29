---A box generally used for simple collision. Bounds are rendered as lines in the editor.
---@class UBoxComponent : UShapeComponent
---@field protected BoxExtent FVector @The extents (radii dimensions) of the box *
---@field protected LineThickness number @Used to control the line thickness when rendering
UBoxComponent = {}

---
---@return FVector
function UBoxComponent:GetScaledBoxExtent() end

---
---@return FVector
function UBoxComponent:GetUnscaledBoxExtent() end

---Change the box extent size. This is the unscaled size, before component scale is applied.
---@param InBoxExtent FVector
---@param bUpdateOverlaps? boolean @[default: true]
function UBoxComponent:SetBoxExtent(InBoxExtent, bUpdateOverlaps) end

---Set the LineThickness
---@param Thickness number
function UBoxComponent:SetLineThickness(Thickness) end

