---Light Source IDs are always positive. '-1' can safely be used as invalid ID.
---@class ULightManager : UObject
---@field protected Owner UGameLevel
---@field public Work_SunlightReach UGPUPass_SunlightReach @invalid until CreateCellGlowSupport()
---@field public Work_SpreadStaticLight UGPUPass_SpreadStaticLight
---@field public Work_SpreadDynamicLight UGPUPass_SpreadDynamicLight
---@field public Work_SpreadCellGlow UGPUPass_SpreadCellGlow @Null until CreateCellGlowSupport() is called.
---@field public Work_MergeLocalLight UGPUPass_MergeLocalLight
---@field public Work_LightBounce UGPUPass_LightBounce
---@field public Work_SunlightReachBounce UGPUPass_SunlightReachBounce
---@field public Work_ComputeLuminance UGPUPass_ComputeLuminance
---@field public RT_LocalLight UTextureRenderTarget2D @Final merged output. rgb = color, a = intensity. Used by rendering.
---@field public RT_SpreadStaticLight UTextureRenderTarget2D @Internal accumulators — not for external use:
---@field public RT_SpreadDynamicLight UTextureRenderTarget2D
---@field public RT_SpreadCellGlow UTextureRenderTarget2D
---@field public BufferName_SunlightReach string
---@field public BufferName_Luminance string
---@field public BufferName_CellGlow string
---@field public WorkName_SpreadStaticLight string
---@field public WorkName_SpreadDynamicLight string
---@field public WorkName_SpreadCellGlow string
---@field public WorkName_MergeLocalLight string
---@field public WorkName_LightBounce string
---@field public WorkName_Luminance string
---@field public WorkName_SunlightReach string
---@field public WorkName_SunlightReachBounce string
---@field protected LightOverlayMID UMaterialInstanceDynamic
ULightManager = {}

---Blueprint-callable wrapper for AddLightSource. Passes the source by value (copied on call).
---@param Source FLightSource
---@return integer
function ULightManager:AddLightSource_BP(Source) end

---@param ConeWidthDeg number
---@return number
function ULightManager.ConeWidthToCosHalfAngle(ConeWidthDeg) end

---@param LightSourceId integer
---@return boolean
function ULightManager:ContainsLightSource(LightSourceId) end

---@param CosHalfAngle number
---@return number
function ULightManager.CosHalfAngleToConeWidth(CosHalfAngle) end

---Creates the optional CellGlow (FColor) buffer and binds its pipeline.
function ULightManager:CreateCellGlowSupport() end

---Returns the facing angle in degrees for the given direction vector.
---A zero vector returns 0 degrees (atan2 of (0,0) is implementation-defined; treat it as invalid input).
---@param Direction FVector2D
---@return number
function ULightManager.DirectionToFacingAngle(Direction) end

---@param FacingAngleDeg number
---@return FVector2D
function ULightManager.FacingAngleToDirection(FacingAngleDeg) end

---@return integer
function ULightManager:GetBounceSteps() end

---@return number
function ULightManager:GetBounceStrength() end

---Returns RGB color only (alpha is always 0 in the returned value).
---Returns FColor::Black if CellGlow support is not active.
---@param Cell integer
---@return FColor
function ULightManager:GetCellGlowColor(Cell) end

---Returns normalized intensity in [0, 1]. Returns 0.0 if CellGlow support is not active.
---@param Cell integer
---@return number
function ULightManager:GetCellGlowIntensity(Cell) end

---Returns 0 if CellGlow support is not active.
---@param Cell integer
---@return integer
function ULightManager:GetCellGlowRadius(Cell) end

---@return TMap<integer, FLightSource>
function ULightManager:GetDynamicLightSources() end

---@return UMaterialInstanceDynamic
function ULightManager:GetLightOverlayMaterial() end

---@param LightSourceId integer
---@param OutLightSource FLightSource @[out]
---@return boolean
function ULightManager:GetLightSource(LightSourceId, OutLightSource) end

---Asserts that LightSourceId exists. Call only when the ID is guaranteed to be valid.
---@param LightSourceId integer
---@return FLightSource
function ULightManager:GetLightSourceChecked(LightSourceId) end

---Global falloff exponent. Never changes at runtime.
---@return number
function ULightManager.GetLightSourceFalloffExponent() end

---Returns the handle that will be assigned to the next added light source. Does not increment the counter.
---@return integer
function ULightManager:GetNextLightSourceHandle() end

---@return number
function ULightManager:GetNoSunlightBrightness() end

---@return TMap<integer, FLightSource>
function ULightManager:GetStaticLightSources() end

---@return FLinearColor
function ULightManager:GetSunlightColor() end

---@return number
function ULightManager:GetSunlightIntensity() end

---OnPreSync / OnSyncStarted callbacks
---@param Buffer FCellBufferHandle
function ULightManager:OnPreSync_CellFeatures(Buffer) end

---@param Buffer FCellBufferHandle
function ULightManager:OnPreSync_CellGlow(Buffer) end

