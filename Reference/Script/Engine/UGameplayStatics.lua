---Static class with useful gameplay utility functions that can be called from both Blueprint and C++
---@class UGameplayStatics : UBlueprintFunctionLibrary
UGameplayStatics = {}

---Activates a Reverb Effect without the need for an Audio Volume
---@param WorldContextObject UObject
---@param ReverbEffect UReverbEffect @Reverb Effect to use
---@param TagName string @Tag to associate with Reverb Effect
---@param Priority? number @[default: 0.000000] Priority of the Reverb Effect
---@param Volume? number @[default: 0.500000] Volume level of Reverb Effect
---@param FadeTime? number @[default: 2.000000] Time before Reverb Effect is fully active
function UGameplayStatics.ActivateReverbEffect(WorldContextObject, ReverbEffect, TagName, Priority, Volume, FadeTime) end

---If accessibility is enabled, have the platform announce a string to the player.
---These announcements can be interrupted by system accessibiliity announcements or other accessibility announcement requests.
---This should be used judiciously as flooding a player with announcements can be overrwhelming and confusing.
---Try to make announcements concise and clear.
---NOTE: Currently only supported on Win10, Mac, iOS
---@param AnnouncementString string
function UGameplayStatics.AnnounceAccessibleString(AnnouncementString) end

---Hurts the specified actor with generic damage.
---@param DamagedActor AActor @- Actor that will be damaged.
---@param BaseDamage number @- The base damage to apply.
---@param EventInstigator AController @- Controller that was responsible for causing this damage (e.g. player who shot the weapon)
---@param DamageCauser AActor @- Actor that actually caused the damage (e.g. the grenade that exploded)
---@param DamageTypeClass TSubclassOf<UDamageType> @- Class that describes the damage that was done.
---@return number
function UGameplayStatics.ApplyDamage(DamagedActor, BaseDamage, EventInstigator, DamageCauser, DamageTypeClass) end

---Hurts the specified actor with the specified impact.
---@param DamagedActor AActor @- Actor that will be damaged.
---@param BaseDamage number @- The base damage to apply.
---@param HitFromDirection FVector @- Direction the hit came FROM
---@param HitInfo FHitResult @- Collision or trace result that describes the hit
---@param EventInstigator AController @- Controller that was responsible for causing this damage (e.g. player who shot the weapon)
---@param DamageCauser AActor @- Actor that actually caused the damage (e.g. the grenade that exploded)
---@param DamageTypeClass TSubclassOf<UDamageType> @- Class that describes the damage that was done.
---@return number
function UGameplayStatics.ApplyPointDamage(DamagedActor, BaseDamage, HitFromDirection, HitInfo, EventInstigator, DamageCauser, DamageTypeClass) end

---Hurt locally authoritative actors within the radius. Will only hit components that block the Visibility channel.
---@param WorldContextObject UObject
---@param BaseDamage number @- The base damage to apply, i.e. the damage at the origin.
---@param Origin FVector @- Epicenter of the damage area.
---@param DamageRadius number @- Radius of the damage area, from Origin
---@param DamageTypeClass TSubclassOf<UDamageType> @- Class that describes the damage that was done.
---@param IgnoreActors TArray<AActor> @- List of Actors to ignore
---@param DamageCauser? AActor @[default: None] - Actor that actually caused the damage (e.g. the grenade that exploded).  This actor will not be damaged and it will not block damage.
---@param InstigatedByController? AController @[default: None] - Controller that was responsible for causing this damage (e.g. player who threw the grenade)
---@param bDoFullDamage? boolean @[default: false]
---@param DamagePreventionChannel? integer @[default: ECC_Visibility] - Damage will not be applied to victim if there is something between the origin and the victim which blocks traces on this channel
---@return boolean
function UGameplayStatics.ApplyRadialDamage(WorldContextObject, BaseDamage, Origin, DamageRadius, DamageTypeClass, IgnoreActors, DamageCauser, InstigatedByController, bDoFullDamage, DamagePreventionChannel) end

---Hurt locally authoritative actors within the radius. Will only hit components that block the Visibility channel.
---@param WorldContextObject UObject
---@param BaseDamage number @- The base damage to apply, i.e. the damage at the origin.
---@param MinimumDamage number
---@param Origin FVector @- Epicenter of the damage area.
---@param DamageInnerRadius number @- Radius of the full damage area, from Origin
---@param DamageOuterRadius number @- Radius of the minimum damage area, from Origin
---@param DamageFalloff number @- Falloff exponent of damage from DamageInnerRadius to DamageOuterRadius
---@param DamageTypeClass TSubclassOf<UDamageType> @- Class that describes the damage that was done.
---@param IgnoreActors TArray<AActor> @- List of Actors to ignore
---@param DamageCauser? AActor @[default: None] - Actor that actually caused the damage (e.g. the grenade that exploded)
---@param InstigatedByController? AController @[default: None] - Controller that was responsible for causing this damage (e.g. player who threw the grenade)
---@param DamagePreventionChannel? integer @[default: ECC_Visibility] - Damage will not be applied to victim if there is something between the origin and the victim which blocks traces on this channel
---@return boolean
function UGameplayStatics.ApplyRadialDamageWithFalloff(WorldContextObject, BaseDamage, MinimumDamage, Origin, DamageInnerRadius, DamageOuterRadius, DamageFalloff, DamageTypeClass, IgnoreActors, DamageCauser, InstigatedByController, DamagePreventionChannel) end

---Determines if any audio listeners are within range of the specified location
---@param WorldContextObject UObject
---@param Location FVector
---@param MaximumRange number
---@return boolean
function UGameplayStatics.AreAnyListenersWithinRange(WorldContextObject, Location, MaximumRange) end

---Returns whether or not subtitles are currently enabled.
---@return boolean
function UGameplayStatics.AreSubtitlesEnabled() end

---Spawns an instance of an actor class, but does not automatically run its construction script.
---@param WorldContextObject UObject
---@param ActorClass TSubclassOf<AActor>
---@param SpawnTransform FTransform
---@param CollisionHandlingOverride? ESpawnActorCollisionHandlingMethod @[default: Undefined]
---@param Owner? AActor @[default: None]
---@param TransformScaleMethod? ESpawnActorScaleMethod @[default: MultiplyWithRoot]
---@return AActor
function UGameplayStatics.BeginDeferredActorSpawnFromClass(WorldContextObject, ActorClass, SpawnTransform, CollisionHandlingOverride, Owner, TransformScaleMethod) end

---Spawns an instance of a blueprint, but does not automatically run its construction script.
---@param WorldContextObject UObject
---@param Blueprint UBlueprint
---@param SpawnTransform FTransform
---@param bNoCollisionFail boolean
---@return AActor
function UGameplayStatics.BeginSpawningActorFromBlueprint(WorldContextObject, Blueprint, SpawnTransform, bNoCollisionFail) end

---Predict the arc of a virtual projectile affected by gravity with collision checks along the arc.
---Returns true if it hit something.
---@param WorldContextObject UObject
---@param PredictParams FPredictProjectilePathParams
---@param PredictResult FPredictProjectilePathResult @[out]
---@return boolean
function UGameplayStatics.Blueprint_PredictProjectilePath_Advanced(WorldContextObject, PredictParams, PredictResult) end

---Predict the arc of a virtual projectile affected by gravity with collision checks along the arc. Returns a list of positions of the simulated arc and the destination reached by the simulation.
---Returns true if it hit something.
---@param WorldContextObject UObject
---@param OutHit FHitResult @[out]
---@param OutPathPositions TArray<FVector> @[out]
---@param OutLastTraceDestination FVector @[out]
---@param StartPos FVector
---@param LaunchVelocity FVector
---@param bTracePath boolean
---@param ProjectileRadius number
---@param ObjectTypes TArray<integer>
---@param bTraceComplex boolean
---@param ActorsToIgnore TArray<AActor>
---@param DrawDebugType integer
---@param DrawDebugTime number
---@param SimFrequency? number @[default: 15.000000]
---@param MaxSimTime? number @[default: 2.000000]
---@param OverrideGravityZ? number @[default: 0.000000]
---@return boolean
function UGameplayStatics.Blueprint_PredictProjectilePath_ByObjectType(WorldContextObject, OutHit, OutPathPositions, OutLastTraceDestination, StartPos, LaunchVelocity, bTracePath, ProjectileRadius, ObjectTypes, bTraceComplex, ActorsToIgnore, DrawDebugType, DrawDebugTime, SimFrequency, MaxSimTime, OverrideGravityZ) end

