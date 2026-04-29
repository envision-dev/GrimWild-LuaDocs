---@class USubsystemBlueprintLibrary : UBlueprintFunctionLibrary
USubsystemBlueprintLibrary = {}

---Get an AudioEngine Subsystem from the AudioDevice associated with the provided context
---@param ContextObject UObject
---@param Class TSubclassOf<UAudioEngineSubsystem>
---@return UAudioEngineSubsystem
function USubsystemBlueprintLibrary.GetAudioEngineSubsystem(ContextObject, Class) end

---Get a Game Instance Subsystem from the Game Instance associated with the provided context
---@param Class TSubclassOf<UEngineSubsystem>
---@return UEngineSubsystem
function USubsystemBlueprintLibrary.GetEngineSubsystem(Class) end

---Get a Game Instance Subsystem from the Game Instance associated with the provided context
---@param ContextObject UObject
---@param Class TSubclassOf<UGameInstanceSubsystem>
---@return UGameInstanceSubsystem
function USubsystemBlueprintLibrary.GetGameInstanceSubsystem(ContextObject, Class) end

---Get a Local Player Subsystem from the Local Player associated with the provided context
---@param ContextObject UObject
---@param Class TSubclassOf<ULocalPlayerSubsystem>
---@return ULocalPlayerSubsystem
function USubsystemBlueprintLibrary.GetLocalPlayerSubsystem(ContextObject, Class) end

---Get a Local Player Subsystem from the LocalPlayer associated with the provided context
---If the player controller isn't associated to a LocalPlayer nullptr is returned
---@param PlayerController APlayerController
---@param Class TSubclassOf<ULocalPlayerSubsystem>
---@return ULocalPlayerSubsystem
function USubsystemBlueprintLibrary.GetLocalPlayerSubSystemFromPlayerController(PlayerController, Class) end

---Get a World Subsystem from the World associated with the provided context
---@param ContextObject UObject
---@param Class TSubclassOf<UWorldSubsystem>
---@return UWorldSubsystem
function USubsystemBlueprintLibrary.GetWorldSubsystem(ContextObject, Class) end

