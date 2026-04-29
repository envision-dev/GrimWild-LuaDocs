---PlayerControllers are used by human players to control Pawns.
---ControlRotation (accessed via GetControlRotation()), determines the aiming
---orientation of the controlled Pawn.
---In networked games, PlayerControllers exist on the server for every player-controlled pawn,
---and also on the controlling client's machine. They do NOT exist on a client's
---machine for pawns controlled by remote players elsewhere on the network.
---@class APlayerController : AController
---@field public Player UPlayer @UPlayer associated with this PlayerController.  Could be a local player or a net connection.
---@field public AcknowledgedPawn APawn @Used in net games so client can acknowledge it possessed a specific pawn.
---@field public MyHUD AHUD @Heads up display associated with this PlayerController.
---@field public PlayerCameraManager APlayerCameraManager @Camera manager associated with this Player Controller.
---@field public PlayerCameraManagerClass TSubclassOf<APlayerCameraManager> @PlayerCamera class should be set for each game, otherwise Engine.PlayerCameraManager is used
---@field public bAutoManageActiveCameraTarget boolean @True to allow this player controller to manage the camera target for you, typically by using the possessed pawn as the camera target. Set to false if you want to manually control the camera target.
---@field public TargetViewRotation FRotator @Used to replicate the view rotation of targets not owned/possessed by this PlayerController.
---@field public SmoothTargetViewRotationSpeed number @Interp speed for blending remote view rotation for smoother client updates
---@field public HiddenActors TArray<AActor> @The actors which the camera shouldn't see - e.g. used to hide actors which the camera penetrates
---@field public HiddenPrimitiveComponents TArray<TWeakObjectPtr<UPrimitiveComponent>> @Explicit components the camera shouldn't see (helpful for external systems to hide a component from a single player)
---@field public LastSpectatorStateSynchTime number @Used to make sure the client is kept synchronized when in a spectator state
---@field public LastSpectatorSyncLocation FVector @Last location synced on the server for a spectator.
---@field public LastSpectatorSyncRotation FRotator @Last rotation synced on the server for a spectator.
---@field public ClientCap integer @Cap set by server on bandwidth from client to server in bytes/sec (only has impact if >=2600)
---@field public CheatManager UCheatManager @Object that manages "cheat" commands. By default:       - In Shipping configurations, the manager is always disabled because UE_WITH_CHEAT_MANAGER is 0   - When playing in the editor, cheats are always enabled   - In other cases, cheats are enabled by default in single player games but can be forced on with the EnableCheats console command This behavior can be changed either by overriding APlayerController::EnableCheats or AGameModeBase::AllowCheats.
---@field public CheatClass TSubclassOf<UCheatManager> @Class of my CheatManager.
---@field public PlayerInput UPlayerInput @Object that manages player input.
---@field public ActiveForceFeedbackEffects TArray<FActiveForceFeedbackEffect>
---@field private AsyncPhysicsDataComponent_DEPRECARED UAsyncPhysicsInputComponent
---@field public bPlayerIsWaiting boolean @True if PlayerController is currently waiting for the match to start or to respawn. Only valid in Spectating state.
---@field public NetPlayerIndex integer @Index identifying players using the same base connection (splitscreen clients) Used by netcode to match replicated PlayerControllers to the correct splitscreen viewport and child connection replicated via special internal code, not through normal variable replication
---@field public PendingSwapConnection UNetConnection @This is set on the OLD PlayerController when performing a swap over a network connection so we know what connection we're waiting on acknowledgment from to finish destroying this PC (or when the connection is closed)
---@field public NetConnection UNetConnection @The net connection this controller is communicating on, nullptr for local players on server
---@field public bShowMouseCursor boolean @Whether the mouse cursor should be displayed.
---@field public bEnableClickEvents boolean @Whether actor/component click events should be generated.
---@field public bEnableTouchEvents boolean @Whether actor/component touch events should be generated.
---@field public bEnableMouseOverEvents boolean @Whether actor/component mouse over events should be generated.
---@field public bEnableTouchOverEvents boolean @Whether actor/component touch over events should be generated.
---@field public bForceFeedbackEnabled boolean
---@field public bEnableMotionControls boolean @Whether or not to consider input from motion sources (tilt, acceleration, etc)
---@field public bEnableStreamingSource boolean @Whether the PlayerController should be used as a World Partiton streaming source.
---@field public bStreamingSourceShouldActivate boolean @Whether the PlayerController streaming source should activate cells after loading.
---@field public bStreamingSourceShouldBlockOnSlowStreaming boolean @Whether the PlayerController streaming source should block on slow streaming.
---@field public StreamingSourcePriority EStreamingSourcePriority @PlayerController streaming source priority.
---@field public StreamingSourceDebugColor FColor @Color used for debugging.
---@field public StreamingSourceShapes TArray<FStreamingSourceShape> @Optional aggregated shape list used to build a custom shape for the streaming source. When empty, fallbacks sphere shape with a radius equal to grid's loading range.
---@field public ForceFeedbackScale number @Scale applied to force feedback values
---@field public ClickEventKeys TArray<FKey> @List of keys that will cause click events to be forwarded, default to left click
---@field public DefaultMouseCursor integer @Type of mouse cursor to show by default
---@field public CurrentMouseCursor integer @Currently visible mouse cursor
---@field public DefaultClickTraceChannel integer @Default trace channel used for determining what world object was clicked on.
---@field public CurrentClickTraceChannel integer @Trace channel currently being used for determining what world object was clicked on.
---@field public HitResultTraceDistance number @Distance to trace when computing click events
---@field public SeamlessTravelCount integer @Counter for this players seamless travels (used along with the below value, to restrict ServerNotifyLoadedWorld)
---@field public LastCompletedSeamlessTravelCount integer @The value of SeamlessTravelCount, upon the last call to GameModeBase::HandleSeamlessTravelPlayer; used to detect seamless travel
---@field protected InactiveStateInputComponent UInputComponent @InputComponent we use when player is in Inactive state.
---@field protected bShouldPerformFullTickWhenPaused boolean @Whether we fully tick when the game is paused, if our tick function is allowed to do so. If false, we do a minimal update during the tick.
---@field protected CurrentTouchInterface UTouchInterface @The currently set touch interface
---@field protected OverridePlayerInputClass TSubclassOf<UPlayerInput> @If set, then this UPlayerInput class will be used instead of the Input Settings' DefaultPlayerInputClass
---@field private SpectatorPawn ASpectatorPawn @The pawn used when spectating (nullptr if not spectating).
---@field private bIsLocalPlayerController boolean @Set during SpawnActor once and never again to indicate the intent of this controller instance (SERVER ONLY)
---@field protected SpawnLocation FVector @The location used internally when there is no pawn or spectator, to know where to spawn the spectator or focus the camera on death.
APlayerController = {}

