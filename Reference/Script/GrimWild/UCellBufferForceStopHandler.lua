---Mechanism to quiesce all cell buffers of a single holder so the caller
---can safely read or serialize Data. Used by game save and level resize.
---The handler runs on its own FTSTicker so it works without
---UCellBufferSyncManager cooperation: callers may invoke it under
---conditions where sync ticks are gated by external state (game pause).
---Limitations:
---  - A buffer with IsDownloadDirty(), pending UploadDirty, or scheduled
---    GPU work at BeginForceStop time is frozen with its current Data
---    array. Those queued operations run after ReleaseForceStop. If the
---    caller needs the GPU side captured to CPU before freezing, the
---    caller must drive the readback before invoking BeginForceStop.
---  - New buffers added to the holder between BeginForceStop and
---    OnForceStopReady are not frozen.
---  - The caller must keep a UPROPERTY reference to this handler for the
---    entire duration between Initialize and ReleaseForceStop. GC of the
---    handler mid-freeze unfreezes all buffers and OnForceStopReady will
---    never fire.
---@class UCellBufferForceStopHandler : UObject
---@field public OnForceStopReady MulticastDelegate|fun()
---@field public OnForceStopCancelled MulticastDelegate|fun()
---@field private Owner TScriptInterface<UCellBuffersHolder>
UCellBufferForceStopHandler = {}

function UCellBufferForceStopHandler:BeginForceStop() end

---@param InOwner TScriptInterface<UCellBuffersHolder>
---@return boolean
function UCellBufferForceStopHandler:Initialize(InOwner) end

function UCellBufferForceStopHandler:ReleaseForceStop() end

