----> will be exported to EngineDecalClasses.h
---@class USceneCaptureComponent : USceneComponent
---@field public PrimitiveRenderMode ESceneCapturePrimitiveRenderMode @Controls what primitives get rendered into the scene capture.
---@field public CaptureSource integer
---@field public bCaptureEveryFrame boolean @Whether to update the capture's contents every frame.  If disabled, the component will render once on load and then only when moved.
---@field public bCaptureOnMovement boolean @Whether to update the capture's contents on movement.  Disable if you are going to capture manually from blueprint.
---@field public bAlwaysPersistRenderingState boolean @Whether to persist the rendering state even if bCaptureEveryFrame==false.  This allows velocities for Motion Blur and Temporal AA to be computed.
---@field public HiddenComponents TArray<TWeakObjectPtr<UPrimitiveComponent>> @The components won't rendered by current component.
---@field public HiddenActors TArray<AActor> @The actors to hide in the scene capture.
---@field public ShowOnlyComponents TArray<TWeakObjectPtr<UPrimitiveComponent>> @The only components to be rendered by this scene capture, if PrimitiveRenderMode is set to UseShowOnlyList.
---@field public ShowOnlyActors TArray<AActor> @The only actors to be rendered by this scene capture, if PrimitiveRenderMode is set to UseShowOnlyList.
---@field public LODDistanceFactor number @Scales the distance used by LOD. Set to values greater than 1 to cause the scene capture to use lower LODs than the main view to speed up the scene capture pass.
---@field public MaxViewDistanceOverride number @if > 0, sets a maximum render distance override.  Can be used to cull distant objects from a reflection if the reflecting plane is in an enclosed area like a hallway or room
---@field public CaptureSortPriority integer @Capture priority within the frame to sort scene capture on GPU to resolve interdependencies between multiple capture components. Highest come first.
---@field public bUseRayTracingIfEnabled boolean @Whether to use ray tracing for this capture. Ray Tracing must be enabled in the project.
---@field public ShowFlagSettings TArray<FEngineShowFlagsSetting> @ShowFlags for the SceneCapture's ViewFamily, to control rendering settings for this view. Hidden but accessible through details customization
---@field public ProfilingEventName string @Name of the profiling event.
---@field protected CaptureMesh UStaticMesh @The mesh used by ProxyMeshComponent
USceneCaptureComponent = {}

---Clears the hidden list.
function USceneCaptureComponent:ClearHiddenComponents() end

---Clears the Show Only list.
function USceneCaptureComponent:ClearShowOnlyComponents() end

---Adds all primitive components in the actor to our list of hidden components.
---@param InActor AActor
---@param bIncludeFromChildActors? boolean @[default: false] Whether to include the components from child actors
function USceneCaptureComponent:HideActorComponents(InActor, bIncludeFromChildActors) end

---Adds the component to our list of hidden components.
---@param InComponent UPrimitiveComponent
function USceneCaptureComponent:HideComponent(InComponent) end

---Removes an actor's components from the Show Only list.
---@param InActor AActor
---@param bIncludeFromChildActors? boolean @[default: false] Whether to remove the components from child actors
function USceneCaptureComponent:RemoveShowOnlyActorComponents(InActor, bIncludeFromChildActors) end

---Removes a component from the Show Only list.
---@param InComponent UPrimitiveComponent
function USceneCaptureComponent:RemoveShowOnlyComponent(InComponent) end

---Changes the value of TranslucentSortPriority.
---@param NewCaptureSortPriority integer
function USceneCaptureComponent:SetCaptureSortPriority(NewCaptureSortPriority) end

---Adds all primitive components in the actor to our list of show-only components.
---@param InActor AActor
---@param bIncludeFromChildActors? boolean @[default: false] Whether to include the components from child actors
function USceneCaptureComponent:ShowOnlyActorComponents(InActor, bIncludeFromChildActors) end

---Adds the component to our list of show-only components.
---@param InComponent UPrimitiveComponent
function USceneCaptureComponent:ShowOnlyComponent(InComponent) end