---Activates a new touch interface for this player controller
---@param NewTouchInterface UTouchInterface
function APlayerController:ActivateTouchInterface(NewTouchInterface) end

---Add Pitch (look up) input. This value is multiplied by InputPitchScale.
---@param Val number @Amount to add to Pitch. This value is multiplied by InputPitchScale.
function APlayerController:AddPitchInput(Val) end

---Add Roll input. This value is multiplied by InputRollScale.
---@param Val number @Amount to add to Roll. This value is multiplied by InputRollScale.
function APlayerController:AddRollInput(Val) end

---Add Yaw (turn) input. This value is multiplied by InputYawScale.
---@param Val number @Amount to add to Yaw. This value is multiplied by InputYawScale.
function APlayerController:AddYawInput(Val) end

---Change Camera mode
---@param NewMode string
function APlayerController:Camera(NewMode) end

---Returns true if this controller thinks it's able to restart. Called from GameModeBase::PlayerCanRestart
---@return boolean
function APlayerController:CanRestartPlayer() end

function APlayerController:ClearAudioListenerAttenuationOverride() end

---Clear any overrides that have been applied to audio listener
function APlayerController:ClearAudioListenerOverride() end

---@param TimeDilation number
---@param ServerStep integer
function APlayerController:ClientAckTimeDilation(TimeDilation, ServerStep) end

---Acknowledge received LevelVisibilityTransactionId
---@param PackageName string @- Identifying the level that we are acknowledging levelvisibility for
---@param TransactionId FNetLevelVisibilityTransactionId @- TransactionId being acknowledged
---@param bClientAckCanMakeVisible boolean
function APlayerController:ClientAckUpdateLevelVisibility(PackageName, TransactionId, bClientAckCanMakeVisible) end

---Adds a location to the texture streaming system for the specified duration.
---@param InLoc FVector
---@param Duration number
---@param bOverrideLocation boolean
function APlayerController:ClientAddTextureStreamingLoc(InLoc, Duration, bOverrideLocation) end

---Tells client to cancel any pending map change.
function APlayerController:ClientCancelPendingMapChange() end

---Set CurrentNetSpeed to the lower of its current value and Cap.
---@param Cap integer
function APlayerController:ClientCapBandwidth(Cap) end

---Removes all Camera Lens Effects.
function APlayerController:ClientClearCameraLensEffects() end

---Actually performs the level transition prepared by PrepareMapChange().
function APlayerController:ClientCommitMapChange() end

---@param Timestamp FAsyncPhysicsTimestamp
function APlayerController:ClientCorrectionAsyncPhysicsTimestamp(Timestamp) end

---Tell the client to enable or disable voice chat (not muting)
---@param bEnable boolean @enable or disable voice chat
function APlayerController:ClientEnableNetworkVoice(bEnable) end

---Notify client that the session is about to start
function APlayerController:ClientEndOnlineSession() end

---Tells the client to block until all pending level streaming actions are complete
---happens at the end of the tick
---primarily used to force update the client ASAP at join time
function APlayerController:ClientFlushLevelStreaming() end

---Forces GC at the end of the tick on the client
function APlayerController:ClientForceGarbageCollection() end

---Replicated function called by GameHasEnded().
---@param EndGameFocus AActor @- actor to view with camera
---@param bIsWinner boolean @- true if this controller is on winning team
function APlayerController:ClientGameEnded(EndGameFocus, bIsWinner) end

---Server uses this to force client into NewState .
---@param NewState string
function APlayerController:ClientGotoState(NewState) end

