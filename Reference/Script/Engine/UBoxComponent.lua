---@meta
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
---@param InBoxExtent FVector @new extent (radius) for the box.
---@param bUpdateOverlaps? boolean @[default: true] if true and this shape is registered and collides, updates touching array for owner actor.
function UBoxComponent:SetBoxExtent(InBoxExtent, bUpdateOverlaps) end

---Set the LineThickness
---@param Thickness number
function UBoxComponent:SetLineThickness(Thickness) end

