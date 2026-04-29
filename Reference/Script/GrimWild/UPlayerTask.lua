---Player task object. Used as template object in UPlayerTaskData. Instantiated for in-game use.
---@class UPlayerTask : UWorldObject
---@field public CurrentStatus boolean
---@field public MyWidget UUserWidget
---@field public WidgetClass TSubclassOf<UUserWidget>
UPlayerTask = {}

---Made for playtest only. BPs are stupid enough to forbid us from calling WorldContext functions from UObjects (even though they have valid GetWorld()...)
---@return AGPlayerPawn
function UPlayerTask:GetPlayerPawn_Test() end

function UPlayerTask:Init() end

function UPlayerTask:K2_Init() end

---@param bNowCurrentTask boolean
function UPlayerTask:K2_OnStatusChanged(bNowCurrentTask) end

---@param DeltaTime number
function UPlayerTask:K2_OnTick(DeltaTime) end

---NOTE: runs only when CurrentStatus == true.
---@param DeltaTime number
function UPlayerTask:OnTick(DeltaTime) end

---Gathers all useful object instance debug data into string
---@param DebugString string @[out]
function UPlayerTask:GatherDebugData(DebugString) end