---Predict the arc of a virtual projectile affected by gravity with collision checks along the arc. Returns a list of positions of the simulated arc and the destination reached by the simulation.
---Returns true if it hit something (if tracing with collision).
---@param WorldContextObject UObject
---@param OutHit FHitResult @[out]
---@param OutPathPositions TArray<FVector> @[out]
---@param OutLastTraceDestination FVector @[out]
---@param StartPos FVector
---@param LaunchVelocity FVector
---@param bTracePath boolean
---@param ProjectileRadius number
---@param TraceChannel integer
---@param bTraceComplex boolean
---@param ActorsToIgnore TArray<AActor>
---@param DrawDebugType integer
---@param DrawDebugTime number
---@param SimFrequency? number @[default: 15.000000]
---@param MaxSimTime? number @[default: 2.000000]
---@param OverrideGravityZ? number @[default: 0.000000]
---@return boolean
function UGameplayStatics.Blueprint_PredictProjectilePath_ByTraceChannel(WorldContextObject, OutHit, OutPathPositions, OutLastTraceDestination, StartPos, LaunchVelocity, bTracePath, ProjectileRadius, TraceChannel, bTraceComplex, ActorsToIgnore, DrawDebugType, DrawDebugTime, SimFrequency, MaxSimTime, OverrideGravityZ) end

---Calculates an launch velocity for a projectile to hit a specified point.
---@param WorldContextObject UObject
---@param TossVelocity FVector @[out]
---@param StartLocation FVector
---@param EndLocation FVector
---@param LaunchSpeed number
---@param OverrideGravityZ number
---@param TraceOption integer
---@param CollisionRadius number
---@param bFavorHighArc boolean
---@param bDrawDebug boolean
---@return boolean
function UGameplayStatics.BlueprintSuggestProjectileVelocity(WorldContextObject, TossVelocity, StartLocation, EndLocation, LaunchSpeed, OverrideGravityZ, TraceOption, CollisionRadius, bFavorHighArc, bDrawDebug) end

---Extracts data from a HitResult.
---@param Hit FHitResult
---@param bBlockingHit boolean @[out]
---@param bInitialOverlap boolean @[out] True if the hit started in an initial overlap. In this case some other values should be interpreted differently. Time will be 0, ImpactPoint will equal Location, and normals will be equal and indicate a depenetration vector.
---@param Time number @[out]
---@param Distance number @[out]
---@param Location FVector @[out]
---@param ImpactPoint FVector @[out]
---@param Normal FVector @[out]
---@param ImpactNormal FVector @[out]
---@param PhysMat UPhysicalMaterial @[out]
---@param HitActor AActor @[out]
---@param HitComponent UPrimitiveComponent @[out]
---@param HitBoneName string @[out]
---@param BoneName string @[out]
---@param HitItem integer @[out]
---@param ElementIndex integer @[out]
---@param FaceIndex integer @[out]
---@param TraceStart FVector @[out]
---@param TraceEnd FVector @[out]
function UGameplayStatics.BreakHitResult(Hit, bBlockingHit, bInitialOverlap, Time, Distance, Location, ImpactPoint, Normal, ImpactNormal, PhysMat, HitActor, HitComponent, HitBoneName, BoneName, HitItem, ElementIndex, FaceIndex, TraceStart, TraceEnd) end

---Cancels all currently queued streaming packages
function UGameplayStatics.CancelAsyncLoading() end

---Clears any existing override of the Sound Class Adjuster in the given Sound Mix
---@param WorldContextObject UObject
---@param InSoundMixModifier USoundMix @The sound mix to modify.
---@param InSoundClass USoundClass @The sound class in the sound mix to clear overrides from.
---@param FadeOutTime? number @[default: 1.000000] The interpolation time to use to go from the current sound class adjuster override values to the non-override values.
function UGameplayStatics.ClearSoundMixClassOverride(WorldContextObject, InSoundMixModifier, InSoundClass, FadeOutTime) end

---Clear all sound mix modifiers from the audio system
---@param WorldContextObject UObject
function UGameplayStatics.ClearSoundMixModifiers(WorldContextObject) end

---Create a new local player for this game, for cases like local multiplayer.
---@param WorldContextObject UObject
---@param ControllerId? integer @[default: -1] The ID of the physical controller that the should control the newly created player. A value of -1 specifies to use the next available ID
---@param bSpawnPlayerController? boolean @[default: true] Whether a player controller should be spawned immediately for this player. If false a player controller will not be created automatically until transition to the next map.
---@return APlayerController
function UGameplayStatics.CreatePlayer(WorldContextObject, ControllerId, bSpawnPlayerController) end

---Create a new local player for this game, for cases like local multiplayer.
---@param WorldContextObject UObject
---@param UserId FPlatformUserId @The platform user id that should control the newly created player. A valude of PLATFRMUSERID_NONE specifies to use the next available ID
---@param bSpawnPlayerController? boolean @[default: true] Whether a player controller should be spawned immediately for this player. If false a player controller will not be created automatically until transition to the next map.
---@return APlayerController
function UGameplayStatics.CreatePlayerFromPlatformUser(WorldContextObject, UserId, bSpawnPlayerController) end

---Create a new, empty SaveGame object to set data on and then pass to SaveGameToSlot.
---@param SaveGameClass TSubclassOf<USaveGame>
---@return USaveGame
function UGameplayStatics.CreateSaveGameObject(SaveGameClass) end

---This function allows users to create Audio Components in advance of playback with settings specifically for non-spatialized,
---non-distance-attenuated sounds. Audio Components created using this function by default will not have Spatialization applied.
---                                              (by completing or stopping), or whether it can be reactivated
---@param WorldContextObject UObject
---@param Sound USoundBase @- Sound to create.
---@param VolumeMultiplier? number @[default: 1.000000] - A linear scalar multiplied with the volume, in order to make the sound louder or softer.
---@param PitchMultiplier? number @[default: 1.000000] - A linear scalar multiplied with the pitch.
---@param StartTime? number @[default: 0.000000] - How far into the sound to begin playback at
---@param ConcurrencySettings? USoundConcurrency @[default: None] - Override concurrency settings package to play sound with
---@param bPersistAcrossLevelTransition? boolean @[default: false]
---@param bAutoDestroy? boolean @[default: true] - Whether the returned audio component will be automatically cleaned up when the sound finishes
---@return UAudioComponent
function UGameplayStatics.CreateSound2D(WorldContextObject, Sound, VolumeMultiplier, PitchMultiplier, StartTime, ConcurrencySettings, bPersistAcrossLevelTransition, bAutoDestroy) end

---Deactivates a Reverb Effect that was applied outside of an Audio Volume
---@param WorldContextObject UObject
---@param TagName string @Tag associated with Reverb Effect to remove
function UGameplayStatics.DeactivateReverbEffect(WorldContextObject, TagName) end

---Delete a save game in a particular slot.
---@param SlotName string
---@param UserIndex integer
---@return boolean
function UGameplayStatics.DeleteGameInSlot(SlotName, UserIndex) end

---Transforms the given 2D UV coordinate into a 3D world-space point and direction.
---@param SceneCapture2D ASceneCapture2D
---@param TargetUV FVector2D
---@param WorldPosition FVector @[out]
---@param WorldDirection FVector @[out]
---@return boolean
function UGameplayStatics.DeprojectSceneCaptureToWorld(SceneCapture2D, TargetUV, WorldPosition, WorldDirection) end

---Transforms the given 2D screen space coordinate into a 3D world-space point and direction.
---@param Player APlayerController
---@param ScreenPosition FVector2D
---@param WorldPosition FVector @[out]
---@param WorldDirection FVector @[out]
---@return boolean
function UGameplayStatics.DeprojectScreenToWorld(Player, ScreenPosition, WorldPosition, WorldDirection) end

---See if a save game exists with the specified name.
---@param SlotName string
---@param UserIndex integer
---@return boolean
function UGameplayStatics.DoesSaveGameExist(SlotName, UserIndex) end

---Toggle live DVR streaming.
---@param Enable boolean
function UGameplayStatics.EnableLiveStreaming(Enable) end