---Calls IgnoreLookInput on client
---@param bIgnore boolean
function APlayerController:ClientIgnoreLookInput(bIgnore) end

---Calls IgnoreMoveInput on client
---@param bIgnore boolean
function APlayerController:ClientIgnoreMoveInput(bIgnore) end

---Outputs a message to HUD
---@param S string @- message to display
---@param Type string @- @todo document
---@param MsgLifeTime number @- Optional length of time to display 0 = default time
function APlayerController:ClientMessage(S, Type, MsgLifeTime) end

---Tell the client to mute a player for this controller
---@param PlayerId FUniqueNetIdRepl @player id to mute
function APlayerController:ClientMutePlayer(PlayerId) end

---Internal replicated version of client play force feedback event.
---Cannot be named ClientPlayForceFeedback as redirector for blueprint function version to K2_... does not work in that case
---@param ForceFeedbackEffect UForceFeedbackEffect
---@param Params FForceFeedbackParameters
function APlayerController:ClientPlayForceFeedback_Internal(ForceFeedbackEffect, Params) end

---Play sound client-side (so only the client will hear it)
---@param Sound USoundBase
---@param VolumeMultiplier number @- Volume multiplier to apply to the sound
---@param PitchMultiplier number @- Pitch multiplier to apply to the sound
function APlayerController:ClientPlaySound(Sound, VolumeMultiplier, PitchMultiplier) end

---Play sound client-side at the specified location
---@param Sound USoundBase
---@param Location FVector @- Location to play the sound at
---@param VolumeMultiplier number @- Volume multiplier to apply to the sound
---@param PitchMultiplier number @- Pitch multiplier to apply to the sound
function APlayerController:ClientPlaySoundAtLocation(Sound, Location, VolumeMultiplier, PitchMultiplier) end

---Asynchronously loads the given level in preparation for a streaming map transition.
---the server sends one function per level name since dynamic arrays can't be replicated
---@param LevelName string
---@param bFirst boolean @- whether this is the first item in the list (so clear the list first)
---@param bLast boolean @- whether this is the last item in the list (so start preparing the change after receiving it)
function APlayerController:ClientPrepareMapChange(LevelName, bFirst, bLast) end

---Forces the streaming system to disregard the normal logic for the specified duration and
---instead always load all mip-levels for all textures used by the specified actor.
---@param ForcedActor AActor
---@param ForceDuration number
---@param bEnableStreaming boolean
---@param CinematicTextureGroups integer
function APlayerController:ClientPrestreamTextures(ForcedActor, ForceDuration, bEnableStreaming, CinematicTextureGroups) end

---send client localized message id
---@param Message TSubclassOf<ULocalMessage>
---@param Switch integer
---@param RelatedPlayerState_1 APlayerState
---@param RelatedPlayerState_2 APlayerState
---@param OptionalObject UObject
function APlayerController:ClientReceiveLocalizedMessage(Message, Switch, RelatedPlayerState_1, RelatedPlayerState_2, OptionalObject) end

---We call this in ::SendClientAdjustment to tell the client what the last processed input frame was for it and on what local frame number it was processed
---@param LastProcessedInputFrame integer
---@param RecvServerFrameNumber integer
---@param TimeDilation integer
function APlayerController:ClientRecvServerAckFrame(LastProcessedInputFrame, RecvServerFrameNumber, TimeDilation) end

---@param NumBuffered integer
---@param TargetNumBufferedCmds number
function APlayerController:ClientRecvServerAckFrameDebug(NumBuffered, TargetNumBufferedCmds) end

---Development RPC for testing object reference replication
---@param Object UObject
function APlayerController:ClientRepObjRef(Object) end

---Tell client to reset the PlayerController
function APlayerController:ClientReset() end

---Tell client to restart the level
---@param NewPawn APawn
function APlayerController:ClientRestart(NewPawn) end

---Assign Pawn to player, but avoid calling ClientRestart if we have already accepted this pawn
---@param NewPawn APawn
function APlayerController:ClientRetryClientRestart(NewPawn) end

---Return the client to the main menu gracefully
---@param ReturnReason string
function APlayerController:ClientReturnToMainMenuWithTextReason(ReturnReason) end

---Tells the client to block until all pending level streaming actions are complete.
---Happens at the end of the tick primarily used to force update the client ASAP at join time.
function APlayerController:ClientSetBlockOnAsyncLoading() end

---Tell client to fade camera
---@param bEnableFading boolean @- true if we should apply FadeColor/FadeAmount to the screen
---@param FadeColor FColor @- Color to fade to
---@param FadeAlpha FVector2D @- Contains the start fade (X) and end fade (Y) values to apply. A start fade of less than 0 will use the screen's current fade value
---@param FadeTime number @- length of time for fade to occur over
---@param bFadeAudio boolean @- true to apply fading of audio alongside the video
---@param bHoldWhenFinished boolean @- True for fade to hold at the ToAlpha until fade is disabled
function APlayerController:ClientSetCameraFade(bEnableFading, FadeColor, FadeAlpha, FadeTime, bFadeAudio, bHoldWhenFinished) end

---Replicated function to set camera style on client
---@param NewCamMode string
function APlayerController:ClientSetCameraMode(NewCamMode) end

