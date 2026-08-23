---@meta
---The World is the top level object representing a map or a sandbox in which Actors and Components will exist and be rendered.
---A World can be a single Persistent Level with an optional list of streaming levels that are loaded and unloaded via volumes and blueprint functions
---or it can be a collection of levels organized with a World Composition.
---In a standalone game, generally only a single World exists except during seamless area transitions when both a destination and current world exists.
---In the editor many Worlds exist: The level being edited, each PIE instance, each editor tool which has an interactive rendered viewport, and many more.
---@class UWorld : UObject
---@field public PersistentLevel ULevel @Persistent level containing the world info, default brush and actors spawned during gameplay among other things
---@field public NetDriver UNetDriver @The NAME_GameNetDriver game connection(s) for client/server communication
---@field public LineBatcher ULineBatchComponent @Line Batchers. All lines to be drawn in the world.
---@field public PersistentLineBatcher ULineBatchComponent @Persistent Line Batchers. They don't get flushed every frame.
---@field public ForegroundLineBatcher ULineBatchComponent @Foreground Line Batchers. This can't be Persistent.
---@field public NetworkManager AGameNetworkManager @Instance of this world's game-specific networking management
---@field public PhysicsCollisionHandler UPhysicsCollisionHandler @Instance of this world's game-specific physics collision handler
---@field public ExtraReferencedObjects TArray<UObject> @Array of any additional objects that need to be referenced by this world, to make sure they aren't GC'd
---@field public PerModuleDataObjects TArray<UObject> @External modules can have additional data associated with this UWorld. This is a list of per module world data objects. These aren't loaded/saved by default.
---@field private StreamingLevels TArray<ULevelStreaming> @Level collection. ULevels are referenced by FName (Package name) to avoid serialized references. Also contains offsets in world units
---@field private StreamingLevelsToConsider FStreamingLevelsToConsider @This is the list of streaming levels that are actively being considered for what their state should be. It will be a subset of StreamingLevels
---@field private ServerStreamingLevelsVisibility AServerStreamingLevelsVisibility
---@field public StreamingLevelsPrefix string @Prefix we used to rename streaming levels, non empty in PIE and standalone preview
---@field private CurrentLevelPendingVisibility ULevel @Pointer to the current level in the queue to be made visible, NULL if none are pending.
---@field private CurrentLevelPendingInvisibility ULevel @Pointer to the current level in the queue to be made invisible, NULL if none are pending.
---@field private DemoNetDriver UDemoNetDriver @NetDriver for capturing network traffic to record demos
---@field public MyParticleEventManager AParticleEventManager @Particle event manager *
---@field private DefaultPhysicsVolume APhysicsVolume @DefaultPhysicsVolume used for whole game *
---@field public bAreConstraintsDirty boolean @Keeps track whether actors moved via PostEditMove and therefore constraint syncup should be performed.
---@field private NavigationSystem UNavigationSystemBase @The world's navigation data manager
---@field private AuthorityGameMode AGameModeBase @The current GameMode, valid only on the server
---@field private GameState AGameStateBase @The replicated actor which contains game state information that can be accessible to clients. Direct access is not allowed, use GetGameState<>()
---@field private AISystem UAISystemBase @The AI System handles generating pathing information and AI behavior
---@field private AvoidanceManager UAvoidanceManager @RVO avoidance manager used by game
---@field private Levels TArray<ULevel> @Array of levels currently in this world. Not serialized to disk to avoid hard references.
---@field private LevelCollections TArray<FLevelCollection> @Array of level collections currently in this world.
---@field private OwningGameInstance UGameInstance
---@field private ParameterCollectionInstances TArray<UMaterialParameterCollectionInstance> @Parameter collection instances that hold parameter overrides for this world.
---@field private CanvasForRenderingToTarget UCanvas @Canvas object used for drawing to render targets from blueprint functions eg DrawMaterialToRenderTarget. This is cached as UCanvas creation takes >100ms.
---@field private CanvasForDrawMaterialToRenderTarget UCanvas
---@field public PhysicsField UPhysicsFieldComponent @Physics Field component.
---@field public LWILastAssignedUID integer @Tracks the last assigned unique id for light weight instances in this world.
---@field private ComponentsThatNeedPreEndOfFrameSync TSet<UActorComponent> @Array of components that need to wait on tasks before end of frame updates
---@field private ComponentsThatNeedEndOfFrameUpdate TArray<UActorComponent> @Array of components that need updates at the end of the frame
---@field private ComponentsThatNeedEndOfFrameUpdate_OnGameThread TArray<UActorComponent> @Array of components that need game thread updates at the end of the frame
---@field public WorldComposition UWorldComposition @All levels information from which our world is composed
---@field public ContentBundleManager UContentBundleManager
---@field private PSCPool FWorldPSCPool
UWorld = {}

---Returns the UDataLayerManager associated with this world.
---@return UDataLayerManager
function UWorld:GetDataLayerManager() end

---Called from DemoNetDriver when playing back a replay and the timeline is successfully scrubbed
function UWorld:HandleTimelineScrubbed() end

---Returns the AWorldSettings actor associated with this world.
---@return AWorldSettings
function UWorld:K2_GetWorldSettings() end

---Seconds this world has been running, which does not advance while the game is paused.
---@return number
function UWorld:GetTimeSeconds() end

---Spawns an actor of the given class. Every argument after the class may be left off.
---SpawnActorEx takes the same spawn settings as one FActorSpawnParameters instead.
---@param Class UClass
---@param Transform? FTransform @Where to spawn it. Omitted, the actor is spawned at the origin with no rotation.
---@param CollisionHandlingOverride? ESpawnActorCollisionHandlingMethod @What to do when the actor would be spawned inside something.
---@param Owner? AActor @Must belong to this world.
---@param Instigator? AActor @The pawn answerable for damage the actor does. An actor that is not a pawn contributes its own instigator.
---@param ModuleName? string @Require path of a script module to bind the spawned actor to.
---@param Initializer? table @Passed to the bound module's Initialize function. Of no use without ModuleName.
---@param Level? ULevel @Level to spawn into, which becomes the actor's outer.
---@param Name? string @Name to give the actor. Omitted, a name is generated.
---@return AActor
function UWorld:SpawnActor(Class, Transform, CollisionHandlingOverride, Owner, Instigator, ModuleName, Initializer, Level, Name) end

---Spawns an actor of the given class, taking the spawn settings as one FActorSpawnParameters.
---The module path and the initializer table are in the opposite order to SpawnActor.
---@param Class UClass
---@param Transform? FTransform @Where to spawn it. Omitted, the actor is spawned at the origin with no rotation.
---@param Initializer? table @Passed to the bound module's Initialize function. Of no use without ModuleName.
---@param ModuleName? string @Require path of a script module to bind the spawned actor to.
---@param SpawnParameters? FActorSpawnParameters
---@return AActor
function UWorld:SpawnActorEx(Class, Transform, Initializer, ModuleName, SpawnParameters) end