---Try and find the UV for a collision impact. Note this ONLY works if 'Support UV From Hit Results' is enabled in Physics Settings.
---@param Hit FHitResult
---@param UVChannel integer
---@param UV FVector2D @[out]
---@return boolean
function UGameplayStatics.FindCollisionUV(Hit, UVChannel, UV) end

---Returns an Actor nearest to Origin from ActorsToCheck array.
---@param Origin FVector
---@param ActorsToCheck TArray<AActor>
---@param Distance number @[out]
---@return AActor
function UGameplayStatics.FindNearestActor(Origin, ActorsToCheck, Distance) end

---'Finish' spawning an actor.  This will run the construction script.
---@param Actor AActor
---@param SpawnTransform FTransform
---@param TransformScaleMethod? ESpawnActorScaleMethod @[default: MultiplyWithRoot]
---@return AActor
function UGameplayStatics.FinishSpawningActor(Actor, SpawnTransform, TransformScaleMethod) end

---Flushes level streaming in blocking fashion and returns when all sub-levels are loaded / visible / hidden
---@param WorldContextObject UObject
function UGameplayStatics.FlushLevelStreaming(WorldContextObject) end

---Returns time in seconds since the application was started. Unlike the other time functions this is accurate to the exact time this function is called instead of set once per frame.
---@param Seconds integer @[out]
---@param PartialSeconds number @[out]
function UGameplayStatics.GetAccurateRealTime(Seconds, PartialSeconds) end

---Get currently active Audio Spatialization Plugin name
---@param WorldContextObject UObject
---@return string
function UGameplayStatics.GetActiveSpatialPluginName(WorldContextObject) end

---Find the average location (centroid) of an array of Actors
---@param Actors TArray<AActor>
---@return FVector
function UGameplayStatics.GetActorArrayAverageLocation(Actors) end

---Bind the bounds of an array of Actors
---@param Actors TArray<AActor>
---@param bOnlyCollidingComponents boolean
---@param Center FVector @[out]
---@param BoxExtent FVector @[out]
function UGameplayStatics.GetActorArrayBounds(Actors, bOnlyCollidingComponents, Center, BoxExtent) end

---Find the first Actor in the world of the specified class.
---This is a slow operation, use with caution e.g. do not use every frame.
---@param WorldContextObject UObject
---@param ActorClass TSubclassOf<AActor>
---@return AActor
function UGameplayStatics.GetActorOfClass(WorldContextObject, ActorClass) end

---Find all Actors in the world of the specified class.
---This is a slow operation, use with caution e.g. do not use every frame.
---@param WorldContextObject UObject
---@param ActorClass TSubclassOf<AActor>
---@param OutActors TArray<AActor> @[out]
function UGameplayStatics.GetAllActorsOfClass(WorldContextObject, ActorClass, OutActors) end

---Find all Actors in the world of the specified class with the specified tag.
---This is a slow operation, use with caution e.g. do not use every frame.
---@param WorldContextObject UObject
---@param ActorClass TSubclassOf<AActor>
---@param Tag string
---@param OutActors TArray<AActor> @[out]
function UGameplayStatics.GetAllActorsOfClassWithTag(WorldContextObject, ActorClass, Tag, OutActors) end

---Find all Actors in the world with the specified interface.
---This is a slow operation, use with caution e.g. do not use every frame.
---@param WorldContextObject UObject
---@param Interface TSubclassOf<UInterface>
---@param OutActors TArray<AActor> @[out]
function UGameplayStatics.GetAllActorsWithInterface(WorldContextObject, Interface, OutActors) end

---Find all Actors in the world with the specified tag.
---This is a slow operation, use with caution e.g. do not use every frame.
---@param WorldContextObject UObject
---@param Tag string
---@param OutActors TArray<AActor> @[out]
function UGameplayStatics.GetAllActorsWithTag(WorldContextObject, Tag, OutActors) end

---Returns time in seconds since world was brought up for play, IS stopped when game pauses, NOT dilated/clamped.
---@param WorldContextObject UObject
---@return number
function UGameplayStatics.GetAudioTimeSeconds(WorldContextObject) end

---Get list of available Audio Spatialization Plugin names
---@param WorldContextObject UObject
---@return TArray<string>
function UGameplayStatics.GetAvailableSpatialPluginNames(WorldContextObject) end

---Finds and returns the position of the closest listener to the specified location
---@param WorldContextObject UObject
---@param Location FVector
---@param MaximumRange number
---@param bAllowAttenuationOverride boolean
---@param ListenerPosition FVector @[out]
---@return boolean
function UGameplayStatics.GetClosestListenerLocation(WorldContextObject, Location, MaximumRange, bAllowAttenuationOverride, ListenerPosition) end

---Get the name of the currently-open level.
---@param WorldContextObject UObject
---@param bRemovePrefixString? boolean @[default: true]
---@return string
function UGameplayStatics.GetCurrentLevelName(WorldContextObject, bRemovePrefixString) end

---Returns the highest priority reverb settings currently active from any source (Audio Volumes or manual settings).
---@param WorldContextObject UObject
---@return UReverbEffect
function UGameplayStatics.GetCurrentReverbEffect(WorldContextObject) end

---Returns the world rendering state
---@param WorldContextObject UObject
---@return boolean
function UGameplayStatics.GetEnableWorldRendering(WorldContextObject) end

---Returns the game instance object
---@param WorldContextObject UObject
---@return UGameInstance
function UGameplayStatics.GetGameInstance(WorldContextObject) end

---Returns the current GameModeBase or Null if it can't be retrieved, such as on the client
---@param WorldContextObject UObject
---@return AGameModeBase
function UGameplayStatics.GetGameMode(WorldContextObject) end

---Returns the current GameStateBase or Null if it can't be retrieved
---@param WorldContextObject UObject
---@return AGameStateBase
function UGameplayStatics.GetGameState(WorldContextObject) end

---Gets the current global time dilation.
---@param WorldContextObject UObject
---@return number
function UGameplayStatics.GetGlobalTimeDilation(WorldContextObject) end

---Find an option in the options string and return it as an integer.
---@param Options string
---@param Key string
---@param DefaultValue integer
---@return integer
function UGameplayStatics.GetIntOption(Options, Key, DefaultValue) end

---Break up a key=value pair into its key and value.
---@param Pair string
---@param Key string @[out]
---@param Value string @[out]
function UGameplayStatics.GetKeyValue(Pair, Key, Value) end

---Retrieves the max voice count currently used by the audio engine.
---@param WorldContextObject UObject
---@return integer
function UGameplayStatics.GetMaxAudioChannelCount(WorldContextObject) end

---Returns the number of fully initialized local players, this will be 0 on dedicated servers.
---Indexes up to this can be used as PlayerIndex parameters for the following functions, and you are guaranteed to get a local player controller.
---@param WorldContextObject UObject
---@return integer
function UGameplayStatics.GetNumLocalPlayerControllers(WorldContextObject) end

---Returns the total number of available player controllers, including remote players when called on a server.
---Indexes up to this can be used as PlayerIndex parameters for the following functions.
---@param WorldContextObject UObject
---@return integer
function UGameplayStatics.GetNumPlayerControllers(WorldContextObject) end

---Returns the number of active player states, there is one player state for every connected player even if they are a remote client.
---Indexes up to this can be use as PlayerStateIndex parameters for other functions.
---@param WorldContextObject UObject
---@return integer
function UGameplayStatics.GetNumPlayerStates(WorldContextObject) end

---Returns the class of a passed in Object, will always be valid if Object is not NULL
---@param Object UObject
---@return TSubclassOf<UObject>
function UGameplayStatics.GetObjectClass(Object) end

---Returns the string name of the current platform, to perform different behavior based on platform.
---(Platform names include Windows, Mac, Linux, IOS, Android, consoles, etc.).
---@return string
function UGameplayStatics.GetPlatformName() end

---Returns the camera manager for the Player Controller at the specified player index.
---This will not include remote clients with no player controller.
---@param WorldContextObject UObject
---@param PlayerIndex integer
---@return APlayerCameraManager
function UGameplayStatics.GetPlayerCameraManager(WorldContextObject, PlayerIndex) end

---Returns the pawn for the player controller at the specified player index, will return null if the pawn is not a character.
---This will not include characters of remote clients with no available player controller, you can iterate the PlayerStates list for that.
---@param WorldContextObject UObject
---@param PlayerIndex integer
---@return ACharacter
function UGameplayStatics.GetPlayerCharacter(WorldContextObject, PlayerIndex) end