---Called by the server to synchronize cinematic transitions with the client
---@param bInCinematicMode boolean
---@param bAffectsMovement boolean
---@param bAffectsTurning boolean
---@param bAffectsHUD boolean
function APlayerController:ClientSetCinematicMode(bInCinematicMode, bAffectsMovement, bAffectsTurning, bAffectsHUD) end

---Forces the streaming system to disregard the normal logic for the specified duration and
---instead always load all mip-levels for all textures used by the specified material.
---@param Material UMaterialInterface
---@param ForceDuration number
---@param CinematicTextureGroups integer
function APlayerController:ClientSetForceMipLevelsToBeResident(Material, ForceDuration, CinematicTextureGroups) end

---Set the client's class of HUD and spawns a new instance of it. If there was already a HUD active, it is destroyed.
---@param NewHUDClass TSubclassOf<AHUD>
function APlayerController:ClientSetHUD(NewHUDClass) end

---Indicate that the Spectator is waiting to join/respawn.
---@param bWaiting boolean
function APlayerController:ClientSetSpectatorWaiting(bWaiting) end

---Set the view target
---@param A AActor @- new actor to set as view target
---@param TransitionParams FViewTargetTransitionParams @- parameters to use for controlling the transition
function APlayerController:ClientSetViewTarget(A, TransitionParams) end

---@param LensEffectEmitterClass TSubclassOf<AEmitterCameraLensEffectBase>
function APlayerController:ClientSpawnCameraLensEffect(LensEffectEmitterClass) end

---Spawn a camera lens effect (e.g. blood).
---@param LensEffectEmitterClass TSubclassOf<AActor>
function APlayerController:ClientSpawnGenericCameraLensEffect(LensEffectEmitterClass) end

---Play Camera Shake
---@param Shake TSubclassOf<UCameraShakeBase> @- Camera shake animation to play
---@param Scale? number @[default: 1.000000] - Scalar defining how "intense" to play the anim
---@param PlaySpace? ECameraShakePlaySpace @[default: CameraLocal] - Which coordinate system to play the shake in (used for CameraAnims within the shake).
---@param UserPlaySpaceRot FRotator @- Matrix used when PlaySpace = CAPS_UserDefined
function APlayerController:ClientStartCameraShake(Shake, Scale, PlaySpace, UserPlaySpaceRot) end

---Play Camera Shake localized to a given source
---@param Shake TSubclassOf<UCameraShakeBase> @- Camera shake animation to play
---@param SourceComponent UCameraShakeSourceComponent @- The source from which the camera shakes originates
function APlayerController:ClientStartCameraShakeFromSource(Shake, SourceComponent) end

---Notify client that the session is starting
function APlayerController:ClientStartOnlineSession() end

---Stop camera shake on client.
---@param Shake TSubclassOf<UCameraShakeBase>
---@param bImmediately? boolean @[default: true]
function APlayerController:ClientStopCameraShake(Shake, bImmediately) end

---Stop camera shake on client.
---@param SourceComponent UCameraShakeSourceComponent
---@param bImmediately? boolean @[default: true]
function APlayerController:ClientStopCameraShakesFromSource(SourceComponent, bImmediately) end

---Stops a playing force feedback pattern
---@param ForceFeedbackEffect UForceFeedbackEffect
---@param Tag string
function APlayerController:ClientStopForceFeedback(ForceFeedbackEffect, Tag) end

---
---@param SenderPlayerState APlayerState
---@param S string
---@param Type string
---@param MsgLifeTime number
function APlayerController:ClientTeamMessage(SenderPlayerState, S, Type, MsgLifeTime) end

---Travel to a different map or IP address. Calls the PreClientTravel event before doing anything.
---NOTE: This is implemented as a locally executed wrapper for ClientTravelInternal, to avoid API compatability breakage
---                                                     for the bSeamlesss parameter, this value must be TRAVEL_Relative.
---                                                     so it is only needed for clients
---@param URL string
---@param TravelType integer @specifies whether the client should append URL options used in previous travels; if true is specified
---@param bSeamless boolean
---@param MapPackageGuid FGuid
function APlayerController:ClientTravel(URL, TravelType, bSeamless, MapPackageGuid) end

---Internal clientside implementation of ClientTravel - use ClientTravel to call this
---                                                     for the bSeamlesss parameter, this value must be TRAVEL_Relative.
---                                                     so it is only needed for clients
---@param URL string
---@param TravelType integer @specifies whether the client should append URL options used in previous travels; if true is specified
---@param bSeamless boolean
---@param MapPackageGuid FGuid
function APlayerController:ClientTravelInternal(URL, TravelType, bSeamless, MapPackageGuid) end

---Tell the client to unmute a player for this controller
---@param PlayerId FUniqueNetIdRepl @player id to unmute
function APlayerController:ClientUnmutePlayer(PlayerId) end

---Tell the client to unmute an array of players for this controller
---@param PlayerIds TArray<FUniqueNetIdRepl> @player ids to unmute
function APlayerController:ClientUnmutePlayers(PlayerIds) end

