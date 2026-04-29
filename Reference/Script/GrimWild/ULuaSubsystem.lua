---@class ULuaSubsystem : UGameInstanceSubsystem
---@field private BaseGameOwner UBaseGameScriptOwner
---@field private DevOwner UDevScriptOwner
ULuaSubsystem = {}

---Discover available dev scripts.
---@param OutInfos TArray<FLuaScriptFileInfo> @[out]
function ULuaSubsystem:DiscoverDevScripts(OutInfos) end

---Register an owner and create its env table.
---@param Owner UScriptOwner
function ULuaSubsystem:RegisterOwner(Owner) end

---Unload all modules owned by Owner, in reverse load order.
---@param Owner UScriptOwner
function ULuaSubsystem:UnloadOwner(Owner) end

---Unregister an owner and release its env table.
---@param Owner UScriptOwner
function ULuaSubsystem:UnregisterOwner(Owner) end

---Called from UScriptOwner::BeginDestroy to handle stale owners.
---@param Owner UScriptOwner
function ULuaSubsystem:UnregisterOwnerIfStale(Owner) end