---Returns the player controller found while iterating through the local and available remote player controllers.
---On a network client, this will only include local players as remote player controllers are not available.
---The index will be consistent as long as no new players join or leave, but it will not be the same across different clients and servers.
---@param WorldContextObject UObject
---@param PlayerIndex integer
---@return APlayerController
function UGameplayStatics.GetPlayerController(WorldContextObject, PlayerIndex) end

---Returns the player controller with the specified physical controller ID. This only works for local players.
---@param WorldContextObject UObject
---@param ControllerID integer
---@return APlayerController
function UGameplayStatics.GetPlayerControllerFromID(WorldContextObject, ControllerID) end

---Returns the player controller with the specified physical controller ID. This only works for local players.
---@param WorldContextObject UObject
---@param UserId FPlatformUserId
---@return APlayerController
function UGameplayStatics.GetPlayerControllerFromPlatformUser(WorldContextObject, UserId) end

---Gets what physical controller ID a player is using. This only works for local player controllers.
---@param Player APlayerController
---@return integer
function UGameplayStatics.GetPlayerControllerID(Player) end

---Returns the pawn for the player controller at the specified player index.
---This will not include pawns of remote clients with no available player controller, you can use the player states list for that.
---@param WorldContextObject UObject
---@param PlayerIndex integer
---@return APawn
function UGameplayStatics.GetPlayerPawn(WorldContextObject, PlayerIndex) end

---Returns the player state at the given index in the game state's PlayerArray.
---This will work on both the client and server and the index will be consistent.
---After initial replication, all clients and the server will have access to PlayerStates for all connected players.
---@param WorldContextObject UObject
---@param PlayerStateIndex integer
---@return APlayerState
function UGameplayStatics.GetPlayerState(WorldContextObject, PlayerStateIndex) end

---Returns the player state that matches the passed in online id, or null for an invalid one.
---This will work on both the client and server for local and remote players.
---@param WorldContextObject UObject
---@param UniqueId FUniqueNetIdRepl
---@return APlayerState
function UGameplayStatics.GetPlayerStateFromUniqueNetId(WorldContextObject, UniqueId) end

---Returns time in seconds since world was brought up for play, does NOT stop when game pauses, NOT dilated/clamped
---@param WorldContextObject UObject
---@return number
function UGameplayStatics.GetRealTimeSeconds(WorldContextObject) end

---Returns level streaming object with specified level package name
---@param WorldContextObject UObject
---@param PackageName string
---@return ULevelStreaming
function UGameplayStatics.GetStreamingLevel(WorldContextObject, PackageName) end

---Returns the EPhysicalSurface type of the given Hit.
---To edit surface type for your project, use ProjectSettings/Physics/PhysicalSurface section
---@param Hit FHitResult
---@return integer
function UGameplayStatics.GetSurfaceType(Hit) end

---Returns time in seconds since world was brought up for play, adjusted by time dilation and IS stopped when game pauses
---@param WorldContextObject UObject
---@return number
function UGameplayStatics.GetTimeSeconds(WorldContextObject) end

---Returns time in seconds since world was brought up for play, adjusted by time dilation and IS NOT stopped when game pauses
---@param WorldContextObject UObject
---@return number
function UGameplayStatics.GetUnpausedTimeSeconds(WorldContextObject) end

---Returns the current viewport mouse capture mode
---@param WorldContextObject UObject
---@return EMouseCaptureMode
function UGameplayStatics.GetViewportMouseCaptureMode(WorldContextObject) end

---Returns the View Matrix, Projection Matrix and the View x Projection Matrix for a given view
---@param DesiredView FMinimalViewInfo
---@param ViewMatrix FMatrix @[out]
---@param ProjectionMatrix FMatrix @[out]
---@param ViewProjectionMatrix FMatrix @[out]
function UGameplayStatics.GetViewProjectionMatrix(DesiredView, ViewMatrix, ProjectionMatrix, ViewProjectionMatrix) end

---Returns the frame delta time in seconds, adjusted by time dilation.
---@param WorldContextObject UObject
---@return number
function UGameplayStatics.GetWorldDeltaSeconds(WorldContextObject) end

---Returns world origin current location.
---@param WorldContextObject UObject
---@return FIntVector
function UGameplayStatics.GetWorldOriginLocation(WorldContextObject) end

---Counts how many grass foliage instances overlap a given sphere.
---@param WorldContextObject UObject
---@param StaticMesh UStaticMesh
---@param CenterPosition FVector
---@param Radius number
---@return integer
function UGameplayStatics.GrassOverlappingSphereCount(WorldContextObject, StaticMesh, CenterPosition, Radius) end

---Checks the commandline to see if the desired option was specified on the commandline (e.g. -demobuild)
---@param OptionToCheck string
---@return boolean
function UGameplayStatics.HasLaunchOption(OptionToCheck) end

---Returns whether a key exists in an options string.
---@param Options string
---@param InKey string
---@return boolean
function UGameplayStatics.HasOption(Options, InKey) end

---Determines if any local player controller's camera is within range of the specified location.
---@param WorldContextObject UObject
---@param Location FVector
---@param MaximumRange number
---@return boolean
function UGameplayStatics.IsAnyLocalPlayerCameraWithinRange(WorldContextObject, Location, MaximumRange) end

---Returns the game's paused state
---@param WorldContextObject UObject
---@return boolean
function UGameplayStatics.IsGamePaused(WorldContextObject) end

---Returns the split screen state
---@param WorldContextObject UObject
---@return boolean
function UGameplayStatics.IsSplitscreenForceDisabled(WorldContextObject) end

---Load the contents from a given slot.
---@param SlotName string
---@param UserIndex integer
---@return USaveGame
function UGameplayStatics.LoadGameFromSlot(SlotName, UserIndex) end

---Stream the level (by Name); Calling again before it finishes has no effect
---@param WorldContextObject UObject
---@param LevelName string
---@param bMakeVisibleAfterLoad boolean
---@param bShouldBlockOnLoad boolean
function UGameplayStatics.LoadStreamLevel(WorldContextObject, LevelName, bMakeVisibleAfterLoad, bShouldBlockOnLoad) end

---Stream the level (by Object Reference); Calling again before it finishes has no effect
---@param WorldContextObject UObject
---@param Level TSoftObjectPtr<UWorld>
---@param bMakeVisibleAfterLoad boolean
---@param bShouldBlockOnLoad boolean
function UGameplayStatics.LoadStreamLevelBySoftObjectPtr(WorldContextObject, Level, bMakeVisibleAfterLoad, bShouldBlockOnLoad) end

---Create a HitResult struct
---@param bBlockingHit boolean
---@param bInitialOverlap boolean @True if the hit started in an initial overlap. In this case some other values should be interpreted differently. Time will be 0, ImpactPoint will equal Location, and normals will be equal and indicate a depenetration vector.
---@param Time number
---@param Distance number
---@param Location FVector
---@param ImpactPoint FVector
---@param Normal FVector
---@param ImpactNormal FVector
---@param PhysMat UPhysicalMaterial
---@param HitActor AActor
---@param HitComponent UPrimitiveComponent
---@param HitBoneName string
---@param BoneName string
---@param HitItem integer
---@param ElementIndex integer
---@param FaceIndex integer
---@param TraceStart FVector
---@param TraceEnd FVector
---@return FHitResult
function UGameplayStatics.MakeHitResult(bBlockingHit, bInitialOverlap, Time, Distance, Location, ImpactPoint, Normal, ImpactNormal, PhysMat, HitActor, HitComponent, HitBoneName, BoneName, HitItem, ElementIndex, FaceIndex, TraceStart, TraceEnd) end

---Returns whether or not the object passed in is of (or inherits from) the class type.
---@param Object UObject
---@param ObjectClass TSubclassOf<UObject>
---@return boolean
function UGameplayStatics.ObjectIsA(Object, ObjectClass) end

---Travel to another level
---@param WorldContextObject UObject
---@param LevelName string
---@param bAbsolute? boolean @[default: true]
---@param Options string
function UGameplayStatics.OpenLevel(WorldContextObject, LevelName, bAbsolute, Options) end

---Travel to another level
---@param WorldContextObject UObject
---@param Level TSoftObjectPtr<UWorld>
---@param bAbsolute? boolean @[default: true]
---@param Options string
function UGameplayStatics.OpenLevelBySoftObjectPtr(WorldContextObject, Level, bAbsolute, Options) end