---Replicated Update streaming status
---@param PackageName string @- Name of the level package name used for loading.
---@param bNewShouldBeLoaded boolean @- Whether the level should be loaded
---@param bNewShouldBeVisible boolean @- Whether the level should be visible if it is loaded
---@param bNewShouldBlockOnLoad boolean @- Whether we want to force a blocking load
---@param LODIndex integer
---@param TransactionId FNetLevelVisibilityTransactionId
---@param bNewShouldBlockOnUnload boolean @- Optional parameter used to force a blocking unload or not
function APlayerController:ClientUpdateLevelStreamingStatus(PackageName, bNewShouldBeLoaded, bNewShouldBeVisible, bNewShouldBlockOnLoad, LODIndex, TransactionId, bNewShouldBlockOnUnload) end

---Replicated Update streaming status.  This version allows for the streaming state of many levels to be sent in a single RPC.
---@param LevelStatuses TArray<FUpdateLevelStreamingLevelStatus>
function APlayerController:ClientUpdateMultipleLevelsStreamingStatus(LevelStatuses) end

---Tells the client that the server has all the information it needs and that it
---is ok to start sending voice packets. The server will already send voice packets
---when this function is called, since it is set server side and then forwarded
---NOTE: This is done as an RPC instead of variable replication because ordering matters
function APlayerController:ClientVoiceHandshakeComplete() end

---Notify client they were kicked from the server
---@param KickReason string
function APlayerController:ClientWasKicked(KickReason) end

---Console control commands, useful when remote debugging so you can't touch the console the normal way
---@param Key FKey
function APlayerController:ConsoleKey(Key) end

---Convert current mouse 2D position to World Space 3D position and direction. Returns false if unable to determine value. *
---@param WorldLocation FVector @[out]
---@param WorldDirection FVector @[out]
---@return boolean
function APlayerController:DeprojectMousePositionToWorld(WorldLocation, WorldDirection) end

---Convert 2D screen position to World Space 3D position and direction. Returns false if unable to determine value. *
---@param ScreenX number
---@param ScreenY number
---@param WorldLocation FVector @[out]
---@param WorldDirection FVector @[out]
---@return boolean
function APlayerController:DeprojectScreenPositionToWorld(ScreenX, ScreenY, WorldLocation, WorldDirection) end

---Run from the console to try and manually enable cheats which are disabled by default in multiplayer, games can override this
function APlayerController:EnableCheats() end

---Set the field of view to NewFOV
---@param NewFOV number
function APlayerController:FOV(NewFOV) end

---@return UAsyncPhysicsData
function APlayerController:GetAsyncPhysicsDataToConsume() end

---@return UAsyncPhysicsData
function APlayerController:GetAsyncPhysicsDataToWrite() end

---@return number
function APlayerController:GetDeprecatedInputPitchScale() end

---@return number
function APlayerController:GetDeprecatedInputRollScale() end

---@return number
function APlayerController:GetDeprecatedInputYawScale() end

---Returns the location the PlayerController is focused on.
--- If there is a possessed Pawn, returns the Pawn's location.
--- If there is a spectator Pawn, returns that Pawn's location.
--- Otherwise, returns the PlayerController's spawn location (usually the last known Pawn location after it has died).
---@return FVector
function APlayerController:GetFocalLocation() end

---@param TraceChannel integer
---@param bTraceComplex boolean
---@param HitResult FHitResult @[out]
---@return boolean
function APlayerController:GetHitResultUnderCursor(TraceChannel, bTraceComplex, HitResult) end

---Performs a collision query under the mouse cursor, looking on a trace channel
---@param TraceChannel integer
---@param bTraceComplex boolean
---@param HitResult FHitResult @[out]
---@return boolean
function APlayerController:GetHitResultUnderCursorByChannel(TraceChannel, bTraceComplex, HitResult) end

---Performs a collision query under the mouse cursor, looking for object types
---@param ObjectTypes TArray<integer>
---@param bTraceComplex boolean
---@param HitResult FHitResult @[out]
---@return boolean
function APlayerController:GetHitResultUnderCursorForObjects(ObjectTypes, bTraceComplex, HitResult) end

---@param FingerIndex integer
---@param TraceChannel integer
---@param bTraceComplex boolean
---@param HitResult FHitResult @[out]
---@return boolean
function APlayerController:GetHitResultUnderFinger(FingerIndex, TraceChannel, bTraceComplex, HitResult) end

---Performs a collision query under the finger, looking on a trace channel
---@param FingerIndex integer
---@param TraceChannel integer
---@param bTraceComplex boolean
---@param HitResult FHitResult @[out]
---@return boolean
function APlayerController:GetHitResultUnderFingerByChannel(FingerIndex, TraceChannel, bTraceComplex, HitResult) end

---Performs a collision query under the finger, looking for object types
---@param FingerIndex integer
---@param ObjectTypes TArray<integer>
---@param bTraceComplex boolean
---@param HitResult FHitResult @[out]
---@return boolean
function APlayerController:GetHitResultUnderFingerForObjects(FingerIndex, ObjectTypes, bTraceComplex, HitResult) end

---Gets the HUD currently being used by this player controller
---@return AHUD
function APlayerController:GetHUD() end

