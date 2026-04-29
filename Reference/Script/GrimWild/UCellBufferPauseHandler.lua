---Utility object used to pause all cell buffers of the given level, waiting for all sync processes to complete and
---ensuring Data arrays are fresh. Used for session saving or level resizing.
---Intended usage: Create this object, call Initialize() and BeginPause(), bind an event to OnPauseReady.
---When OnPauseReady, perform custom logic, call ReleasePause().
---TODO 25.03.2026: Pause handler is completely broken and needs a full internal logic rewrite.
---@class UCellBufferPauseHandler : UObject
---@field private Owner TScriptInterface<UCellBuffersHolder>
---@field public OnPauseReady MulticastDelegate|fun() @Fired when all buffers are fully paused and their Data arrays are safe to read or modify.
UCellBufferPauseHandler = {}

---Pauses all cell buffers owned by the holder and waits for any ongoing sync processes to complete.
---Fires OnPauseReady when all buffers are fully paused and their Data arrays are up to date.
function UCellBufferPauseHandler:BeginPause() end

---Initializes the handler with the given CellBuffers holder. Must be called before BeginPause().
---@param InOwner TScriptInterface<UCellBuffersHolder>
function UCellBufferPauseHandler:Initialize(InOwner) end

---Resumes lifecycle updates on all paused buffers.
function UCellBufferPauseHandler:ReleasePause() end