---Find an option in the options string and return it.
---@param Options string
---@param Key string
---@return string
function UGameplayStatics.ParseOption(Options, Key) end

---Plays a dialogue directly with no attenuation, perfect for UI.
---* Fire and Forget.
---* Not Replicated.
---@param WorldContextObject UObject
---@param Dialogue UDialogueWave @- dialogue to play
---@param Context FDialogueContext @- context the dialogue is to play in
---@param VolumeMultiplier? number @[default: 1.000000] - A linear scalar multiplied with the volume, in order to make the sound louder or softer.
---@param PitchMultiplier? number @[default: 1.000000] - A linear scalar multiplied with the pitch.
---@param StartTime? number @[default: 0.000000] - How far in to the dialogue to begin playback at
function UGameplayStatics.PlayDialogue2D(WorldContextObject, Dialogue, Context, VolumeMultiplier, PitchMultiplier, StartTime) end

---Plays a dialogue at the given location. This is a fire and forget sound and does not travel with any actor.
---    Replication is also not handled at this point.
---@param WorldContextObject UObject
---@param Dialogue UDialogueWave @- dialogue to play
---@param Context FDialogueContext @- context the dialogue is to play in
---@param Location FVector @- World position to play dialogue at
---@param Rotation FRotator @- World rotation to play dialogue at
---@param VolumeMultiplier? number @[default: 1.000000] - A linear scalar multiplied with the volume, in order to make the sound louder or softer.
---@param PitchMultiplier? number @[default: 1.000000] - A linear scalar multiplied with the pitch.
---@param StartTime? number @[default: 0.000000] - How far in to the dialogue to begin playback at
---@param AttenuationSettings? USoundAttenuation @[default: None] - Override attenuation settings package to play sound with
function UGameplayStatics.PlayDialogueAtLocation(WorldContextObject, Dialogue, Context, Location, Rotation, VolumeMultiplier, PitchMultiplier, StartTime, AttenuationSettings) end

---Plays a sound directly with no attenuation, perfect for UI sounds.
---* Fire and Forget.
---* Not Replicated.
---                                             Allows PlaySound calls to do a concurrency limit per owner.
---@param WorldContextObject UObject
---@param Sound USoundBase @- Sound to play.
---@param VolumeMultiplier? number @[default: 1.000000] - A linear scalar multiplied with the volume, in order to make the sound louder or softer.
---@param PitchMultiplier? number @[default: 1.000000] - A linear scalar multiplied with the pitch.
---@param StartTime? number @[default: 0.000000] - How far in to the sound to begin playback at
---@param ConcurrencySettings? USoundConcurrency @[default: None] - Override concurrency settings package to play sound with
---@param OwningActor? AActor @[default: None] - The actor to use as the "owner" for concurrency settings purposes.
---@param bIsUISound? boolean @[default: true] - True if sound is UI related, else false
function UGameplayStatics.PlaySound2D(WorldContextObject, Sound, VolumeMultiplier, PitchMultiplier, StartTime, ConcurrencySettings, OwningActor, bIsUISound) end

---Plays a sound at the given location. This is a fire and forget sound and does not travel with any actor.
---Replication is also not handled at this point.
---                                             to do a concurrency limit per owner.
---@param WorldContextObject UObject
---@param Sound USoundBase @- sound to play
---@param Location FVector @- World position to play sound at
---@param Rotation FRotator @- World rotation to play sound at
---@param VolumeMultiplier? number @[default: 1.000000] - A linear scalar multiplied with the volume, in order to make the sound louder or softer.
---@param PitchMultiplier? number @[default: 1.000000] - A linear scalar multiplied with the pitch.
---@param StartTime? number @[default: 0.000000] - How far in to the sound to begin playback at
---@param AttenuationSettings? USoundAttenuation @[default: None] - Override attenuation settings package to play sound with
---@param ConcurrencySettings? USoundConcurrency @[default: None] - Override concurrency settings package to play sound with
---@param OwningActor? AActor @[default: None] - The actor to use as the "owner" for concurrency settings purposes. Allows PlaySound calls
---@param InitialParams? UInitialActiveSoundParams @[default: None]
function UGameplayStatics.PlaySoundAtLocation(WorldContextObject, Sound, Location, Rotation, VolumeMultiplier, PitchMultiplier, StartTime, AttenuationSettings, ConcurrencySettings, OwningActor, InitialParams) end

---Plays an in-world camera shake that affects all nearby local players, with distance-based attenuation. Does not replicate.
---@param WorldContextObject UObject @- Object that we can obtain a world context from
---@param Shake TSubclassOf<UCameraShakeBase> @- Camera shake asset to use
---@param Epicenter FVector @- location to place the effect in world space
---@param InnerRadius number @- Cameras inside this radius are ignored
---@param OuterRadius number @- Cameras outside of InnerRadius and inside this are effected
---@param Falloff? number @[default: 1.000000] - Affects falloff of effect as it nears OuterRadius
---@param bOrientShakeTowardsEpicenter? boolean @[default: false] - Changes the rotation of shake to point towards epicenter instead of forward
function UGameplayStatics.PlayWorldCameraShake(WorldContextObject, Shake, Epicenter, InnerRadius, OuterRadius, Falloff, bOrientShakeTowardsEpicenter) end

---Pop a sound mix modifier from the audio system
---    @@param InSoundMixModifier The Sound Mix Modifier to remove from the system
---@param WorldContextObject UObject
---@param InSoundMixModifier USoundMix @The Sound Mix Modifier to remove from the system
function UGameplayStatics.PopSoundMixModifier(WorldContextObject, InSoundMixModifier) end

---Primes the sound waves in the given USoundClass, caching the first chunk of streamed audio.
---@param InSoundClass USoundClass
function UGameplayStatics.PrimeAllSoundsInSoundClass(InSoundClass) end

---Primes the sound, caching the first chunk of streamed audio.
---@param InSound USoundBase
function UGameplayStatics.PrimeSound(InSound) end

---Transforms the given 3D world-space point into a its 2D screen space coordinate.
---@param Player APlayerController
---@param WorldPosition FVector
---@param ScreenPosition FVector2D @[out]
---@param bPlayerViewportRelative? boolean @[default: false]
---@return boolean
function UGameplayStatics.ProjectWorldToScreen(Player, WorldPosition, ScreenPosition, bPlayerViewportRelative) end

---Push a sound mix modifier onto the audio system
---@param WorldContextObject UObject
---@param InSoundMixModifier USoundMix @The Sound Mix Modifier to add to the system
function UGameplayStatics.PushSoundMixModifier(WorldContextObject, InSoundMixModifier) end

---Returns origin based position for local world location.
---@param WorldContextObject UObject
---@param WorldLocation FVector
---@return FVector
function UGameplayStatics.RebaseLocalOriginOntoZero(WorldContextObject, WorldLocation) end

---Returns local location for origin based position.
---@param WorldContextObject UObject
---@param WorldLocation FVector
---@return FVector
function UGameplayStatics.RebaseZeroOriginOntoLocal(WorldContextObject, WorldLocation) end

---Removes a local player from this game.
---@param Player APlayerController
---@param bDestroyPawn boolean
function UGameplayStatics.RemovePlayer(Player, bDestroyPawn) end

---Save the contents of the SaveGameObject to a platform-specific save slot/file.
---@param SaveGameObject USaveGame
---@param SlotName string
---@param UserIndex integer
---@return boolean
function UGameplayStatics.SaveGameToSlot(SaveGameObject, SlotName, UserIndex) end

---Get list of available Audio Spatialization Plugins
---@param WorldContextObject UObject
---@param InPluginName string
---@return boolean
function UGameplayStatics.SetActiveSpatialPluginByName(WorldContextObject, InPluginName) end

---Set the sound mix of the audio system for special EQing
---@param WorldContextObject UObject
---@param InSoundMix USoundMix
function UGameplayStatics.SetBaseSoundMix(WorldContextObject, InSoundMix) end

---Enabled rendering of the world
---@param WorldContextObject UObject
---@param bEnable boolean
function UGameplayStatics.SetEnableWorldRendering(WorldContextObject, bEnable) end

---Enables split screen
---@param WorldContextObject UObject
---@param bDisable boolean
function UGameplayStatics.SetForceDisableSplitscreen(WorldContextObject, bDisable) end

