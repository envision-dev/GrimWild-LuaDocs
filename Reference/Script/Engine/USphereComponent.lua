---@meta
---A sphere generally used for simple collision. Bounds are rendered as lines in the editor.
---@class USphereComponent : UShapeComponent
---@field protected SphereRadius number @The radius of the sphere *
USphereComponent = {}

---
---@return number
function USphereComponent:GetScaledSphereRadius() end

---Get the scale used by this shape. This is a uniform scale that is the minimum of any non-uniform scaling.
---@return number
function USphereComponent:GetShapeScale() end

---
---@return number
function USphereComponent:GetUnscaledSphereRadius() end

---Change the sphere radius. This is the unscaled radius, before component scale is applied.
---@param InSphereRadius number @the new sphere radius
---@param bUpdateOverlaps? boolean @[default: true] if true and this shape is registered and collides, updates touching array for owner actor.
function USphereComponent:SetSphereRadius(InSphereRadius, bUpdateOverlaps) end