---Returns the analog value for the given key/button.  If analog isn't supported, returns 1 for down and 0 for up.
---@param Key FKey
---@return number
function APlayerController:GetInputAnalogKeyState(Key) end

---Retrieves the X and Y displacement of the given analog stick.
---@param WhichStick integer
---@param StickX number @[out]
---@param StickY number @[out]
function APlayerController:GetInputAnalogStickState(WhichStick, StickX, StickY) end

---Returns how long the given key/button has been down.  Returns 0 if it's up or it just went down this frame.
---@param Key FKey
---@return number
function APlayerController:GetInputKeyTimeDown(Key) end

---Retrieves the current motion state of the player's input device
---@param Tilt FVector @[out]
---@param RotationRate FVector @[out]
---@param Gravity FVector @[out]
---@param Acceleration FVector @[out]
function APlayerController:GetInputMotionState(Tilt, RotationRate, Gravity, Acceleration) end

---Retrieves how far the mouse moved this frame.
---@param DeltaX number @[out]
---@param DeltaY number @[out]
function APlayerController:GetInputMouseDelta(DeltaX, DeltaY) end

---Retrieves the X and Y screen coordinates of the specified touch key. Returns false if the touch index is not down
---@param FingerIndex integer
---@param LocationX number @[out]
---@param LocationY number @[out]
---@param bIsCurrentlyPressed boolean @[out]
function APlayerController:GetInputTouchState(FingerIndex, LocationX, LocationY, bIsCurrentlyPressed) end

---Returns the vector value for the given key/button.
---@param Key FKey
---@return FVector
function APlayerController:GetInputVectorKeyState(Key) end

---Retrieves the X and Y screen coordinates of the mouse cursor. Returns false if there is no associated mouse device
---@param LocationX number @[out]
---@param LocationY number @[out]
---@return boolean
function APlayerController:GetMousePosition(LocationX, LocationY) end

---@return TSubclassOf<UPlayerInput>
function APlayerController:GetOverridePlayerInputClass() end

---Returns the platform user that is assigned to this Player Controller's Local Player.
---If there is no local player, then this will return PLATFORMUSERID_NONE
---@return FPlatformUserId
function APlayerController:GetPlatformUserId() end

---Get the Pawn used when spectating. nullptr when not spectating.
---@return ASpectatorPawn
function APlayerController:GetSpectatorPawn() end

---Gets the streaming source location and rotation.
---Default implementation returns APlayerController::GetPlayerViewPoint but can be overriden in child classes.
---@param OutLocation FVector @[out]
---@param OutRotation FRotator @[out]
function APlayerController:GetStreamingSourceLocationAndRotation(OutLocation, OutRotation) end

---Gets the streaming source priority.
---Default implementation returns StreamingSourcePriority but can be overriden in child classes.
---@return EStreamingSourcePriority
function APlayerController:GetStreamingSourcePriority() end

---Gets the streaming source priority.
---Default implementation returns StreamingSourceShapes but can be overriden in child classes.
---@param OutShapes TArray<FStreamingSourceShape> @[out]
function APlayerController:GetStreamingSourceShapes(OutShapes) end

---Helper to get the size of the HUD canvas for this player controller.  Returns 0 if there is no HUD
---@param SizeX integer @[out]
---@param SizeY integer @[out]
function APlayerController:GetViewportSize(SizeX, SizeY) end

---Returns true if the given key/button is pressed on the input of the controller (if present)
---@param Key FKey
---@return boolean
function APlayerController:IsInputKeyDown(Key) end

---Whether the PlayerController should be used as a World Partiton streaming source.
---Default implementation returns bEnableStreamingSource but can be overriden in child classes.
---@return boolean
function APlayerController:IsStreamingSourceEnabled() end

---Play a force feedback pattern on the player's controller
---@param ForceFeedbackEffect UForceFeedbackEffect
---@param Tag string
---@param bLooping boolean
---@param bIgnoreTimeDilation boolean
---@param bPlayWhilePaused boolean
function APlayerController:K2_ClientPlayForceFeedback(ForceFeedbackEffect, Tag, bLooping, bIgnoreTimeDilation, bPlayWhilePaused) end

---Causes the client to travel to the given URL
---@param URL string
function APlayerController:LocalTravel(URL) end

function APlayerController:OnRep_AsyncPhysicsDataComponent() end

---Notify from server that Visual Logger is recording, to show that information on client about possible performance issues
---@param bIsLogging boolean
function APlayerController:OnServerStartedVisualLogger(bIsLogging) end

---Command to try to pause the game.
function APlayerController:Pause() end

---Latent action that controls the playing of force feedback
---Begins playing when Start is called.  Calling Update or Stop if the feedback is not active will have no effect.
---Completed will execute when Stop is called or the duration ends.
---When Update is called the Intensity, Duration, and affect values will be updated with the current inputs
---@param Intensity number
---@param Duration number
---@param bAffectsLeftLarge boolean
---@param bAffectsLeftSmall boolean
---@param bAffectsRightLarge boolean
---@param bAffectsRightSmall boolean
---@param Action integer
function APlayerController:PlayDynamicForceFeedback(Intensity, Duration, bAffectsLeftLarge, bAffectsLeftSmall, bAffectsRightLarge, bAffectsRightSmall, Action) end