---Sets the game's paused state
---@param WorldContextObject UObject
---@param bPaused boolean
---@return boolean
function UGameplayStatics.SetGamePaused(WorldContextObject, bPaused) end

---Sets the global listener focus parameters, which will scale focus behavior of sounds based on their focus azimuth
---settings in their attenuation settings.
---* Fire and Forget.
---* Not Replicated.
---                                                        distance to sounds, values > 1.0 will increase perceived distance to in-focus sounds.
---                                                               perceived distance to sounds, values > 1.0 will increase perceived distance to in-focus sounds.
---                                                        the priority of in-focus sounds, values > 1.0 will increase the priority of in-focus sounds.
---                                                               reduce the priority of sounds out-of-focus sounds, values > 1.0 will increase the priority of
---                                                               out-of-focus sounds.
---@param WorldContextObject UObject
---@param FocusAzimuthScale? number @[default: 1.000000] - An angle scale value used to scale the azimuth angle that defines where sounds are in-focus.
---@param NonFocusAzimuthScale? number @[default: 1.000000]
---@param FocusDistanceScale? number @[default: 1.000000] - A distance scale value to use for sounds which are in-focus. Values < 1.0 will reduce perceived
---@param NonFocusDistanceScale? number @[default: 1.000000] - A distance scale value to use for sounds which are out-of-focus. Values < 1.0 will reduce
---@param FocusVolumeScale? number @[default: 1.000000]
---@param NonFocusVolumeScale? number @[default: 1.000000]
---@param FocusPriorityScale? number @[default: 1.000000] - A priority scale value (> 0.0) to use for sounds which are in-focus. Values < 1.0 will reduce
---@param NonFocusPriorityScale? number @[default: 1.000000] - A priority scale value (> 0.0) to use for sounds which are out-of-focus. Values < 1.0 will
function UGameplayStatics.SetGlobalListenerFocusParameters(WorldContextObject, FocusAzimuthScale, NonFocusAzimuthScale, FocusDistanceScale, NonFocusDistanceScale, FocusVolumeScale, NonFocusVolumeScale, FocusPriorityScale, NonFocusPriorityScale) end

---Sets a global pitch modulation scalar that will apply to all non-UI sounds
---* Fire and Forget.
---* Not Replicated.
---@param WorldContextObject UObject
---@param PitchModulation number @- A pitch modulation value to globally set.
---@param TimeSec number @- A time value to linearly interpolate the global modulation pitch over from it's current value.
function UGameplayStatics.SetGlobalPitchModulation(WorldContextObject, PitchModulation, TimeSec) end

---Sets the global time dilation.
---@param WorldContextObject UObject
---@param TimeDilation number
function UGameplayStatics.SetGlobalTimeDilation(WorldContextObject, TimeDilation) end

---Sets the max number of voices (also known as "channels") dynamically by percentage. E.g. if you want to temporarily
---reduce voice count by 50%, use 0.50. Later, you can return to the original max voice count by using 1.0.
---@param WorldContextObject UObject
---@param MaxChannelCountScale number @The percentage of the original voice count to set the max number of voices to
function UGameplayStatics.SetMaxAudioChannelsScaled(WorldContextObject, MaxChannelCountScale) end

---Sets what physical controller ID a player should be using. This only works for local player controllers.
---@param Player APlayerController
---@param ControllerId integer
function UGameplayStatics.SetPlayerControllerID(Player, ControllerId) end

---Sets what platform user id a player should be using. This only works for local player controllers.
---@param PlayerController APlayerController
---@param UserId FPlatformUserId
function UGameplayStatics.SetPlayerPlatformUserId(PlayerController, UserId) end

---Linearly interpolates the attenuation distance scale value from it's current attenuation distance override value
---(1.0f it not overridden) to its new attenuation distance override, over the given amount of time
---* Fire and Forget.
---* Not Replicated.
---@param WorldContextObject UObject
---@param SoundClass USoundClass @- Sound class to to use to set the attenuation distance scale on.
---@param DistanceAttenuationScale number @- A scalar for the attenuation distance used for computing distance attenuation.
---@param TimeSec? number @[default: 0.000000] - A time value to linearly interpolate from the current distance attenuation scale value to the new value.
function UGameplayStatics.SetSoundClassDistanceScale(WorldContextObject, SoundClass, DistanceAttenuationScale, TimeSec) end

---Overrides the sound class adjuster in the given sound mix. If the sound class does not exist in the input sound mix,
---    the sound class adjuster will be added to the list of active sound mix modifiers.
---@param WorldContextObject UObject
---@param InSoundMixModifier USoundMix @The sound mix to modify.
---@param InSoundClass USoundClass @The sound class to override (or add) in the sound mix.
---@param Volume? number @[default: 1.000000] The volume scale to set the sound class adjuster to.
---@param Pitch? number @[default: 1.000000] The pitch scale to set the sound class adjuster to.
---@param FadeInTime? number @[default: 1.000000] The interpolation time to use to go from the current sound class adjuster values to the new values.
---@param bApplyToChildren? boolean @[default: true] Whether or not to apply this override to the sound class' children or to just the specified sound class.
function UGameplayStatics.SetSoundMixClassOverride(WorldContextObject, InSoundMixModifier, InSoundClass, Volume, Pitch, FadeInTime, bApplyToChildren) end

---Will set subtitles to be enabled or disabled.
---@param bEnabled boolean @will enable subtitle drawing if true, disable if false.
function UGameplayStatics.SetSubtitlesEnabled(bEnabled) end

---Sets the current viewport mouse capture mode
---@param WorldContextObject UObject
---@param MouseCaptureMode EMouseCaptureMode
function UGameplayStatics.SetViewportMouseCaptureMode(WorldContextObject, MouseCaptureMode) end

---Requests a new location for a world origin.
---@param WorldContextObject UObject
---@param NewLocation FIntVector
function UGameplayStatics.SetWorldOriginLocation(WorldContextObject, NewLocation) end

---Spawns a decal at the given location and rotation, fire and forget. Does not replicate.
---@param WorldContextObject UObject
---@param DecalMaterial UMaterialInterface @- decal's material
---@param DecalSize FVector @- size of decal
---@param Location FVector @- location to place the decal in world space
---@param Rotation? FRotator @[default: -90.000000,0.000000,0.000000] - rotation to place the decal in world space
---@param LifeSpan? number @[default: 0.000000] - destroy decal component after time runs out (0 = infinite)
---@return UDecalComponent
function UGameplayStatics.SpawnDecalAtLocation(WorldContextObject, DecalMaterial, DecalSize, Location, Rotation, LifeSpan) end

---Spawns a decal attached to and following the specified component. Does not replicate.
---@param DecalMaterial UMaterialInterface @- decal's material
---@param DecalSize FVector @- size of decal
---@param AttachToComponent USceneComponent
---@param AttachPointName? string @[default: None] - Optional named point within the AttachComponent to spawn the emitter at
---@param Location FVector @- Depending on the value of Location Type this is either a relative offset from the attach component/point or an absolute world position that will be translated to a relative offset
---@param Rotation FRotator @- Depending on the value of LocationType this is either a relative offset from the attach component/point or an absolute world rotation that will be translated to a realative offset
---@param LocationType? integer @[default: KeepRelativeOffset] - Specifies whether Location is a relative offset or an absolute world position
---@param LifeSpan? number @[default: 0.000000] - destroy decal component after time runs out (0 = infinite)
---@return UDecalComponent
function UGameplayStatics.SpawnDecalAttached(DecalMaterial, DecalSize, AttachToComponent, AttachPointName, Location, Rotation, LocationType, LifeSpan) end

---Spawns a DialogueWave, a special type of Asset that requires Context data in order to resolve a specific SoundBase,
---which is then passed on to the new Audio Component. Audio Components created using this function by default will not
---have Spatialization applied. Sound instances will begin playing upon spawning this Audio Component.
---* Not Replicated.
---                                              finishes (by completing or stopping) or whether it can be reactivated
---@param WorldContextObject UObject
---@param Dialogue UDialogueWave @- dialogue to play
---@param Context FDialogueContext @- context the dialogue is to play in
---@param VolumeMultiplier? number @[default: 1.000000] - A linear scalar multiplied with the volume, in order to make the sound louder or softer.
---@param PitchMultiplier? number @[default: 1.000000] - A linear scalar multiplied with the pitch.
---@param StartTime? number @[default: 0.000000] - How far in to the dialogue to begin playback at
---@param bAutoDestroy? boolean @[default: true] - Whether the returned audio component will be automatically cleaned up when the sound
---@return UAudioComponent
function UGameplayStatics.SpawnDialogue2D(WorldContextObject, Dialogue, Context, VolumeMultiplier, PitchMultiplier, StartTime, bAutoDestroy) end