---@param Buffer FCellBufferHandle
function ULightManager:OnPreSync_CellRestrictions(Buffer) end

---@param Buffer FCellBufferHandle
function ULightManager:OnPreSync_SunlightReach(Buffer) end

---@param Buffer FCellBufferHandle
function ULightManager:OnSyncStarted_Luminance(Buffer) end

function ULightManager:RecalculateSunlightReach() end

---Sets the buffer value to FColor::Black (radius 0 = inactive emitter).
---Safe to call on a cell with no active glow.
---@param Cell integer
---@param bMarkAsEagerUpdate? boolean @[default: false]
function ULightManager:RemoveCellGlow(Cell, bMarkAsEagerUpdate) end

---Destroys the CellGlow buffer and removes it from the pipeline.
function ULightManager:RemoveCellGlowSupport() end

---Removes a light source. Returns false if the ID is not found.
---@param LightSourceId integer
---@return boolean
function ULightManager:RemoveLightSource(LightSourceId) end

function ULightManager:ScheduleMergeAndLuminance() end

---@param NewValue integer
---@param bRecalculate? boolean @[default: false]
function ULightManager:SetBounceSteps(NewValue, bRecalculate) end

---@param NewValue number
---@param bRecalculate? boolean @[default: false]
function ULightManager:SetBounceStrength(NewValue, bRecalculate) end

---Color: only RGB is used, alpha is ignored.
---Radius is clamped to [0, CellGlow::MaxCellGlowRadius]. Radius 0 deactivates the emitter.
---Intensity: normalized value in [0, 1]. Values outside this range trigger a warning and are clamped.
---Requires CreateCellGlowSupport() to have been called.
---@param Cell integer
---@param Color FColor
---@param Radius integer
---@param Intensity number
---@param bMarkAsEagerUpdate? boolean @[default: false]
function ULightManager:SetCellGlow(Cell, Color, Radius, Intensity, bMarkAsEagerUpdate) end

---Changes only the intensity. Color and radius are preserved.
---Intensity: normalized value in [0, 1]. Values outside this range trigger a warning and are clamped.
---@param Cell integer
---@param Intensity number
function ULightManager:SetCellGlowIntensity(Cell, Intensity) end

---Changes only the radius. Color and intensity are preserved.
---Passing 0 deactivates the emitter.
---@param Cell integer
---@param Radius integer
function ULightManager:SetCellGlowRadius(Cell, Radius) end

---@param LightSourceId integer
---@param NewColor FColor
---@return boolean
function ULightManager:SetLightSourceColor(LightSourceId, NewColor) end

---Sets the cone width of a light source.
---ConeWidthDeg >= 360 converts the light to omni (no directional restriction).
---Any value below 360 converts or keeps the light as a spotlight.
---ConeWidthDeg: full cone angle in degrees (not half-angle).
---  360 = omni light
---  90  = narrow spotlight
---  180 = wide spotlight
---Note: changing cone width on an omni light will also require setting a facing
---angle via SetLightSourceFacingAngle, otherwise Direction keeps its default value of (1, 0).
---Note: static lights only. CosHalfAngle is ignored for dynamic lights.
---@param LightSourceId integer
---@param ConeWidthDeg number
---@return boolean
function ULightManager:SetLightSourceConeWidth(LightSourceId, ConeWidthDeg) end

---@param LightSourceId integer
---@param bEnabled boolean
---@return boolean
function ULightManager:SetLightSourceEnabled(LightSourceId, bEnabled) end

---Sets the facing direction of a light source.
---Direction is stored even on omni lights (CosHalfAngle == -1.0) so that calling
---SetLightSourceConeWidth later picks it up without an extra SetLightSourceFacingAngle call.
---To convert a spotlight back to omni, use SetLightSourceConeWidth with ConeWidthDeg >= 360.
---FacingAngleDeg: angle in degrees, measured from the +X axis counter-clockwise.
---  0   = faces right
---  90  = faces up
---  180 = faces left
---  270 = faces down
---Note: static lights only. Direction is ignored for dynamic lights.
---@param LightSourceId integer
---@param FacingAngleDeg number
---@return boolean
function ULightManager:SetLightSourceFacingAngle(LightSourceId, FacingAngleDeg) end

---@param LightSourceId integer
---@param NewIntensity number
---@return boolean
function ULightManager:SetLightSourceIntensity(LightSourceId, NewIntensity) end

---@param LightSourceId integer
---@param NewPosition FVector2D
---@return boolean
function ULightManager:SetLightSourcePosition(LightSourceId, NewPosition) end

---@param LightSourceId integer
---@param NewRadius number
---@return boolean
function ULightManager:SetLightSourceRadius(LightSourceId, NewRadius) end

---@param NewValue number
function ULightManager:SetNoSunlightBrightness(NewValue) end

---@param NewValue FLinearColor
function ULightManager:SetSunlightColor(NewValue) end

---@param NewValue number
function ULightManager:SetSunlightIntensity(NewValue) end