---Play a haptic feedback curve on the player's controller
---@param HapticEffect UHapticFeedbackEffect_Base
---@param Hand EControllerHand
---@param Scale? number @[default: 1.000000]
---@param bLoop? boolean @[default: false]
function APlayerController:PlayHapticEffect(HapticEffect, Hand, Scale, bLoop) end

---Convert a World Space 3D position into a 2D Screen Space position.
---@param WorldLocation FVector
---@param ScreenLocation FVector2D @[out]
---@param bPlayerViewportRelative? boolean @[default: false]
---@return boolean
function APlayerController:ProjectWorldLocationToScreen(WorldLocation, ScreenLocation, bPlayerViewportRelative) end

---Resets the light color of the player's controller to default
function APlayerController:ResetControllerLightColor() end

---Restarts the current level
function APlayerController:RestartLevel() end

---Sends a command to the console to execute if not shipping version
---@param Command string
function APlayerController:SendToConsole(Command) end

---acknowledge possession of pawn
---@param P APawn
function APlayerController:ServerAcknowledgePossession(P) end

---Tell the client to block a player for this controller
---@param PlayerId FUniqueNetIdRepl @player id to block
function APlayerController:ServerBlockPlayer(PlayerId) end

---change mode of camera
---@param NewMode string
function APlayerController:ServerCamera(NewMode) end

---Change name of server
---@param S string
function APlayerController:ServerChangeName(S) end

---Tells the server to make sure the possessed pawn is in sync with the client.
function APlayerController:ServerCheckClientPossession() end

---Reliable version of ServerCheckClientPossession to be used when there is no likely danger of spamming the network.
function APlayerController:ServerCheckClientPossessionReliable() end

---Executes command on server (non shipping builds only)
---@param Msg string
function APlayerController:ServerExec(Msg) end

---RPC used by ServerExec. Not intended to be called directly
---@param Msg string
function APlayerController:ServerExecRPC(Msg) end

---Tell the server to mute a player for this controller
---@param PlayerId FUniqueNetIdRepl @player id to mute
function APlayerController:ServerMutePlayer(PlayerId) end

---Called to notify the server when the client has loaded a new world via seamless traveling
---@param WorldPackageName string @the name of the world package that was loaded
function APlayerController:ServerNotifyLoadedWorld(WorldPackageName) end

---Replicate pause request to the server
function APlayerController:ServerPause() end

---Client says "Here is input frame number X" (and then calls other RPCs to deliver InputCmd payload)
---@param RecvClientInputFrame integer
---@param Data TArray<integer>
function APlayerController:ServerRecvClientInputFrame(RecvClientInputFrame, Data) end

---Attempts to restart this player, generally called from the client upon respawn request.
function APlayerController:ServerRestartPlayer() end

---@param Timestamp FAsyncPhysicsTimestamp
function APlayerController:ServerSendLatestAsyncPhysicsTimestamp(Timestamp) end

---When spectating, updates spectator location/rotation and pings the server to make sure spectating should continue.
---@param NewLoc FVector
---@param NewRot FRotator
function APlayerController:ServerSetSpectatorLocation(NewLoc, NewRot) end

---Indicate that the Spectator is waiting to join/respawn.
---@param bWaiting boolean
function APlayerController:ServerSetSpectatorWaiting(bWaiting) end

---Notifies the server that the client has ticked gameplay code, and should no longer get the extended "still loading" timeout grace period
function APlayerController:ServerShortTimeout() end

---Used by UGameplayDebuggingControllerComponent to replicate messages for AI debugging in network games.
function APlayerController:ServerToggleAILogging() end

---Tell the client to unblock a player for this controller
---@param PlayerId FUniqueNetIdRepl @player id to unblock
function APlayerController:ServerUnblockPlayer(PlayerId) end

---Tell the server to unmute a player for this controller
---@param PlayerId FUniqueNetIdRepl @player id to unmute
function APlayerController:ServerUnmutePlayer(PlayerId) end

---If PlayerCamera.bUseClientSideCameraUpdates is set, client will replicate camera positions to the server. // @@TODO - combine pitch/yaw into one int, maybe also send location compressed
---@param CamLoc FVector_NetQuantize
---@param CamPitchAndYaw integer
function APlayerController:ServerUpdateCamera(CamLoc, CamPitchAndYaw) end

---Called when the client adds/removes a streamed level.
---The server will only replicate references to Actors in visible levels so that it's impossible to send references to
---Actors the client has not initialized.
---@param LevelVisibility FUpdateLevelVisibilityLevelInfo
function APlayerController:ServerUpdateLevelVisibility(LevelVisibility) end

---Called when the client adds/removes a streamed level.  This version of the function allows you to pass the state of
---multiple levels at once, to reduce the number of RPC events that will be sent.
---@param LevelVisibilities TArray<FUpdateLevelVisibilityLevelInfo>
function APlayerController:ServerUpdateMultipleLevelsVisibility(LevelVisibilities) end

---Used by client to request server to confirm current viewtarget (server will respond with ClientSetViewTarget() ).
function APlayerController:ServerVerifyViewTarget() end

---Move camera to next player on round ended or spectating
function APlayerController:ServerViewNextPlayer() end