---Spawns a DialogueWave, a special type of Asset that requires Context data in order to resolve a specific SoundBase,
---which is then passed on to the new Audio Component. This function allows users to create and play Audio Components at a
---specific World Location and Rotation. Useful for spatialized and/or distance-attenuated dialogue.
---                                             (by completing or stopping) or whether it can be reactivated
---@param WorldContextObject UObject
---@param Dialogue UDialogueWave @- Dialogue to play
---@param Context FDialogueContext @- Context the dialogue is to play in
---@param Location FVector @- World position to play dialogue at
---@param Rotation FRotator @- World rotation to play dialogue at
---@param VolumeMultiplier? number @[default: 1.000000] - A linear scalar multiplied with the volume, in order to make the sound louder or softer.
---@param PitchMultiplier? number @[default: 1.000000] - A linear scalar multiplied with the pitch.
---@param StartTime? number @[default: 0.000000] - How far into the dialogue to begin playback at
---@param AttenuationSettings? USoundAttenuation @[default: None] - Override attenuation settings package to play sound with
---@param bAutoDestroy? boolean @[default: true] - Whether the returned audio component will be automatically cleaned up when the sound finishes
---@return UAudioComponent
function UGameplayStatics.SpawnDialogueAtLocation(WorldContextObject, Dialogue, Context, Location, Rotation, VolumeMultiplier, PitchMultiplier, StartTime, AttenuationSettings, bAutoDestroy) end

---Spawns a DialogueWave, a special type of Asset that requires Context data in order to resolve a specific SoundBase,
---    which is then passed on to the new Audio Component. This function allows users to create and play Audio Components
---    attached to a specific Scene Component. Useful for spatialized and/or distance-attenuated dialogue that needs to
---    follow another object in space.
---                                     attach component/point or an absolute world position that will be translated to a relative offset
---                                     attach component/point or an absolute world rotation that will be translated to a relative offset
---                                                                             to is destroyed.
---                                             (by completing or stopping) or whether it can be reactivated
---@param Dialogue UDialogueWave @- dialogue to play
---@param Context FDialogueContext @- context the dialogue is to play in
---@param AttachToComponent USceneComponent
---@param AttachPointName? string @[default: None] - Optional named point within the AttachComponent to play the sound at
---@param Location FVector @- Depending on the value of Location Type this is either a relative offset from the
---@param Rotation FRotator @- Depending on the value of Location Type this is either a relative offset from the
---@param LocationType? integer @[default: KeepRelativeOffset] - Specifies whether Location is a relative offset or an absolute world position
---@param bStopWhenAttachedToDestroyed? boolean @[default: false] - Specifies whether the sound should stop playing when the owner its attached
---@param VolumeMultiplier? number @[default: 1.000000] - A linear scalar multiplied with the volume, in order to make the sound louder or softer.
---@param PitchMultiplier? number @[default: 1.000000] - A linear scalar multiplied with the pitch.
---@param StartTime? number @[default: 0.000000] - How far in to the dialogue to begin playback at
---@param AttenuationSettings? USoundAttenuation @[default: None] - Override attenuation settings package to play sound with
---@param bAutoDestroy? boolean @[default: true] - Whether the returned audio component will be automatically cleaned up when the sound finishes
---@return UAudioComponent
function UGameplayStatics.SpawnDialogueAttached(Dialogue, Context, AttachToComponent, AttachPointName, Location, Rotation, LocationType, bStopWhenAttachedToDestroyed, VolumeMultiplier, PitchMultiplier, StartTime, AttenuationSettings, bAutoDestroy) end

---Plays the specified effect at the given location and rotation, fire and forget. The system will go away when the effect is complete. Does not replicate.
---@param WorldContextObject UObject @- Object that we can obtain a world context from
---@param EmitterTemplate UParticleSystem @- particle system to create
---@param Location FVector @- location to place the effect in world space
---@param Rotation FRotator @- rotation to place the effect in world space
---@param Scale? FVector @[default: 1.000000,1.000000,1.000000] - scale to create the effect at
---@param bAutoDestroy? boolean @[default: true] - Whether the component will automatically be destroyed when the particle system completes playing or whether it can be reactivated
---@param PoolingMethod? EPSCPoolMethod @[default: None] - Method used for pooling this component. Defaults to none.
---@param bAutoActivateSystem? boolean @[default: true]
---@return UParticleSystemComponent
function UGameplayStatics.SpawnEmitterAtLocation(WorldContextObject, EmitterTemplate, Location, Rotation, Scale, bAutoDestroy, PoolingMethod, bAutoActivateSystem) end

---Plays the specified effect attached to and following the specified component. The system will go away when the effect is complete. Does not replicate.
---@param EmitterTemplate UParticleSystem @- particle system to create
---@param AttachToComponent USceneComponent
---@param AttachPointName? string @[default: None] - Optional named point within the AttachComponent to spawn the emitter at
---@param Location FVector @- Depending on the value of LocationType this is either a relative offset from the attach component/point or an absolute world location that will be translated to a relative offset (if LocationType is KeepWorldPosition).
---@param Rotation FRotator @- Depending on the value of LocationType this is either a relative offset from the attach component/point or an absolute world rotation that will be translated to a relative offset (if LocationType is KeepWorldPosition).
---@param Scale? FVector @[default: 1.000000,1.000000,1.000000] - Depending on the value of LocationType this is either a relative scale from the attach component or an absolute world scale that will be translated to a relative scale (if LocationType is KeepWorldPosition).
---@param LocationType? integer @[default: KeepRelativeOffset] - Specifies whether Location is a relative offset or an absolute world position
---@param bAutoDestroy? boolean @[default: true] - Whether the component will automatically be destroyed when the particle system completes playing or whether it can be reactivated
---@param PoolingMethod? EPSCPoolMethod @[default: None] - Method used for pooling this component. Defaults to none.
---@param bAutoActivate? boolean @[default: true] - Whether the component will be automatically activated on creation.
---@return UParticleSystemComponent
function UGameplayStatics.SpawnEmitterAttached(EmitterTemplate, AttachToComponent, AttachPointName, Location, Rotation, Scale, LocationType, bAutoDestroy, PoolingMethod, bAutoActivate) end

---Plays a force feedback effect at the given location. This is a fire and forget effect and does not travel with any actor. Replication is also not handled at this point.
---@param WorldContextObject UObject
---@param ForceFeedbackEffect UForceFeedbackEffect @- effect to play
---@param Location FVector @- World position to center the effect at
---@param Rotation FRotator @- World rotation to center the effect at
---@param bLooping? boolean @[default: false]
---@param IntensityMultiplier? number @[default: 1.000000] - Intensity multiplier
---@param StartTime? number @[default: 0.000000] - How far in to the feedback effect to begin playback at
---@param AttenuationSettings? UForceFeedbackAttenuation @[default: None] - Override attenuation settings package to play effect with
---@param bAutoDestroy? boolean @[default: true] - Whether the returned force feedback component will be automatically cleaned up when the feedback pattern finishes (by completing or stopping) or whether it can be reactivated
---@return UForceFeedbackComponent
function UGameplayStatics.SpawnForceFeedbackAtLocation(WorldContextObject, ForceFeedbackEffect, Location, Rotation, bLooping, IntensityMultiplier, StartTime, AttenuationSettings, bAutoDestroy) end

