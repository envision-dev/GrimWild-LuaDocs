---PrimitiveComponents are SceneComponents that contain or generate some sort of geometry, generally to be rendered or used as collision data.
---There are several subclasses for the various types of geometry, but the most common by far are the ShapeComponents (Capsule, Sphere, Box), StaticMeshComponent, and SkeletalMeshComponent.
---ShapeComponents generate geometry that is used for collision detection but are not rendered, while StaticMeshComponents and SkeletalMeshComponents contain pre-built geometry that is rendered, but can also be used for collision detection.
---@class UPrimitiveComponent : USceneComponent
---@field public MinDrawDistance number @The minimum distance at which the primitive should be rendered, measured in world space units from the center of the primitive's bounding sphere to the camera position.
---@field public LDMaxDrawDistance number @Max draw distance exposed to LDs. The real max draw distance is the min (disregarding 0) of this and volumes affecting this object.
---@field public CachedMaxDrawDistance number @The distance to cull this primitive at. A CachedMaxDrawDistance of 0 indicates that the primitive should not be culled by distance.
---@field public DepthPriorityGroup integer @The scene depth priority group to draw the primitive in.
---@field public ViewOwnerDepthPriorityGroup integer @The scene depth priority group to draw the primitive in, if it's being viewed by its owner.
---@field public IndirectLightingCacheQuality integer @Quality of indirect lighting for Movable primitives.  This has a large effect on Indirect Lighting Cache update time.
---@field public LightmapType ELightmapType @Controls the type of lightmap used for this component.
---@field public HLODBatchingPolicy EHLODBatchingPolicy @Determines how the geometry of a component will be incorporated in proxy (simplified) HLODs.
---@field public bEnableAutoLODGeneration boolean @Whether to include this component in HLODs or not.
---@field public bIsActorTextureStreamingBuiltData boolean @Indicates that the texture streaming built data is local to the Actor (see UActorTextureStreamingBuildDataComponent).
---@field public bIsValidTextureStreamingBuiltData boolean @Indicates to the texture streaming wether it can use the pre-built texture streaming data (even if empty).
---@field public bNeverDistanceCull boolean @When enabled this object will not be culled by distance. This is ignored if a child of a HLOD.
---@field public bAlwaysCreatePhysicsState boolean @Indicates if we'd like to create physics state all the time (for collision and simulation). If you set this to false, it still will create physics state if collision or simulation activated. This can help performance if you'd like to avoid overhead of creating physics state when triggers
---@field private bGenerateOverlapEvents boolean
---@field public bMultiBodyOverlap boolean @If true, this component will generate individual overlaps for each overlapping physics body if it is a multi-body component. When false, this component will generate only one overlap, regardless of how many physics bodies it has and how many of them are overlapping another component/body. This flag has no influence on single body components.
---@field public bTraceComplexOnMove boolean @If true, component sweeps with this component should trace against complex collision during movement (for example, each triangle of a mesh). If false, collision will be resolved against simple collision bounds instead.
---@field public bReturnMaterialOnMove boolean @If true, component sweeps will return the material in their hit result.
---@field public bUseViewOwnerDepthPriorityGroup boolean @True if the primitive should be rendered using ViewOwnerDepthPriorityGroup if viewed by its owner.
---@field public bAllowCullDistanceVolume boolean @Whether to accept cull distance volumes to modify cached cull distance.
---@field public bVisibleInReflectionCaptures boolean @If true, this component will be visible in reflection captures.
---@field public bVisibleInRealTimeSkyCaptures boolean @If true, this component will be visible in real-time sky light reflection captures.
---@field public bVisibleInRayTracing boolean @If true, this component will be visible in ray tracing effects. Turning this off will remove it from ray traced reflections, shadows, etc.
---@field public bRenderInMainPass boolean @If true, this component will be rendered in the main pass (z prepass, basepass, transparency)
---@field public bRenderInDepthPass boolean @If true, this component will be rendered in the depth pass even if it's not rendered in the main pass
---@field public bReceivesDecals boolean @Whether the primitive receives decals.
---@field public bHoldout boolean @If this is True, this primitive will render black with an alpha of 0, but all secondary effects (shadows, reflections, indirect lighting) remain. This feature is currently only implemented in the Path Tracer.
---@field public bOwnerNoSee boolean @If this is True, this component won't be visible when the view actor is the component's owner, directly or indirectly.
---@field public bOnlyOwnerSee boolean @If this is True, this component will only be visible when the view actor is the component's owner, directly or indirectly.
---@field public bTreatAsBackgroundForOcclusion boolean @Treat this primitive as part of the background for occlusion purposes. This can be used as an optimization to reduce the cost of rendering skyboxes, large ground planes that are part of the vista, etc.
---@field public bUseAsOccluder boolean @Whether to render the primitive in the depth only pass. This should generally be true for all objects, and let the renderer make decisions about whether to render objects in the depth only pass.
---@field public bSelectable boolean @If this is True, this component can be selected in the editor.
---@field public bConsiderForActorPlacementWhenHidden boolean @If true, this component will be considered for placement when dragging and placing items in the editor even if it is not visible, such as in the case of hidden collision meshes
---@field public bForceMipStreaming boolean @If true, forces mips for textures used by this component to be resident when this component's level is loaded.
---@field public bHasPerInstanceHitProxies boolean @If true a hit-proxy will be generated for each instance of instanced static meshes
---@field public CastShadow boolean @Controls whether the primitive component should cast a shadow or not.
---@field public bEmissiveLightSource boolean @Whether the primitive will be used as an emissive light source.
---@field public bAffectDynamicIndirectLighting boolean @Controls whether the primitive should influence indirect lighting.
---@field public bAffectIndirectLightingWhileHidden boolean @Controls whether the primitive should affect indirect lighting when hidden. This flag is only used if bAffectDynamicIndirectLighting is true.
---@field public bAffectDistanceFieldLighting boolean @Controls whether the primitive should affect dynamic distance field lighting methods.  This flag is only used if CastShadow is true. *
---@field public bCastDynamicShadow boolean @Controls whether the primitive should cast shadows in the case of non precomputed shadowing.  This flag is only used if CastShadow is true. *
---@field public bCastStaticShadow boolean @Whether the object should cast a static shadow from shadow casting lights.  This flag is only used if CastShadow is true.
---@field public ShadowCacheInvalidationBehavior EShadowCacheInvalidationBehavior @Control shadow invalidation behavior, in particular with respect to Virtual Shadow Maps and material effects like World Position Offset.
---@field public bCastVolumetricTranslucentShadow boolean @Whether the object should cast a volumetric translucent shadow. Volumetric translucent shadows are useful for primitives with smoothly changing opacity like particles representing a volume, But have artifacts when used on highly opaque surfaces.
---@field public bCastContactShadow boolean @Whether the object should cast contact shadows. This flag is only used if CastShadow is true.
---@field public bSelfShadowOnly boolean @When enabled, the component will only cast a shadow on itself and not other components in the world. This is especially useful for first person weapons, and forces bCastInsetShadow to be enabled.
---@field public bCastFarShadow boolean @When enabled, the component will be rendering into the far shadow cascades (only for directional lights).
---@field public bCastInsetShadow boolean @Whether this component should create a per-object shadow that gives higher effective shadow resolution. Useful for cinematic character shadowing. Assumed to be enabled if bSelfShadowOnly is enabled.
---@field public bCastCinematicShadow boolean @Whether this component should cast shadows from lights that have bCastShadowsFromCinematicObjectsOnly enabled. This is useful for characters in a cinematic with special cinematic lights, where the cost of shadowmap rendering of the environment is undesired.
---@field public bCastHiddenShadow boolean @If true, the primitive will cast shadows even if bHidden is true. Controls whether the primitive should cast shadows when hidden. This flag is only used if CastShadow is true.
---@field public bCastShadowAsTwoSided boolean @Whether this primitive should cast dynamic shadows as if it were a two sided material.
---@field public bLightAttachmentsAsGroup boolean @Whether to light this component and any attachments as a group.  This only has effect on the root component of an attachment tree. When enabled, attached component shadowing settings like bCastInsetShadow, bCastVolumetricTranslucentShadow, etc, will be ignored. This is useful for improving performance when multiple movable components are attached together.
---@field public bExcludeFromLightAttachmentGroup boolean @If set, then it overrides any bLightAttachmentsAsGroup set in a parent.
---@field public bReceiveMobileCSMShadows boolean @Mobile only: If disabled this component will not receive CSM shadows. (Components that do not receive CSM may have reduced shading cost)
---@field public bSingleSampleShadowFromStationaryLights boolean @Whether the whole component should be shadowed as one from stationary lights, which makes shadow receiving much cheaper. When enabled shadowing data comes from the volume lighting samples precomputed by Lightmass, which are very sparse. This is currently only used on stationary directional lights.
---@field public bIgnoreRadialImpulse boolean @Will ignore radial impulses applied to this component.
---@field public bIgnoreRadialForce boolean @Will ignore radial forces applied to this component.
---@field public bApplyImpulseOnDamage boolean @True for damage to this component to apply physics impulse, false to opt out of these impulses.
---@field public bReplicatePhysicsToAutonomousProxy boolean @True if physics should be replicated to autonomous proxies. This should be true for               server-authoritative simulations, and false for client authoritative simulations.
---@field public bFillCollisionUnderneathForNavmesh boolean @If set, navmesh will not be generated under the surface of the geometry
---@field public AlwaysLoadOnClient boolean @If this is True, this component must always be loaded on clients, even if Hidden and CollisionEnabled is NoCollision.
---@field public AlwaysLoadOnServer boolean @If this is True, this component must always be loaded on servers, even if Hidden and CollisionEnabled is NoCollision
---@field public bUseEditorCompositing boolean @Composite the drawing of this component onto the scene after post processing (only applies to editor drawing)
---@field public bIsBeingMovedByEditor boolean @Set to true while the editor is moving the component, which notifies the Renderer to track velocities even if the component is Static.
---@field public bRenderCustomDepth boolean @If true, this component will be rendered in the CustomDepth pass (usually used for outlines)
---@field public bVisibleInSceneCaptureOnly boolean @When true, will only be visible in Scene Capture
---@field public bHiddenInSceneCapture boolean @When true, will not be captured by Scene Capture
---@field public bRayTracingFarField boolean @If true, this component will be available to ray trace as a far field primitive even if hidden.
---@field protected bHasNoStreamableTextures boolean
---@field protected bStaticWhenNotMoveable boolean @When false, the underlying physics body will contain all sim data (mass, inertia tensor, etc) even if mobility is not set to Moveable
---@field public bHasCustomNavigableGeometry integer @If true then DoCustomNavigableGeometryExport will be called to collect navigable geometry of this component.
---@field public HitProxyPriority integer
---@field public CanCharacterStepUpOn integer @Determine whether a Character can step up onto this component. This controls whether they can try to step up on it when they bump in to it, not whether they can walk on it after landing on it.
---@field public LightingChannels FLightingChannels @Channels that this component should be in.  Lights with matching channels will affect the component. These channels only apply to opaque materials, direct lighting, and dynamic lighting and shadowing.
---@field public RayTracingGroupId integer @Defines run-time groups of components. For example allows to assemble multiple parts of a building at runtime. -1 means that component doesn't belong to any group.
---@field public VisibilityId integer @Used for precomputed visibility
---@field public CustomDepthStencilValue integer @Optionally write this 0-255 value to the stencil buffer in CustomDepth pass (Requires project setting or r.CustomDepth == 3)
---@field private CustomPrimitiveData FCustomPrimitiveData @Optional user defined default values for the custom primitive data of this primitive
---@field private CustomPrimitiveDataInternal FCustomPrimitiveData @Custom data that can be read by a material through a material parameter expression. Set data using SetCustomPrimitiveData* functions
---@field public TranslucencySortPriority integer @Translucent objects with a lower sort priority draw behind objects with a higher priority. Translucent objects with the same priority are rendered from back-to-front based on their bounds origin. This setting is also used to sort objects being drawn into a runtime virtual texture. Ignored if the object is not translucent.  The default priority is zero. Warning: This should never be set to a non-default value unless you know what you are doing, as it will prevent the renderer from sorting correctly. It is especially problematic on dynamic gameplay effects.
---@field public TranslucencySortDistanceOffset number @Modified sort distance offset for translucent objects in world units. A positive number will move the sort distance further and a negative number will move the distance closer. Ignored if the object is not translucent. Warning: Adjusting this value will prevent the renderer from correctly sorting based on distance.  Only modify this value if you are certain it will not cause visual artifacts.
---@field public RuntimeVirtualTextures TArray<URuntimeVirtualTexture> @Array of runtime virtual textures into which we draw the mesh for this actor. The material also needs to be set up to output to a virtual texture.
---@field public VirtualTextureLodBias integer @Bias to the LOD selected for rendering to runtime virtual textures.
---@field public VirtualTextureCullMips integer @Number of lower mips in the runtime virtual texture to skip for rendering this primitive. Larger values reduce the effective draw distance in the runtime virtual texture. This culling method doesn't take into account primitive size or virtual texture size.
---@field public VirtualTextureMinCoverage integer @Set the minimum pixel coverage before culling from the runtime virtual texture. Larger values reduce the effective draw distance in the runtime virtual texture.
---@field public VirtualTextureRenderPassType ERuntimeVirtualTextureMainPassType @Controls if this component draws in the main pass as well as in the virtual texture.
---@field public BoundsScale number @Scales the bounds of the object. This is useful when using World Position Offset to animate the vertices of the object outside of its bounds. Warning: Increasing the bounds of an object will reduce performance and shadow quality! Currently only used by StaticMeshComponent and SkeletalMeshComponent.
---@field public MoveIgnoreActors TArray<AActor> @Set of actors to ignore during component sweeps in MoveComponent(). All components owned by these actors will be ignored when this component moves or updates overlaps. Components on the other Actor may also need to be told to do the same when they move. Does not affect movement of this component when simulating physics.
---@field public MoveIgnoreComponents TArray<UPrimitiveComponent> @Set of components to ignore during component sweeps in MoveComponent(). These components will be ignored when this component moves or updates overlaps. The other components may also need to be told to do the same when they move. Does not affect movement of this component when simulating physics.
---@field public BodyInstance FBodyInstance @Physics scene information for this component, holds a single rigid body with multiple shapes.
---@field public OnComponentHit MulticastDelegate|fun(HitComponent: UPrimitiveComponent, OtherActor: AActor, OtherComp: UPrimitiveComponent, NormalImpulse: FVector, Hit: FHitResult) @Event called when a component hits (or is hit by) something solid. This could happen due to things like Character movement, using Set Location with 'sweep' enabled, or physics simulation. For events when objects overlap (e.g. walking into a trigger) see the 'Overlap' event. will be adjusted to indicate force from the other object against this object.
---@field public OnComponentBeginOverlap MulticastDelegate|fun(OverlappedComponent: UPrimitiveComponent, OtherActor: AActor, OtherComp: UPrimitiveComponent, OtherBodyIndex: integer, bFromSweep: boolean, SweepResult: FHitResult) @Event called when something starts to overlaps this component, for example a player walking into a trigger. For events when objects have a blocking collision, for example a player hitting a wall, see 'Hit' events. will be adjusted to indicate force from the other object against this object.
---@field public OnComponentEndOverlap MulticastDelegate|fun(OverlappedComponent: UPrimitiveComponent, OtherActor: AActor, OtherComp: UPrimitiveComponent, OtherBodyIndex: integer) @Event called when something stops overlapping this component
---@field public OnComponentWake MulticastDelegate|fun(WakingComponent: UPrimitiveComponent, BoneName: string) @Event called when the underlying physics objects is woken up
---@field public OnComponentSleep MulticastDelegate|fun(SleepingComponent: UPrimitiveComponent, BoneName: string) @Event called when the underlying physics objects is put to sleep
---@field public OnComponentPhysicsStateChanged MulticastDelegate|fun(ChangedComponent: UPrimitiveComponent, StateChange: EComponentPhysicsStateChange) @Event called when physics state is created or destroyed for this component
---@field public OnBeginCursorOver MulticastDelegate|fun(TouchedComponent: UPrimitiveComponent) @Event called when the mouse cursor is moved over this component and mouse over events are enabled in the player controller
---@field public OnEndCursorOver MulticastDelegate|fun(TouchedComponent: UPrimitiveComponent) @Event called when the mouse cursor is moved off this component and mouse over events are enabled in the player controller
---@field public OnClicked MulticastDelegate|fun(TouchedComponent: UPrimitiveComponent, ButtonPressed: FKey) @Event called when the left mouse button is clicked while the mouse is over this component and click events are enabled in the player controller
---@field public OnReleased MulticastDelegate|fun(TouchedComponent: UPrimitiveComponent, ButtonReleased: FKey) @Event called when the left mouse button is released while the mouse is over this component click events are enabled in the player controller
---@field public OnInputTouchBegin MulticastDelegate|fun(FingerIndex: integer, TouchedComponent: UPrimitiveComponent) @Event called when a touch input is received over this component when touch events are enabled in the player controller
---@field public OnInputTouchEnd MulticastDelegate|fun(FingerIndex: integer, TouchedComponent: UPrimitiveComponent) @Event called when a touch input is released over this component when touch events are enabled in the player controller
---@field public OnInputTouchEnter MulticastDelegate|fun(FingerIndex: integer, TouchedComponent: UPrimitiveComponent) @Event called when a finger is moved over this component when touch over events are enabled in the player controller
---@field public OnInputTouchLeave MulticastDelegate|fun(FingerIndex: integer, TouchedComponent: UPrimitiveComponent) @Event called when a finger is moved off this component when touch over events are enabled in the player controller
---@field public RayTracingGroupCullingPriority ERayTracingGroupCullingPriority @Defines how quickly it should be culled. For example buildings should have a low priority, but small dressing should have a high priority.
---@field public CustomDepthStencilWriteMask ERendererStencilMask @Mask used for stencil buffer writes.
---@field private ExcludeFromHLODLevels integer @Which specific HLOD levels this component should be excluded from
---@field private LODParentPrimitive UPrimitiveComponent @LOD parent primitive to draw instead of this one (multiple UPrim's will point to the same LODParent )
UPrimitiveComponent = {}

---Add an angular impulse to a single rigid body. Good for one time instant burst.
---@param Impulse FVector
---@param BoneName? string @[default: None]
---@param bVelChange? boolean @[default: false]
function UPrimitiveComponent:AddAngularImpulseInDegrees(Impulse, BoneName, bVelChange) end

---Add an angular impulse to a single rigid body. Good for one time instant burst.
---@param Impulse FVector
---@param BoneName? string @[default: None]
---@param bVelChange? boolean @[default: false]
function UPrimitiveComponent:AddAngularImpulseInRadians(Impulse, BoneName, bVelChange) end

---Add a force to a single rigid body.
---This is like a 'thruster'. Good for adding a burst over some (non zero) time. Should be called every frame for the duration of the force.
---@param Force FVector
---@param BoneName? string @[default: None]
---@param bAccelChange? boolean @[default: false] If true, Force is taken as a change in acceleration instead of a physical force (i.e. mass will have no effect).
function UPrimitiveComponent:AddForce(Force, BoneName, bAccelChange) end

---Add a force to a single rigid body at a particular location in world space.
---This is like a 'thruster'. Good for adding a burst over some (non zero) time. Should be called every frame for the duration of the force.
---@param Force FVector
---@param Location FVector
---@param BoneName? string @[default: None]
function UPrimitiveComponent:AddForceAtLocation(Force, Location, BoneName) end

---Add a force to a single rigid body at a particular location. Both Force and Location should be in body space.
---This is like a 'thruster'. Good for adding a burst over some (non zero) time. Should be called every frame for the duration of the force.
---@param Force FVector
---@param Location FVector
---@param BoneName? string @[default: None]
function UPrimitiveComponent:AddForceAtLocationLocal(Force, Location, BoneName) end

---Add an impulse to a single rigid body. Good for one time instant burst.
---@param Impulse FVector
---@param BoneName? string @[default: None]
---@param bVelChange? boolean @[default: false]
function UPrimitiveComponent:AddImpulse(Impulse, BoneName, bVelChange) end

---Add an impulse to a single rigid body at a specific location.
---@param Impulse FVector
---@param Location FVector
---@param BoneName? string @[default: None]
function UPrimitiveComponent:AddImpulseAtLocation(Impulse, Location, BoneName) end

---Add a force to all bodies in this component, originating from the supplied world-space location.
---@param Origin FVector
---@param Radius number
---@param Strength number
---@param Falloff integer
---@param bAccelChange? boolean @[default: false] If true, Strength is taken as a change in acceleration instead of a physical force (i.e. mass will have no effect).
function UPrimitiveComponent:AddRadialForce(Origin, Radius, Strength, Falloff, bAccelChange) end

---Add an impulse to all rigid bodies in this component, radiating out from the specified position.
---@param Origin FVector
---@param Radius number
---@param Strength number
---@param Falloff integer
---@param bVelChange? boolean @[default: false]
function UPrimitiveComponent:AddRadialImpulse(Origin, Radius, Strength, Falloff, bVelChange) end

---Add a torque to a single rigid body.
---@param Torque FVector
---@param BoneName? string @[default: None]
---@param bAccelChange? boolean @[default: false] If true, Torque is taken as a change in angular acceleration instead of a physical torque (i.e. mass will have no effect).
function UPrimitiveComponent:AddTorqueInDegrees(Torque, BoneName, bAccelChange) end

---Add a torque to a single rigid body.
---@param Torque FVector
---@param BoneName? string @[default: None]
---@param bAccelChange? boolean @[default: false] If true, Torque is taken as a change in angular acceleration instead of a physical torque (i.e. mass will have no effect).
function UPrimitiveComponent:AddTorqueInRadians(Torque, BoneName, bAccelChange) end

---Add an impulse to a single rigid body at a specific location. The Strength is taken as a change in angular velocity instead of an impulse (ie. mass will have no effect).
---@param Impulse FVector
---@param Location FVector
---@param BoneName? string @[default: None]
function UPrimitiveComponent:AddVelocityChangeImpulseAtLocation(Impulse, Location, BoneName) end

---Return true if the given Pawn can step up onto this component.
---This controls whether they can try to step up on it when they bump in to it, not whether they can walk on it after landing on it.
---@param Pawn APawn @the Pawn that wants to step onto this component.
---@return boolean
function UPrimitiveComponent:CanCharacterStepUp(Pawn) end

---Clear the list of actors we ignore when moving.
function UPrimitiveComponent:ClearMoveIgnoreActors() end

---Clear the list of components we ignore when moving.
function UPrimitiveComponent:ClearMoveIgnoreComponents() end

---Returns the list of actors we currently ignore when moving.
---@return TArray<AActor>
function UPrimitiveComponent:CopyArrayOfMoveIgnoreActors() end

---Returns the list of actors we currently ignore when moving.
---@return TArray<UPrimitiveComponent>
function UPrimitiveComponent:CopyArrayOfMoveIgnoreComponents() end

---Creates a Dynamic Material Instance for the specified element index.  The parent of the instance is set to the material being replaced.
---@param ElementIndex integer @- The index of the skin to replace the material for.  If invalid, the material is unchanged and NULL is returned.
---@return UMaterialInstanceDynamic
function UPrimitiveComponent:CreateAndSetMaterialInstanceDynamic(ElementIndex) end

---Creates a Dynamic Material Instance for the specified element index.  The parent of the instance is set to the material being replaced.
---@param ElementIndex integer @- The index of the skin to replace the material for.  If invalid, the material is unchanged and NULL is returned.
---@param Parent UMaterialInterface
---@return UMaterialInstanceDynamic
function UPrimitiveComponent:CreateAndSetMaterialInstanceDynamicFromMaterial(ElementIndex, Parent) end

---Creates a Dynamic Material Instance for the specified element index, optionally from the supplied material.
---@param ElementIndex integer @- The index of the skin to replace the material for.  If invalid, the material is unchanged and NULL is returned.
---@param SourceMaterial? UMaterialInterface @[default: None]
---@param OptionalName? string @[default: None]
---@return UMaterialInstanceDynamic
function UPrimitiveComponent:CreateDynamicMaterialInstance(ElementIndex, SourceMaterial, OptionalName) end

---Returns the angular damping of this component.
---@return number
function UPrimitiveComponent:GetAngularDamping() end

---Returns BodyInstanceAsyncPhysicsTickHandle of the component. For use in the Async Physics Tick event
---@param BoneName? string @[default: None]
---@param bGetWelded? boolean @[default: true]
---@param Index? integer @[default: -1]
---@return FBodyInstanceAsyncPhysicsTickHandle
function UPrimitiveComponent:GetBodyInstanceAsyncPhysicsTickHandle(BoneName, bGetWelded, Index) end

---Get the center of mass of a single body. In the case of a welded body this will return the center of mass of the entire welded body (including its parent and children)
---Objects that are not simulated return (0,0,0) as they do not have COM
---@param BoneName? string @[default: None]
---@return FVector
function UPrimitiveComponent:GetCenterOfMass(BoneName) end

---Returns the distance and closest point to the collision surface.
---Component must have simple collision to be queried for closest point.
---                              If returns < 0.f, this primitive does not have collsion
---@param Point FVector
---@param OutPointOnBody FVector @[out]
---@param BoneName? string @[default: None]
---@return number
function UPrimitiveComponent:GetClosestPointOnCollision(Point, OutPointOnBody, BoneName) end

---Returns the form of collision for this component
---@return integer
function UPrimitiveComponent:GetCollisionEnabled() end

---Gets the collision object type
---@return integer
function UPrimitiveComponent:GetCollisionObjectType() end

---Get the collision profile name
---@return string
function UPrimitiveComponent:GetCollisionProfileName() end

---Gets the response type given a specific channel
---@param Channel integer
---@return integer
function UPrimitiveComponent:GetCollisionResponseToChannel(Channel) end

---Gets the index of the scalar parameter for the custom primitive data array
---@param ParameterName string
---@return integer
function UPrimitiveComponent:GetCustomPrimitiveDataIndexForScalarParameter(ParameterName) end

---Gets the index of the vector parameter for the custom primitive data array
---@param ParameterName string
---@return integer
function UPrimitiveComponent:GetCustomPrimitiveDataIndexForVectorParameter(ParameterName) end

---@return TArray<integer>
function UPrimitiveComponent:GetExcludeForSpecificHLODLevels() end

---If true, this component will generate overlap events when it is overlapping other components (eg Begin Overlap).
---Both components (this and the other) must have this enabled for overlap events to occur.
---@return boolean
function UPrimitiveComponent:GetGenerateOverlapEvents() end

---Whether or not the bounds of this component should be considered when focusing the editor camera to an actor with this component in it.
---Useful for debug components which need a bounds for rendering but don't contribute to the visible part of the mesh in a meaningful way
---@return boolean
function UPrimitiveComponent:GetIgnoreBoundsForEditorFocus() end

---Returns the inertia tensor of this component in kg cm^2. The inertia tensor is in local component space.
---@param BoneName? string @[default: None]
---@return FVector
function UPrimitiveComponent:GetInertiaTensor(BoneName) end

---Returns the linear damping of this component.
---@return number
function UPrimitiveComponent:GetLinearDamping() end

---Returns the mass of this component in kg.
---@return number
function UPrimitiveComponent:GetMass() end

---Returns the mass scale used to calculate the mass of a single physics body
---@param BoneName? string @[default: None]
---@return number
function UPrimitiveComponent:GetMassScale(BoneName) end

---Returns the material used by the element at the specified index
---@param ElementIndex integer @- The element to access the material of.
---@return UMaterialInterface
function UPrimitiveComponent:GetMaterial(ElementIndex) end

---Try and retrieve the material applied to a particular collision face of mesh. Used with face index returned from collision trace.
---     @@param  FaceIndex               Face index from hit result that was hit by a trace
---     @@param  SectionIndex    Section of the mesh that the face belongs to
---     @@return                                 Material applied to section that the hit face belongs to
---@param FaceIndex integer
---@param SectionIndex integer @[out]
---@return UMaterialInterface
function UPrimitiveComponent:GetMaterialFromCollisionFaceIndex(FaceIndex, SectionIndex) end

---Return number of material elements in this primitive
---@return integer
function UPrimitiveComponent:GetNumMaterials() end

---Returns a list of actors that this component is overlapping.
---@param OverlappingActors TArray<AActor> @[out]
---@param ClassFilter? TSubclassOf<AActor> @[default: None]
function UPrimitiveComponent:GetOverlappingActors(OverlappingActors, ClassFilter) end

---Returns unique list of components this component is overlapping.
---@param OutOverlappingComponents TArray<UPrimitiveComponent> @[out]
function UPrimitiveComponent:GetOverlappingComponents(OutOverlappingComponents) end

---Get the angular velocity of a single body, in degrees per second.
---@param BoneName? string @[default: None]
---@return FVector
function UPrimitiveComponent:GetPhysicsAngularVelocityInDegrees(BoneName) end

---Get the angular velocity of a single body, in radians per second.
---@param BoneName? string @[default: None]
---@return FVector
function UPrimitiveComponent:GetPhysicsAngularVelocityInRadians(BoneName) end

---Get the linear velocity of a single body.
---@param BoneName? string @[default: None]
---@return FVector
function UPrimitiveComponent:GetPhysicsLinearVelocity(BoneName) end

---Get the linear velocity of a point on a single body.
---@param Point FVector
---@param BoneName? string @[default: None]
---@return FVector
function UPrimitiveComponent:GetPhysicsLinearVelocityAtPoint(Point, BoneName) end

---@return boolean
function UPrimitiveComponent:GetStaticWhenNotMoveable() end

---Returns the slope override struct for this component.
---@return FWalkableSlopeOverride
function UPrimitiveComponent:GetWalkableSlopeOverride() end

---Tells this component whether to ignore collision with all components of a specific Actor when this component is moved.
---Components on the other Actor may also need to be told to do the same when they move.
---Does not affect movement of this component when simulating physics.
---@param Actor AActor
---@param bShouldIgnore boolean
function UPrimitiveComponent:IgnoreActorWhenMoving(Actor, bShouldIgnore) end

---Tells this component whether to ignore collision with another component when this component is moved.
---The other components may also need to be told to do the same when they move.
---Does not affect movement of this component when simulating physics.
---@param Component UPrimitiveComponent
---@param bShouldIgnore boolean
function UPrimitiveComponent:IgnoreComponentWhenMoving(Component, bShouldIgnore) end

---Invalidates Lumen surface cache and forces it to be refreshed. Useful to make material updates more responsive.
function UPrimitiveComponent:InvalidateLumenSurfaceCache() end

---Returns if any body in this component is currently awake and simulating.
---@return boolean
function UPrimitiveComponent:IsAnyRigidBodyAwake() end

---Whether this primitive is excluded from the specified HLOD level
---@param HLODLevel EHLODLevelExclusion
---@return boolean
function UPrimitiveComponent:IsExcludedFromHLODLevel(HLODLevel) end

---Returns whether this component is affected by gravity. Returns always false if the component is not simulated.
---@return boolean
function UPrimitiveComponent:IsGravityEnabled() end

---Check whether this component is overlapping any component of the given Actor.
---@param Other AActor @Actor to test this component against.
---@return boolean
function UPrimitiveComponent:IsOverlappingActor(Other) end

---Check whether this component is overlapping another component.
---@param OtherComp UPrimitiveComponent @Component to test this component against.
---@return boolean
function UPrimitiveComponent:IsOverlappingComponent(OtherComp) end

---Perform a box overlap against a single component as an AABB (No rotation)
---@param InBoxCentre FVector @The centre of the box to overlap with the component
---@param InBox FBox @Description of the box to use in the overlap
---@param bTraceComplex boolean @Whether or not to trace the complex physics representation or just the simple representation
---@param bShowTrace boolean @Whether or not to draw the trace in the world (for debugging)
---@param bPersistentShowTrace boolean @Whether or not to make the debugging draw stay in the world permanently
---@param HitLocation FVector @[out]
---@param HitNormal FVector @[out]
---@param BoneName string @[out]
---@param OutHit FHitResult @[out]
---@return boolean
function UPrimitiveComponent:K2_BoxOverlapComponent(InBoxCentre, InBox, bTraceComplex, bShowTrace, bPersistentShowTrace, HitLocation, HitNormal, BoneName, OutHit) end

---Utility to see if there is any form of collision (query or physics) enabled on this component.
---@return boolean
function UPrimitiveComponent:K2_IsCollisionEnabled() end

---Utility to see if there is any physics collision enabled on this component.
---@return boolean
function UPrimitiveComponent:K2_IsPhysicsCollisionEnabled() end

---Utility to see if there is any query collision enabled on this component.
---@return boolean
function UPrimitiveComponent:K2_IsQueryCollisionEnabled() end

---Perform a line trace against a single component
---@param TraceStart FVector @The start of the trace in world-space
---@param TraceEnd FVector @The end of the trace in world-space
---@param bTraceComplex boolean @Whether or not to trace the complex physics representation or just the simple representation
---@param bShowTrace boolean @Whether or not to draw the trace in the world (for debugging)
---@param bPersistentShowTrace boolean @Whether or not to make the debugging draw stay in the world permanently
---@param HitLocation FVector @[out]
---@param HitNormal FVector @[out]
---@param BoneName string @[out]
---@param OutHit FHitResult @[out]
---@return boolean
function UPrimitiveComponent:K2_LineTraceComponent(TraceStart, TraceEnd, bTraceComplex, bShowTrace, bPersistentShowTrace, HitLocation, HitNormal, BoneName, OutHit) end

---Perform a sphere overlap against a single component
---@param InSphereCentre FVector @The centre of the sphere to overlap with the component
---@param InSphereRadius number @The Radius of the sphere to overlap with the component
---@param bTraceComplex boolean @Whether or not to trace the complex physics representation or just the simple representation
---@param bShowTrace boolean @Whether or not to draw the trace in the world (for debugging)
---@param bPersistentShowTrace boolean @Whether or not to make the debugging draw stay in the world permanently
---@param HitLocation FVector @[out]
---@param HitNormal FVector @[out]
---@param BoneName string @[out]
---@param OutHit FHitResult @[out]
---@return boolean
function UPrimitiveComponent:K2_SphereOverlapComponent(InSphereCentre, InSphereRadius, bTraceComplex, bShowTrace, bPersistentShowTrace, HitLocation, HitNormal, BoneName, OutHit) end

---Perform a sphere trace against a single component
---@param TraceStart FVector @The start of the trace in world-space
---@param TraceEnd FVector @The end of the trace in world-space
---@param SphereRadius number @Radius of the sphere to trace against the component
---@param bTraceComplex boolean @Whether or not to trace the complex physics representation or just the simple representation
---@param bShowTrace boolean @Whether or not to draw the trace in the world (for debugging)
---@param bPersistentShowTrace boolean @Whether or not to make the debugging draw stay in the world permanently
---@param HitLocation FVector @[out]
---@param HitNormal FVector @[out]
---@param BoneName string @[out]
---@param OutHit FHitResult @[out]
---@return boolean
function UPrimitiveComponent:K2_SphereTraceComponent(TraceStart, TraceEnd, SphereRadius, bTraceComplex, bShowTrace, bPersistentShowTrace, HitLocation, HitNormal, BoneName, OutHit) end

---Force a single body back to sleep.
---@param BoneName? string @[default: None]
function UPrimitiveComponent:PutRigidBodyToSleep(BoneName) end

---Scales the given vector by the world space moment of inertia. Useful for computing the torque needed to rotate an object.
---@param InputVector FVector
---@param BoneName? string @[default: None]
---@return FVector
function UPrimitiveComponent:ScaleByMomentOfInertia(InputVector, BoneName) end

---Changes the value of Affect Distance Field Lighting
---@param NewAffectDistanceFieldLighting boolean
function UPrimitiveComponent:SetAffectDistanceFieldLighting(NewAffectDistanceFieldLighting) end

---Changes the value of bAffectDynamicIndirectLighting
---@param bNewAffectDynamicIndirectLighting boolean
function UPrimitiveComponent:SetAffectDynamicIndirectLighting(bNewAffectDynamicIndirectLighting) end

---Changes the value of bAffectIndirectLightingWhileHidden
---@param bNewAffectIndirectLightingWhileHidden boolean
function UPrimitiveComponent:SetAffectIndirectLightingWhileHidden(bNewAffectIndirectLightingWhileHidden) end

---Change the mass scale used fo all bodies in this component
---@param InMassScale? number @[default: 1.000000]
function UPrimitiveComponent:SetAllMassScale(InMassScale) end

---Set the angular velocity of all bodies in this component.
---@param NewAngVel FVector
---@param bAddToCurrent? boolean @[default: false]
function UPrimitiveComponent:SetAllPhysicsAngularVelocityInDegrees(NewAngVel, bAddToCurrent) end

---Set the angular velocity of all bodies in this component.
---@param NewAngVel FVector
---@param bAddToCurrent? boolean @[default: false]
function UPrimitiveComponent:SetAllPhysicsAngularVelocityInRadians(NewAngVel, bAddToCurrent) end

---Set the linear velocity of all bodies in this component.
---@param NewVel FVector
---@param bAddToCurrent? boolean @[default: false]
function UPrimitiveComponent:SetAllPhysicsLinearVelocity(NewVel, bAddToCurrent) end

---Set whether all bodies in this component should use Continuous Collision Detection
---@param InUseCCD boolean
function UPrimitiveComponent:SetAllUseCCD(InUseCCD) end

---Sets the angular damping of this component.
---@param InDamping number
function UPrimitiveComponent:SetAngularDamping(InDamping) end

---Scale the bounds of this object, used for frustum culling. Useful for features like WorldPositionOffset.
---@param NewBoundsScale? number @[default: 1.000000]
function UPrimitiveComponent:SetBoundsScale(NewBoundsScale) end

---Changes the value of bCastContactShadow.
---@param bInCastContactShadow boolean
function UPrimitiveComponent:SetCastContactShadow(bInCastContactShadow) end

---Changes the value of CastHiddenShadow.
---@param NewCastHiddenShadow boolean
function UPrimitiveComponent:SetCastHiddenShadow(NewCastHiddenShadow) end

---Changes the value of CastInsetShadow.
---@param bInCastInsetShadow boolean
function UPrimitiveComponent:SetCastInsetShadow(bInCastInsetShadow) end

---Changes the value of CastShadow.
---@param NewCastShadow boolean
function UPrimitiveComponent:SetCastShadow(NewCastShadow) end

---Set the center of mass of a single body. This will offset the physx-calculated center of mass.
---Note that in the case where multiple bodies are attached together, the center of mass will be set for the entire group.
---@param CenterOfMassOffset FVector
---@param BoneName? string @[default: None]
function UPrimitiveComponent:SetCenterOfMass(CenterOfMassOffset, BoneName) end

---Controls what kind of collision is enabled for this body
---@param NewType integer
function UPrimitiveComponent:SetCollisionEnabled(NewType) end

---Changes the collision channel that this object uses when it moves
---@param Channel integer @The new channel for this component to use
function UPrimitiveComponent:SetCollisionObjectType(Channel) end

---Set Collision Profile Name
---This function is called by constructors when they set ProfileName
---This will change current CollisionProfileName to be this, and overwrite Collision Setting
---@param InCollisionProfileName string @: New Profile Name
---@param bUpdateOverlaps? boolean @[default: true]
function UPrimitiveComponent:SetCollisionProfileName(InCollisionProfileName, bUpdateOverlaps) end

---Changes all ResponseToChannels container for this PrimitiveComponent. to be NewResponse
---@param NewResponse integer @What the new response should be to the supplied Channel
function UPrimitiveComponent:SetCollisionResponseToAllChannels(NewResponse) end

---Changes a member of the ResponseToChannels container for this PrimitiveComponent.
---@param Channel integer @The channel to change the response of
---@param NewResponse integer @What the new response should be to the supplied Channel
function UPrimitiveComponent:SetCollisionResponseToChannel(Channel, NewResponse) end

---Sets the constraint mode of the component.
---@param ConstraintMode integer
function UPrimitiveComponent:SetConstraintMode(ConstraintMode) end

---Changes the value of CullDistance.
---@param NewCullDistance number @- The value to assign to CullDistance.
function UPrimitiveComponent:SetCullDistance(NewCullDistance) end

---Sets the CustomDepth stencil value (0 - 255) and marks the render state dirty.
---@param Value integer
function UPrimitiveComponent:SetCustomDepthStencilValue(Value) end

---Sets the CustomDepth stencil write mask and marks the render state dirty.
---@param WriteMaskBit ERendererStencilMask
function UPrimitiveComponent:SetCustomDepthStencilWriteMask(WriteMaskBit) end

---Set custom primitive data at index DataIndex. This sets the run-time data only, so it doesn't serialize.
---@param DataIndex integer
---@param Value number
function UPrimitiveComponent:SetCustomPrimitiveDataFloat(DataIndex, Value) end

---Set custom primitive data, two floats at once, from index DataIndex to index DataIndex + 1. This sets the run-time data only, so it doesn't serialize.
---@param DataIndex integer
---@param Value FVector2D
function UPrimitiveComponent:SetCustomPrimitiveDataVector2(DataIndex, Value) end

---Set custom primitive data, three floats at once, from index DataIndex to index DataIndex + 2. This sets the run-time data only, so it doesn't serialize.
---@param DataIndex integer
---@param Value FVector
function UPrimitiveComponent:SetCustomPrimitiveDataVector3(DataIndex, Value) end

---Set custom primitive data, four floats at once, from index DataIndex to index DataIndex + 3. This sets the run-time data only, so it doesn't serialize.
---@param DataIndex integer
---@param Value FVector4
function UPrimitiveComponent:SetCustomPrimitiveDataVector4(DataIndex, Value) end

---Set default custom primitive data at index DataIndex, and marks the render state dirty
---@param DataIndex integer
---@param Value number
function UPrimitiveComponent:SetDefaultCustomPrimitiveDataFloat(DataIndex, Value) end

---Set default custom primitive data, two floats at once, from index DataIndex to index DataIndex + 1, and marks the render state dirty
---@param DataIndex integer
---@param Value FVector2D
function UPrimitiveComponent:SetDefaultCustomPrimitiveDataVector2(DataIndex, Value) end

---Set default custom primitive data, three floats at once, from index DataIndex to index DataIndex + 2, and marks the render state dirty
---@param DataIndex integer
---@param Value FVector
function UPrimitiveComponent:SetDefaultCustomPrimitiveDataVector3(DataIndex, Value) end

---Set default custom primitive data, four floats at once, from index DataIndex to index DataIndex + 3, and marks the render state dirty
---@param DataIndex integer
---@param Value FVector4
function UPrimitiveComponent:SetDefaultCustomPrimitiveDataVector4(DataIndex, Value) end

---Changes the value of EmissiveLightSource.
---@param NewEmissiveLightSource boolean
function UPrimitiveComponent:SetEmissiveLightSource(NewEmissiveLightSource) end

---Enables/disables whether this component is affected by gravity. This applies only to components with bSimulatePhysics set to true.
---@param bGravityEnabled boolean
function UPrimitiveComponent:SetEnableGravity(bGravityEnabled) end

---Exclude this primitive from the specified HLOD level
---@param HLODLevel EHLODLevelExclusion
---@param bExcluded boolean
function UPrimitiveComponent:SetExcludedFromHLODLevel(HLODLevel, bExcluded) end

---@param InExcludeForSpecificHLODLevels TArray<integer>
function UPrimitiveComponent:SetExcludeForSpecificHLODLevels(InExcludeForSpecificHLODLevels) end

---Changes the value of ExcludeFromLightAttachmentGroup.
---@param bInExcludeFromLightAttachmentGroup boolean
function UPrimitiveComponent:SetExcludeFromLightAttachmentGroup(bInExcludeFromLightAttachmentGroup) end

---Modifies value returned by GetGenerateOverlapEvents()
---@param bInGenerateOverlapEvents boolean
function UPrimitiveComponent:SetGenerateOverlapEvents(bInGenerateOverlapEvents) end

---Sets bHideInSceneCapture property and marks the render state dirty.
---@param bValue boolean
function UPrimitiveComponent:SetHiddenInSceneCapture(bValue) end

---Changes the value of bHoldout (Path Tracing only feature)
---@param bNewHoldout boolean
function UPrimitiveComponent:SetHoldout(bNewHoldout) end

---Set if we should ignore bounds when focusing the editor camera.
---@param bIgnore boolean
function UPrimitiveComponent:SetIgnoreBoundsForEditorFocus(bIgnore) end

---Changes the value of LightAttachmentsAsGroup.
---@param bInLightAttachmentsAsGroup boolean
function UPrimitiveComponent:SetLightAttachmentsAsGroup(bInLightAttachmentsAsGroup) end

---@param bChannel0 boolean
---@param bChannel1 boolean
---@param bChannel2 boolean
function UPrimitiveComponent:SetLightingChannels(bChannel0, bChannel1, bChannel2) end

---Sets the linear damping of this component.
---@param InDamping number
function UPrimitiveComponent:SetLinearDamping(InDamping) end

---Override the mass (in Kg) of a single physics body.
---Note that in the case where multiple bodies are attached together, the override mass will be set for the entire group.
---Set the Override Mass to false if you want to reset the body's mass to the auto-calculated physx mass.
---@param BoneName? string @[default: None]
---@param MassInKg? number @[default: 1.000000]
---@param bOverrideMass? boolean @[default: true]
function UPrimitiveComponent:SetMassOverrideInKg(BoneName, MassInKg, bOverrideMass) end

---Change the mass scale used to calculate the mass of a single physics body
---@param BoneName? string @[default: None]
---@param InMassScale? number @[default: 1.000000]
function UPrimitiveComponent:SetMassScale(BoneName, InMassScale) end

---Changes the material applied to an element of the mesh.
---@param ElementIndex integer @- The element to access the material of.
---@param Material UMaterialInterface
function UPrimitiveComponent:SetMaterial(ElementIndex, Material) end

---Changes the material applied to an element of the mesh.
---@param MaterialSlotName string @- The slot name to access the material of.
---@param Material UMaterialInterface
function UPrimitiveComponent:SetMaterialByName(MaterialSlotName, Material) end

---Changes the value of bNotifyRigidBodyCollision
---@param bNewNotifyRigidBodyCollision boolean
function UPrimitiveComponent:SetNotifyRigidBodyCollision(bNewNotifyRigidBodyCollision) end

---Changes the value of bOnlyOwnerSee.
---@param bNewOnlyOwnerSee boolean
function UPrimitiveComponent:SetOnlyOwnerSee(bNewOnlyOwnerSee) end

---Changes the value of bOwnerNoSee.
---@param bNewOwnerNoSee boolean
function UPrimitiveComponent:SetOwnerNoSee(bNewOwnerNoSee) end

---Set the angular velocity of a single body.
---This should be used cautiously - it may be better to use AddTorque or AddImpulse.
---@param NewAngVel FVector
---@param bAddToCurrent? boolean @[default: false]
---@param BoneName? string @[default: None]
function UPrimitiveComponent:SetPhysicsAngularVelocityInDegrees(NewAngVel, bAddToCurrent, BoneName) end

---Set the angular velocity of a single body.
---This should be used cautiously - it may be better to use AddTorque or AddImpulse.
---@param NewAngVel FVector
---@param bAddToCurrent? boolean @[default: false]
---@param BoneName? string @[default: None]
function UPrimitiveComponent:SetPhysicsAngularVelocityInRadians(NewAngVel, bAddToCurrent, BoneName) end

---Set the linear velocity of a single body.
---This should be used cautiously - it may be better to use AddForce or AddImpulse.
---@param NewVel FVector
---@param bAddToCurrent? boolean @[default: false]
---@param BoneName? string @[default: None]
function UPrimitiveComponent:SetPhysicsLinearVelocity(NewVel, bAddToCurrent, BoneName) end

---Set the maximum angular velocity of a single body.
---@param NewMaxAngVel number
---@param bAddToCurrent? boolean @[default: false]
---@param BoneName? string @[default: None]
function UPrimitiveComponent:SetPhysicsMaxAngularVelocityInDegrees(NewMaxAngVel, bAddToCurrent, BoneName) end

---Set the maximum angular velocity of a single body.
---@param NewMaxAngVel number
---@param bAddToCurrent? boolean @[default: false]
---@param BoneName? string @[default: None]
function UPrimitiveComponent:SetPhysicsMaxAngularVelocityInRadians(NewMaxAngVel, bAddToCurrent, BoneName) end

---Changes the current PhysMaterialOverride for this component.
---Note that if physics is already running on this component, this will _not_ alter its mass/inertia etc,
---it will only change its surface properties like friction.
---@param NewPhysMaterial UPhysicalMaterial
function UPrimitiveComponent:SetPhysMaterialOverride(NewPhysMaterial) end

---Changes the value of bReceivesDecals.
---@param bNewReceivesDecals boolean
function UPrimitiveComponent:SetReceivesDecals(bNewReceivesDecals) end

---Sets the bRenderCustomDepth property and marks the render state dirty.
---@param bValue boolean
function UPrimitiveComponent:SetRenderCustomDepth(bValue) end

---Sets bRenderInDepthPass property and marks the render state dirty.
---@param bValue boolean
function UPrimitiveComponent:SetRenderInDepthPass(bValue) end

---Sets bRenderInMainPass property and marks the render state dirty.
---@param bValue boolean
function UPrimitiveComponent:SetRenderInMainPass(bValue) end

---Set a scalar parameter for custom primitive data. This sets the run-time data only, so it doesn't serialize.
---@param ParameterName string
---@param Value number
function UPrimitiveComponent:SetScalarParameterForCustomPrimitiveData(ParameterName, Value) end

---Set a scalar parameter for default custom primitive data. This will be serialized and is useful in construction scripts.
---@param ParameterName string
---@param Value number
function UPrimitiveComponent:SetScalarParameterForDefaultCustomPrimitiveData(ParameterName, Value) end

---Sets whether or not a single body should use physics simulation, or should be 'fixed' (kinematic).
---Note that if this component is currently attached to something, beginning simulation will detach it.
---@param bSimulate boolean
function UPrimitiveComponent:SetSimulatePhysics(bSimulate) end

---Changes the value of bSingleSampleShadowFromStationaryLights.
---@param bNewSingleSampleShadowFromStationaryLights boolean
function UPrimitiveComponent:SetSingleSampleShadowFromStationaryLights(bNewSingleSampleShadowFromStationaryLights) end

---@param bInStaticWhenNotMoveable boolean
function UPrimitiveComponent:SetStaticWhenNotMoveable(bInStaticWhenNotMoveable) end

---Changes the value of TranslucencySortDistanceOffset.
---@param NewTranslucencySortDistanceOffset number
function UPrimitiveComponent:SetTranslucencySortDistanceOffset(NewTranslucencySortDistanceOffset) end

---Changes the value of TranslucentSortPriority.
---@param NewTranslucentSortPriority integer
function UPrimitiveComponent:SetTranslucentSortPriority(NewTranslucentSortPriority) end

---Set whether this component should use Continuous Collision Detection
---@param InUseCCD boolean
---@param BoneName? string @[default: None]
function UPrimitiveComponent:SetUseCCD(InUseCCD, BoneName) end

---Set a vector parameter for custom primitive data. This sets the run-time data only, so it doesn't serialize.
---@param ParameterName string
---@param Value FVector4
function UPrimitiveComponent:SetVectorParameterForCustomPrimitiveData(ParameterName, Value) end

---Set a vector parameter for default custom primitive data. This will be serialized and is useful in construction scripts.
---@param ParameterName string
---@param Value FVector4
function UPrimitiveComponent:SetVectorParameterForDefaultCustomPrimitiveData(ParameterName, Value) end

---Changes the value of bIsVisibleInRayTracing.
---@param bNewVisibleInRayTracing boolean
function UPrimitiveComponent:SetVisibleInRayTracing(bNewVisibleInRayTracing) end

---Sets bVisibleInSceneCaptureOnly property and marks the render state dirty.
---@param bValue boolean
function UPrimitiveComponent:SetVisibleInSceneCaptureOnly(bValue) end

---Sets a new slope override for this component instance.
---@param NewOverride FWalkableSlopeOverride
function UPrimitiveComponent:SetWalkableSlopeOverride(NewOverride) end

---Ensure simulation is running for all bodies in this component.
function UPrimitiveComponent:WakeAllRigidBodies() end

---'Wake' physics simulation for a single body.
---@param BoneName? string @[default: None]
function UPrimitiveComponent:WakeRigidBody(BoneName) end

---Returns true if this component has been rendered "recently", with a tolerance in seconds to define what "recent" means.
---e.g.: If a tolerance of 0.1 is used, this function will return true only if the actor was rendered in the last 0.1 seconds of game time.
---@param Tolerance? number @[default: 0.200000] How many seconds ago the actor last render time can be and still count as having been "recently" rendered.
---@return boolean
function UPrimitiveComponent:WasRecentlyRendered(Tolerance) end

