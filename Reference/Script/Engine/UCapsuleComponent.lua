---A capsule generally used for simple collision. Bounds are rendered as lines in the editor.
---@class UCapsuleComponent : UShapeComponent
---@field protected CapsuleHalfHeight number @Half-height, from center of capsule to the end of top or bottom hemisphere. This cannot be less than CapsuleRadius.
---@field protected CapsuleRadius number @Radius of cap hemispheres and center cylinder. This cannot be more than CapsuleHalfHeight.
UCapsuleComponent = {}

---Returns the capsule half-height scaled by the component scale. This includes both the cylinder and hemisphere cap.
---@return number
function UCapsuleComponent:GetScaledCapsuleHalfHeight() end

---Returns the capsule half-height minus radius (to exclude the hemisphere), scaled by the component scale.
---From the center of the capsule this is the vertical distance along the straight cylindrical portion to the point just before the curve of top hemisphere begins.
---@return number
function UCapsuleComponent:GetScaledCapsuleHalfHeight_WithoutHemisphere() end

---Returns the capsule radius scaled by the component scale.
---@return number
function UCapsuleComponent:GetScaledCapsuleRadius() end

---Returns the capsule radius and half-height scaled by the component scale. Half-height includes the hemisphere end cap.
---@param OutRadius number @[out] Radius of the capsule, scaled by the component scale.
---@param OutHalfHeight number @[out] Half-height of the capsule, scaled by the component scale. Includes the hemisphere end cap.
function UCapsuleComponent:GetScaledCapsuleSize(OutRadius, OutHalfHeight) end

---Returns the capsule radius and half-height scaled by the component scale. Half-height excludes the hemisphere end cap.
---@param OutRadius number @[out] Radius of the capsule, ignoring component scaling.
---@param OutHalfHeightWithoutHemisphere number @[out] Half-height of the capsule, scaled by the component scale. Excludes the hemisphere end cap.
function UCapsuleComponent:GetScaledCapsuleSize_WithoutHemisphere(OutRadius, OutHalfHeightWithoutHemisphere) end

---Get the scale used by this shape. This is a uniform scale that is the minimum of any non-uniform scaling.
---@return number
function UCapsuleComponent:GetShapeScale() end

---Returns the capsule half-height, ignoring component scaling. This includes the hemisphere end cap.
---@return number
function UCapsuleComponent:GetUnscaledCapsuleHalfHeight() end

---Returns the capsule half-height minus radius (to exclude the hemisphere), ignoring component scaling. This excludes the hemisphere end cap.
---From the center of the capsule this is the vertical distance along the straight cylindrical portion to the point just before the curve of top hemisphere begins.
---@return number
function UCapsuleComponent:GetUnscaledCapsuleHalfHeight_WithoutHemisphere() end

---Returns the capsule radius, ignoring component scaling.
---@return number
function UCapsuleComponent:GetUnscaledCapsuleRadius() end

---Returns the capsule radius and half-height scaled by the component scale. Half-height includes the hemisphere end cap.
---@param OutRadius number @[out] Radius of the capsule, scaled by the component scale.
---@param OutHalfHeight number @[out] Half-height of the capsule, scaled by the component scale. Includes the hemisphere end cap.
function UCapsuleComponent:GetUnscaledCapsuleSize(OutRadius, OutHalfHeight) end

---Returns the capsule radius and half-height, ignoring component scaling. Half-height excludes the hemisphere end cap.
---@param OutRadius number @[out] Radius of the capsule, ignoring component scaling.
---@param OutHalfHeightWithoutHemisphere number @[out] Half-height of the capsule, scaled by the component scale. Excludes the hemisphere end cap.
function UCapsuleComponent:GetUnscaledCapsuleSize_WithoutHemisphere(OutRadius, OutHalfHeightWithoutHemisphere) end

---Set the capsule half-height. This is the unscaled half-height, before component scale is applied.
---If this capsule collides, updates touching array for owner actor.
---@param HalfHeight number @: half-height, from capsule center to end of top or bottom hemisphere.
---@param bUpdateOverlaps? boolean @[default: true]
function UCapsuleComponent:SetCapsuleHalfHeight(HalfHeight, bUpdateOverlaps) end

---Set the capsule radius. This is the unscaled radius, before component scale is applied.
---If this capsule collides, updates touching array for owner actor.
---@param Radius number @: radius of end-cap hemispheres and center cylinder.
---@param bUpdateOverlaps? boolean @[default: true]
function UCapsuleComponent:SetCapsuleRadius(Radius, bUpdateOverlaps) end

---Change the capsule size. This is the unscaled size, before component scale is applied.
---@param InRadius number @: radius of end-cap hemispheres and center cylinder.
---@param InHalfHeight number @: half-height, from capsule center to end of top or bottom hemisphere.
---@param bUpdateOverlaps? boolean @[default: true]
function UCapsuleComponent:SetCapsuleSize(InRadius, InHalfHeight, bUpdateOverlaps) end