---Plays a force feedback effect attached to and following the specified component. This is a fire and forget effect. Replication is also not handled at this point.
---@param ForceFeedbackEffect UForceFeedbackEffect @- effect to play
---@param AttachToComponent USceneComponent
---@param AttachPointName? string @[default: None] - Optional named point within the AttachComponent to attach to
---@param Location FVector @- Depending on the value of Location Type this is either a relative offset from the attach component/point or an absolute world position that will be translated to a relative offset
---@param Rotation FRotator @- Depending on the value of Location Type this is either a relative offset from the attach component/point or an absolute world rotation that will be translated to a relative offset
---@param LocationType? integer @[default: KeepRelativeOffset] - Specifies whether Location is a relative offset or an absolute world position
---@param bStopWhenAttachedToDestroyed? boolean @[default: false] - Specifies whether the feedback effect should stop playing when the owner of the attach to component is destroyed.
---@param bLooping? boolean @[default: false]
---@param IntensityMultiplier? number @[default: 1.000000] - Intensity multiplier
---@param StartTime? number @[default: 0.000000] - How far in to the feedback effect to begin playback at
---@param AttenuationSettings? UForceFeedbackAttenuation @[default: None] - Override attenuation settings package to play effect with
---@param bAutoDestroy? boolean @[default: true] - Whether the returned force feedback component will be automatically cleaned up when the feedback patern finishes (by completing or stopping) or whether it can be reactivated
---@return UForceFeedbackComponent
function UGameplayStatics.SpawnForceFeedbackAttached(ForceFeedbackEffect, AttachToComponent, AttachPointName, Location, Rotation, LocationType, bStopWhenAttachedToDestroyed, bLooping, IntensityMultiplier, StartTime, AttenuationSettings, bAutoDestroy) end

------ Create Object
---@param ObjectClass TSubclassOf<UObject>
---@param Outer UObject
---@return UObject
function UGameplayStatics.SpawnObject(ObjectClass, Outer) end

---This function allows users to create Audio Components with settings specifically for non-spatialized,
---non-distance-attenuated sounds. Audio Components created using this function by default will not have
---Spatialization applied. Sound instances will begin playing upon spawning this Audio Component.
---* Not Replicated.
---                                              (by completing or stopping) or whether it can be reactivated
---@param WorldContextObject UObject
---@param Sound USoundBase @- Sound to play.
---@param VolumeMultiplier? number @[default: 1.000000] - A linear scalar multiplied with the volume, in order to make the sound louder or softer.
---@param PitchMultiplier? number @[default: 1.000000] - A linear scalar multiplied with the pitch.
---@param StartTime? number @[default: 0.000000] - How far in to the sound to begin playback at
---@param ConcurrencySettings? USoundConcurrency @[default: None] - Override concurrency settings package to play sound with
---@param bPersistAcrossLevelTransition? boolean @[default: false]
---@param bAutoDestroy? boolean @[default: true] - Whether the returned audio component will be automatically cleaned up when the sound finishes
---@return UAudioComponent
function UGameplayStatics.SpawnSound2D(WorldContextObject, Sound, VolumeMultiplier, PitchMultiplier, StartTime, ConcurrencySettings, bPersistAcrossLevelTransition, bAutoDestroy) end

---Spawns a sound at the given location. This does not travel with any actor. Replication is also not handled at this point.
---                                              (by completing or stopping) or whether it can be reactivated
---@param WorldContextObject UObject
---@param Sound USoundBase @- sound to play
---@param Location FVector @- World position to play sound at
---@param Rotation FRotator @- World rotation to play sound at
---@param VolumeMultiplier? number @[default: 1.000000] - A linear scalar multiplied with the volume, in order to make the sound louder or softer.
---@param PitchMultiplier? number @[default: 1.000000] - A linear scalar multiplied with the pitch.
---@param StartTime? number @[default: 0.000000] - How far in to the sound to begin playback at
---@param AttenuationSettings? USoundAttenuation @[default: None] - Override attenuation settings package to play sound with
---@param ConcurrencySettings? USoundConcurrency @[default: None] - Override concurrency settings package to play sound with
---@param bAutoDestroy? boolean @[default: true] - Whether the returned audio component will be automatically cleaned up when the sound finishes
---@return UAudioComponent
function UGameplayStatics.SpawnSoundAtLocation(WorldContextObject, Sound, Location, Rotation, VolumeMultiplier, PitchMultiplier, StartTime, AttenuationSettings, ConcurrencySettings, bAutoDestroy) end

---This function allows users to create and play Audio Components attached to a specific Scene Component.
---Useful for spatialized and/or distance-attenuated sounds that need to follow another object in space.
---                                     the attach component/point or an absolute world position that will be translated to a relative offset
---                                     the attach component/point or an absolute world rotation that will be translated to a relative offset
---                                                                             owner of the attach to component is destroyed.
---                                             (by completing or stopping) or whether it can be reactivated
---@param Sound USoundBase @- sound to play
---@param AttachToComponent USceneComponent
---@param AttachPointName? string @[default: None] - Optional named point within the AttachComponent to play the sound at
---@param Location FVector @- Depending on the value of Location Type this is either a relative offset from
---@param Rotation FRotator @- Depending on the value of Location Type this is either a relative offset from
---@param LocationType? integer @[default: KeepRelativeOffset] - Specifies whether Location is a relative offset or an absolute world position
---@param bStopWhenAttachedToDestroyed? boolean @[default: false] - Specifies whether the sound should stop playing when the
---@param VolumeMultiplier? number @[default: 1.000000] - A linear scalar multiplied with the volume, in order to make the sound louder or softer.
---@param PitchMultiplier? number @[default: 1.000000] - A linear scalar multiplied with the pitch.
---@param StartTime? number @[default: 0.000000] - How far in to the sound to begin playback at
---@param AttenuationSettings? USoundAttenuation @[default: None] - Override attenuation settings package to play sound with
---@param ConcurrencySettings? USoundConcurrency @[default: None] - Override concurrency settings package to play sound with
---@param bAutoDestroy? boolean @[default: true] - Whether the returned audio component will be automatically cleaned up when the sound finishes
---@return UAudioComponent
function UGameplayStatics.SpawnSoundAttached(Sound, AttachToComponent, AttachPointName, Location, Rotation, LocationType, bStopWhenAttachedToDestroyed, VolumeMultiplier, PitchMultiplier, StartTime, AttenuationSettings, ConcurrencySettings, bAutoDestroy) end

---Returns the launch velocity needed for a projectile at rest at StartPos to land on EndPos.
---Assumes a medium arc (e.g. 45 deg on level ground). Projectile velocity is variable and unconstrained.
---Does no tracing.
---@param WorldContextObject UObject
---@param OutLaunchVelocity FVector @[out]
---@param StartPos FVector
---@param EndPos FVector
---@param OverrideGravityZ? number @[default: 0.000000]
---@param ArcParam? number @[default: 0.500000]
---@return boolean
function UGameplayStatics.SuggestProjectileVelocity_CustomArc(WorldContextObject, OutLaunchVelocity, StartPos, EndPos, OverrideGravityZ, ArcParam) end

---Returns a launch velocity need for a projectile to hit the TargetActor in TimeToTarget seconds based on the TargetActor's current velocity.
---This assumes the projectile is only accelerated by gravity (i.e. no outside forces), and that the TargetActor is moving at a constant velocity.
---@param WorldContextObject UObject
---@param OutLaunchVelocity FVector @[out]
---@param ProjectileStartLocation FVector
---@param TargetActor AActor
---@param TargetLocationOffset FVector
---@param GravityZOverride? number @[default: 0.000000]
---@param TimeToTarget? number @[default: 1.000000]
---@param DrawDebugType? integer @[default: Type::None]
---@param DrawDebugTime? number @[default: 3.000000]
---@param DrawDebugColor? FLinearColor @[default: (R=1.000000,G=0.000000,B=0.000000,A=1.000000)]
---@return boolean
function UGameplayStatics.SuggestProjectileVelocity_MovingTarget(WorldContextObject, OutLaunchVelocity, ProjectileStartLocation, TargetActor, TargetLocationOffset, GravityZOverride, TimeToTarget, DrawDebugType, DrawDebugTime, DrawDebugColor) end

---Unload a streamed in level (by Name)
---@param WorldContextObject UObject
---@param LevelName string
---@param bShouldBlockOnUnload boolean
function UGameplayStatics.UnloadStreamLevel(WorldContextObject, LevelName, bShouldBlockOnUnload) end

---Unload a streamed in level (by Object Reference)
---@param WorldContextObject UObject
---@param Level TSoftObjectPtr<UWorld>
---@param bShouldBlockOnUnload boolean
function UGameplayStatics.UnloadStreamLevelBySoftObjectPtr(WorldContextObject, Level, bShouldBlockOnUnload) end

---Iterate through all sound waves and releases handles to retained chunks. (If the chunk is not being played it will be up for eviction)
---@param InSoundClass USoundClass
function UGameplayStatics.UnRetainAllSoundsInSoundClass(InSoundClass) end

