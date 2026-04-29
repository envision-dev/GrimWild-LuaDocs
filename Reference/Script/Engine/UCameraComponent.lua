---Represents a camera viewpoint and settings, such as projection type, field of view, and post-process overrides.
---The default behavior for an actor used as the camera view target is to look for an attached camera component and use its location, rotation, and settings.
---@class UCameraComponent : USceneComponent
---@field public FieldOfView number @The horizontal field of view (in degrees) in perspective mode (ignored in Orthographic mode) If the aspect ratio axis constraint (from ULocalPlayer, ALevelSequenceActor, etc.) is set to maintain vertical FOV, the AspectRatio property will be used to convert this property's value to a vertical FOV.
---@field public OrthoWidth number @The desired width (in world units) of the orthographic view (ignored in Perspective mode)
---@field public OrthoNearClipPlane number @The near plane distance of the orthographic view (in world units)
---@field public OrthoFarClipPlane number @The far plane distance of the orthographic view (in world units)
---@field public AspectRatio number @Aspect Ratio (Width/Height)
---@field public AspectRatioAxisConstraint integer @Override for the default aspect ratio axis constraint defined on the local player
---@field public bConstrainAspectRatio boolean @If bConstrainAspectRatio is true, black bars will be added if the destination view has a different aspect ratio than this camera requested.
---@field public bOverrideAspectRatioAxisConstraint boolean @Whether to override the default aspect ratio axis constraint defined on the local player
---@field public bUseFieldOfViewForLOD boolean @If true, account for the field of view angle when computing which level of detail to use for meshes.
---@field public bDrawFrustumAllowed boolean @The Frustum visibility flag for draw frustum component initialization
---@field public bCameraMeshHiddenInGame boolean @If the camera mesh is visible in game. Only relevant when running editor builds.
---@field public bLockToHmd boolean @True if the camera's orientation and position should be locked to the HMD
---@field public bUsePawnControlRotation boolean @If this camera component is placed on a pawn, should it use the view/control rotation of the pawn where possible?
---@field public ProjectionMode integer @The type of camera
---@field protected CameraMesh UStaticMesh
---@field public PostProcessBlendWeight number @Indicates if PostProcessSettings should be used when using this Camera to view through.
---@field public PostProcessSettings FPostProcessSettings @Post process settings to use for this camera. Don't forget to check the properties you want to override
UCameraComponent = {}

---Returns camera's Point of View.
---Called by Camera class. Subclass and postprocess to add any effects.
---@param DeltaTime number
---@param DesiredView FMinimalViewInfo @[out]
function UCameraComponent:GetCameraView(DeltaTime, DesiredView) end

---Returns the filmback text used for burnins on preview viewports
---@return string
function UCameraComponent:GetFilmbackText() end

---Internal function for updating the camera mesh visibility in PIE
function UCameraComponent:OnCameraMeshHiddenChanged() end

---@param InAspectRatio number
function UCameraComponent:SetAspectRatio(InAspectRatio) end

---@param InAspectRatioAxisConstraint integer
function UCameraComponent:SetAspectRatioAxisConstraint(InAspectRatioAxisConstraint) end

---@param bInConstrainAspectRatio boolean
function UCameraComponent:SetConstraintAspectRatio(bInConstrainAspectRatio) end

---@param InFieldOfView number
function UCameraComponent:SetFieldOfView(InFieldOfView) end

---@param InOrthoFarClipPlane number
function UCameraComponent:SetOrthoFarClipPlane(InOrthoFarClipPlane) end

---@param InOrthoNearClipPlane number
function UCameraComponent:SetOrthoNearClipPlane(InOrthoNearClipPlane) end

---@param InOrthoWidth number
function UCameraComponent:SetOrthoWidth(InOrthoWidth) end

---@param InPostProcessBlendWeight number
function UCameraComponent:SetPostProcessBlendWeight(InPostProcessBlendWeight) end

---@param InProjectionMode integer
function UCameraComponent:SetProjectionMode(InProjectionMode) end

---@param bInUseFieldOfViewForLOD boolean
function UCameraComponent:SetUseFieldOfViewForLOD(bInUseFieldOfViewForLOD) end

