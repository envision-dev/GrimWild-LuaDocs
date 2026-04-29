---Game World is a singleton that represents the place where all gameplay logic happens.
---In-game objects (items, pawns, quests, planets) existing inside it are called "World Instances" (in contrast to "Template" objects from Assets).
---@class UGameWorld : UTickableWorldSubsystem
---@field protected Seed integer @World Seed
---@field protected GlobalMatParamCollectionInstance UMaterialParameterCollectionInstance
---@field protected CurrentSyncTick integer @Current world time in SyncTicks
---@field protected BufferSyncManager UCellBufferSyncManager
---@field public OnGameSpeedChanged MulticastDelegate
---@field public OnTimeUpdated MulticastDelegate @Executes when the current Time has changed
---@field public OnSyncTick MulticastDelegate @Fires once per SyncTick
---@field public OnTestIntEvent MulticastDelegate @TEST-ONLY: remove when delegate tests are no longer needed Multicast delegate with one int32 parameter used by LuaDelegateTest for broadcast-with-args testing.
---@field public OnMinutePassed MulticastDelegate @Fires when CurrentSyncTick crosses a minute boundary. NOTE: If TicksInMinute is later set to 1, this delegate is useless — use OnSyncTick instead and remove it.
---@field public OnHourPassed MulticastDelegate
---@field public OnDayPassed MulticastDelegate
---@field public OnSeasonPassed MulticastDelegate
---@field public OnYearPassed MulticastDelegate
---@field public OnTick MulticastDelegate @Regular tick function. Executes every frame
---@field public OnPreTick MulticastDelegate @TODO
---@field public OnPostTick MulticastDelegate @Tick function that executes in TG_PostUpdateWorld group. Executes every frame
---@field protected Objects TMap<integer, TWeakObjectPtr<UWorldObject>> @Object map. Keys = InstanceIds
---@field protected TopLevelObjects TMap<integer, UWorldObject>
---@field public OnTopLevelObjectAttached MulticastDelegate @Fired when an object is attached to the world as a Top-Level Object.
---@field public OnTopLevelObjectDetached MulticastDelegate @Fired when a Top-Level Object is detached from the world.
UGameWorld = {}

---Attaches a WorldInstance object to the world, making it a Top-Level Object. Only Strong Individual attachment is possible here. Static, Weak and COW-Awaiting objects can't be attached to the World directly.
---@param ObjectToAttach UWorldObject
function UGameWorld:AttachObject(ObjectToAttach) end

---Copies the given World Instance object. New object will have the same sub-objects (components and attached objects), but unique InstanceId.
---@param ObjectToCopy UWorldObject
---@param bAttachToWorld boolean
---@return UWorldObject
function UGameWorld:CopyWorldInstance(ObjectToCopy, bAttachToWorld) end

---Creates a new WorldInstance object from the corresponding asset.
---The object must be attached to something to work properly.
---@param AssetId FPrimaryAssetId
---@param bAttachToWorld boolean
---@return UWorldObject
function UGameWorld:CreateNewObject(AssetId, bAttachToWorld) end

---Detaches a WorldInstance object from the world (removes it as a Top-Level Object).
---@param ObjectToDetach UWorldObject
---@param bReAttaching boolean
function UGameWorld:DetachObject(ObjectToDetach, bReAttaching) end

---Lua
---@return UGameWorld
function UGameWorld.Get() end

---@return UCellBufferSyncManager
function UGameWorld:GetCellBufferSyncManager() end

---Returns current world time in SyncTicks
---@return integer
function UGameWorld:GetCurrentSyncTick() end

---@return number
function UGameWorld:GetGameSpeed() end

---BP version. Identical to Get()
---@return UGameWorld
function UGameWorld.GetGameWorld() end

---BP version. Identical to Get()
---@param WorldContext UObject
---@return UGameWorld
function UGameWorld.GetGameWorldFromContext(WorldContext) end

---@return UMaterialParameterCollectionInstance
function UGameWorld:GetGlobalMatParamCollectionInstance() end

---@return FNameRegistry
function UGameWorld:GetNameRegistry() end

---Returns an object from the Game World (works for all World Instances, not just top-level ones)
---@param InInstanceId integer
---@return UWorldObject
function UGameWorld:GetObject(InInstanceId) end

---@return integer
function UGameWorld:GetSeed() end

---@return number
function UGameWorld:GetVisualGameTime() end

---@param InNewSpeed number
function UGameWorld:SetGameSpeed(InNewSpeed) end

---@param InValue number
function UGameWorld:SetVisualGameTime(InValue) end

---Gathers all useful object instance debug data into string
---@param DebugString string @[out]
function UGameWorld:GatherDebugData(DebugString) end

