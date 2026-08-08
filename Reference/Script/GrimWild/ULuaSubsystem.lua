---@class ULuaSubsystem : UGameInstanceSubsystem
---@field public ScriptBudgetLoadSeconds number @Wall-clock budget for chunk execution and OnConstruct.
---@field public ScriptBudgetTickSeconds number @Wall-clock budget for OnTick.
---@field public ScriptBudgetCallbackSeconds number @Wall-clock budget for delegate dispatch, OnDestruct, and CallScriptFunction.
---@field private BaseGameEnv UBaseGameScriptEnv
---@field private DevEnv UDevScriptEnv
ULuaSubsystem = {}

---Discover available dev scripts. Emits normalized (lowercase) require paths.
---@param OutInfos TArray<FLuaScriptFileInfo> @[out, modified in place]
function ULuaSubsystem:DiscoverDevScripts(OutInfos) end

---@return ULuaSubsystem
function ULuaSubsystem.Get() end

---Register an env and create its env table.
---@param Owner UScriptEnv
function ULuaSubsystem:RegisterEnv(Owner) end

---Unload all modules owned by Owner, in reverse load order.
---@param Owner UScriptEnv
function ULuaSubsystem:UnloadEnv(Owner) end

---Unregister an env and release its env table. Always unloads first, so it can never leave
---module refs, tick entries, or delegate handles alive.
---@param Owner UScriptEnv
function ULuaSubsystem:UnregisterEnv(Owner) end

---Called from UScriptEnv::BeginDestroy to handle stale envs. Runs no Lua: GC is not a safe
---place to execute script code (OnDestruct could call NewObject, which GC forbids). Only
---registry refs and bookkeeping are released; this path logs LOG_ERROR because it indicates the
---env was garbage collected without an explicit UnloadEnv.
---@param Owner UScriptEnv
function ULuaSubsystem:UnregisterEnvIfStale(Owner) end

---Gathers all useful object instance debug data into string
---@return string DebugString
function ULuaSubsystem:GatherDebugData() end