---Move camera to previous player on round ended or spectating
function APlayerController:ServerViewPrevPlayer() end

---Move camera to current user
---@param TransitionParams FViewTargetTransitionParams
function APlayerController:ServerViewSelf(TransitionParams) end

---@param AttachToComponent USceneComponent
---@param AttenuationLocationOVerride FVector
function APlayerController:SetAudioListenerAttenuationOverride(AttachToComponent, AttenuationLocationOVerride) end

---Used to override the default positioning of the audio listener
---@param AttachToComponent USceneComponent @Optional component to attach the audio listener to
---@param Location FVector @Depending on whether Component is attached this is either an offset from its location or an absolute position
---@param Rotation FRotator @Depending on whether Component is attached this is either an offset from its rotation or an absolute rotation
function APlayerController:SetAudioListenerOverride(AttachToComponent, Location, Rotation) end

---Server/SP only function for changing whether the player is in cinematic mode.  Updates values of various state variables, then replicates the call to the client
---to sync the current cinematic mode.
---@param bInCinematicMode boolean
---@param bHidePlayer boolean
---@param bAffectsHUD boolean
---@param bAffectsMovement boolean
---@param bAffectsTurning boolean
function APlayerController:SetCinematicMode(bInCinematicMode, bHidePlayer, bAffectsHUD, bAffectsMovement, bAffectsTurning) end

---Sets the light color of the player's controller
---@param Color FColor
function APlayerController:SetControllerLightColor(Color) end

---@param NewValue number
function APlayerController:SetDeprecatedInputPitchScale(NewValue) end

---@param NewValue number
function APlayerController:SetDeprecatedInputRollScale(NewValue) end

---@param NewValue number
function APlayerController:SetDeprecatedInputYawScale(NewValue) end

---Allows the player controller to disable all haptic requests from being fired, e.g. in the case of a level loading
---@param bNewDisabled boolean
function APlayerController:SetDisableHaptics(bNewDisabled) end

---Sets the value of the haptics for the specified hand directly, using frequency and amplitude.  NOTE:  If a curve is already
---playing for this hand, it will be cancelled in favour of the specified values.
---@param Frequency number
---@param Amplitude number
---@param Hand EControllerHand
function APlayerController:SetHapticsByValue(Frequency, Amplitude, Hand) end

---@param bEnabled boolean
function APlayerController:SetMotionControlsEnabled(bEnabled) end

---Sets the Widget for the Mouse Cursor to display
---@param Cursor integer @- the cursor to set the widget for
---@param CursorWidget UUserWidget @- the widget to set the cursor to
function APlayerController:SetMouseCursorWidget(Cursor, CursorWidget) end

---Positions the mouse cursor in screen space, in pixels.
---@param X integer
---@param Y integer
function APlayerController:SetMouseLocation(X, Y) end

---Tries to set the player's name to the given name.
---@param S string
function APlayerController:SetName(S) end

---Set the view target blending with variable control
---@param NewViewTarget AActor @- new actor to set as view target
---@param BlendTime? number @[default: 0.000000] - time taken to blend
---@param BlendFunc? integer @[default: VTBlend_Linear] - Cubic, Linear etc functions for blending
---@param BlendExp? number @[default: 0.000000] -  Exponent, used by certain blend functions to control the shape of the curve.
---@param bLockOutgoing? boolean @[default: false] - If true, lock outgoing viewtarget to last frame's camera position for the remainder of the blend.
function APlayerController:SetViewTargetWithBlend(NewViewTarget, BlendTime, BlendFunc, BlendExp, bLockOutgoing) end

---Set the virtual joystick visibility.
---@param bVisible boolean
function APlayerController:SetVirtualJoystickVisibility(bVisible) end

---Fire the player's currently selected weapon with the optional firemode.
---@param FireModeNum? integer @[default: 0]
function APlayerController:StartFire(FireModeNum) end

---Stops a playing haptic feedback curve
---@param Hand EControllerHand
function APlayerController:StopHapticEffect(Hand) end

---Whether the PlayerController streaming source should activate cells after loading.
---Default implementation returns bStreamingSourceShouldActivate but can be overriden in child classes.
---@return boolean
function APlayerController:StreamingSourceShouldActivate() end

---Whether the PlayerController streaming source should block on slow streaming.
---Default implementation returns bStreamingSourceShouldBlockOnSlowStreaming but can be overriden in child classes.
---@return boolean
function APlayerController:StreamingSourceShouldBlockOnSlowStreaming() end

---SwitchLevel to the given MapURL.
---@param URL string
function APlayerController:SwitchLevel(URL) end

---@param PackageName string
---@param FileName string
function APlayerController:TestServerLevelVisibilityChange(PackageName, FileName) end

---Toggle voice chat on and off
---@param bInSpeaking boolean
function APlayerController:ToggleSpeaking(bInSpeaking) end

---Returns true if the given key/button was up last frame and down this frame.
---@param Key FKey
---@return boolean
function APlayerController:WasInputKeyJustPressed(Key) end

---Returns true if the given key/button was down last frame and up this frame.
---@param Key FKey
---@return boolean
function APlayerController:WasInputKeyJustReleased(Key) end

