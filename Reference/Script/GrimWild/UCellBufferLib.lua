---BP/Lua export for TGameCellBuffer<>.
---All methods take an FCellBufferHandle and route through FCellBufferBase virtual dispatch.
---@class UCellBufferLib : UBlueprintFunctionLibrary
UCellBufferLib = {}

---Adds a dependency edge from Buffer to Target. Performs DFS cycle check; rejects on update-mode mismatch or cycle.
---@param Buffer FCellBufferHandle
---@param Target FCellBufferHandle
---@param Type? ECellBufferDependencyType @[default: Soft]
function UCellBufferLib.AddDependency(Buffer, Target, Type) end

---Appends a GPU work item to the buffer's scheduled work list.
---@param Buffer FCellBufferHandle
---@param Work FScheduledGPUWork
---@param bOverrideIfFound? boolean @[default: true]
function UCellBufferLib.AddGPUWork(Buffer, Work, bOverrideIfFound) end

---Adds a delta value to the cell at the given index. Safe to call during any SyncStatus step.
---Note: No need to manually start uploading. This process is managed by buffer lifecycle.
---@param Buffer FCellBufferHandle
---@param CellIndex integer
---@param Delta integer
function UCellBufferLib.AddValue_Byte(Buffer, CellIndex, Delta) end

---Adds a delta value to the cell at the given index. Safe to call during any SyncStatus step.
---Note: No need to manually start uploading. This process is managed by buffer lifecycle.
---@param Buffer FCellBufferHandle
---@param CellIndex integer
---@param Delta FColor
function UCellBufferLib.AddValue_Color(Buffer, CellIndex, Delta) end

---Adds a delta value to the cell at the given index. Safe to call during any SyncStatus step.
---Note: No need to manually start uploading. This process is managed by buffer lifecycle.
---@param Buffer FCellBufferHandle
---@param CellIndex integer
---@param Delta number
function UCellBufferLib.AddValue_Float(Buffer, CellIndex, Delta) end

---Binds a unique listener to the buffer's OnDownloadComplete delegate.
---@param Buffer FCellBufferHandle
---@param NewEvent Delegate
function UCellBufferLib.BindOnDownloadComplete(Buffer, NewEvent) end

---Binds a unique listener to the buffer's OnPreSync delegate.
---Fired before this buffer's sync cycle dependency graph is built.
---GPU work added here is caught in the current sync process.
---@param Buffer FCellBufferHandle
---@param NewEvent Delegate
function UCellBufferLib.BindOnPreSync(Buffer, NewEvent) end

---Binds a unique listener to the buffer's OnSyncStarted delegate.
---Fired after this buffer's GPU work has been dispatched for the current cycle.
---Changes made here take effect in the next sync process.
---@param Buffer FCellBufferHandle
---@param NewEvent Delegate
function UCellBufferLib.BindOnSyncStarted(Buffer, NewEvent) end

---Returns true if it's currently safe to modify the CPU-Side data directly.
---@param Buffer FCellBufferHandle
---@return boolean
function UCellBufferLib.CanModifyRawData(Buffer) end

---Returns true if the buffer can be resized right now.
---@param Buffer FCellBufferHandle
---@return boolean
function UCellBufferLib.CanResize(Buffer) end

---Returns true if the GPU -> CPU download process can be started now.
---@param Buffer FCellBufferHandle
---@return boolean
function UCellBufferLib.CanStartDownloading(Buffer) end

---Returns true if the CPU -> GPU upload process can be started now.
---@param Buffer FCellBufferHandle
---@return boolean
function UCellBufferLib.CanStartUploading(Buffer) end

---Returns the appropriate value for the buffer, possibly clamping it to Min/Max values if necessary.
---@param Buffer FCellBufferHandle
---@param RawValue integer
---@return integer
function UCellBufferLib.ClampValue_Byte(Buffer, RawValue) end

---Returns the appropriate value for the buffer, possibly clamping it to Min/Max values if necessary.
---@param Buffer FCellBufferHandle
---@param RawValue FColor
---@return FColor
function UCellBufferLib.ClampValue_Color(Buffer, RawValue) end

---Returns the appropriate value for the buffer, possibly clamping it to Min/Max values if necessary.
---@param Buffer FCellBufferHandle
---@param RawValue number
---@return number
function UCellBufferLib.ClampValue_Float(Buffer, RawValue) end

---Removes all scheduled GPU work entries from the buffer.
---@param Buffer FCellBufferHandle
function UCellBufferLib.ClearGPUWorkList(Buffer) end

---Returns true if the buffer has a scheduled GPU work item with the given name.
---@param Buffer FCellBufferHandle
---@param WorkName string
---@return boolean
function UCellBufferLib.ContainsGPUWork(Buffer, WorkName) end

---Creates a new cell buffer owned by the given Game Level.
---BufferName must be unique (will not override an existing buffer). Check IsAlive() on the returned handle before use.
---@param Owner UGameLevel
---@param BufferName string
---@param SizeX integer
---@param SizeY integer
---@param UpdateMode ECellBufferUpdateMode
---@param RenderTargetFilter? ECellBufferTextureFilter @[default: Nearest]
---@param bIsBitBuffer? boolean @[default: false]
---@param bHasVisualLerp? boolean @[default: false]
---@param bInHasMinValue? boolean @[default: false]
---@param InMinValue? integer @[default: 0]
---@param bInHasMaxValue? boolean @[default: false]
---@param InMaxValue? integer @[default: 0]
---@return FCellBufferHandle
function UCellBufferLib.CreateBuffer_Byte(Owner, BufferName, SizeX, SizeY, UpdateMode, RenderTargetFilter, bIsBitBuffer, bHasVisualLerp, bInHasMinValue, InMinValue, bInHasMaxValue, InMaxValue) end

---Creates a new cell buffer owned by the given Game Level.
---BufferName must be unique (will not override an existing buffer). Check IsAlive() on the returned handle before use.
---Min/Max values: Each color channel gets its own Min and Max boundaries.
---Example: Min=(1,2,3,4) Max=(255,254,253,252). Given RawValue == (0,255,0,255), the clamped result is (1,254,3,252).
---@param Owner UGameLevel
---@param BufferName string
---@param SizeX integer
---@param SizeY integer
---@param UpdateMode ECellBufferUpdateMode
---@param RenderTargetFilter? ECellBufferTextureFilter @[default: Nearest]
---@param bIsBitBuffer? boolean @[default: false]
---@param bHasVisualLerp? boolean @[default: false]
---@param bInHasMinValue? boolean @[default: false]
---@param InMinValue? FColor @[default: (R=0,G=0,B=0,A=0)]
---@param bInHasMaxValue? boolean @[default: false]
---@param InMaxValue? FColor @[default: (R=255,G=255,B=255,A=255)]
---@return FCellBufferHandle
function UCellBufferLib.CreateBuffer_Color(Owner, BufferName, SizeX, SizeY, UpdateMode, RenderTargetFilter, bIsBitBuffer, bHasVisualLerp, bInHasMinValue, InMinValue, bInHasMaxValue, InMaxValue) end

---Creates a new cell buffer owned by the given Game Level.
---BufferName must be unique (will not override an existing buffer). Check IsAlive() on the returned handle before use.
---Note: ignoring bIsBitBuffer here. Bit float buffers are not allowed. We keep this argument so the arg order across typed functions is consistent.
---@param Owner UGameLevel
---@param BufferName string
---@param SizeX integer
---@param SizeY integer
---@param UpdateMode ECellBufferUpdateMode
---@param RenderTargetFilter? ECellBufferTextureFilter @[default: Nearest]
---@param bIsBitBuffer? boolean @[default: false]
---@param bHasVisualLerp? boolean @[default: false]
---@param bInHasMinValue? boolean @[default: false]
---@param InMinValue? number @[default: 0.000000]
---@param bInHasMaxValue? boolean @[default: false]
---@param InMaxValue? number @[default: 0.000000]
---@return FCellBufferHandle
function UCellBufferLib.CreateBuffer_Float(Owner, BufferName, SizeX, SizeY, UpdateMode, RenderTargetFilter, bIsBitBuffer, bHasVisualLerp, bInHasMinValue, InMinValue, bInHasMaxValue, InMaxValue) end

---Fills the whole buffer with the given value. Note: uses CPU. Marks as HardUploadAwaiting internally.
---Note 1: Slower than filling on GPU. Prefer GPU function version if possible.
---Note 2: Significantly slower if done while ShouldWriteChangesToDeferredBuffers() is true.
---@param Buffer FCellBufferHandle
---@param NewValue integer
function UCellBufferLib.Fill_CPU_Byte(Buffer, NewValue) end

---Fills the whole buffer with the given value. Note: uses CPU. Marks as HardUploadAwaiting internally.
---Note 1: Slower than filling on GPU. Prefer GPU function version if possible.
---Note 2: Significantly slower if done while ShouldWriteChangesToDeferredBuffers() is true.
---@param Buffer FCellBufferHandle
---@param NewValue FColor
function UCellBufferLib.Fill_CPU_Color(Buffer, NewValue) end

---Fills the whole buffer with the given value. Note: uses CPU. Marks as HardUploadAwaiting internally.
---Note 1: Slower than filling on GPU. Prefer GPU function version if possible.
---Note 2: Significantly slower if done while ShouldWriteChangesToDeferredBuffers() is true.
---@param Buffer FCellBufferHandle
---@param NewValue number
function UCellBufferLib.Fill_CPU_Float(Buffer, NewValue) end

---Returns the index of the scheduled GPU work item with the given name, or INDEX_NONE if not found.
---@param Buffer FCellBufferHandle
---@param WorkName string
---@return integer
function UCellBufferLib.FindGPUWorkIndex(Buffer, WorkName) end

---Used for printing the state of the buffer at a given time to the log. Example: print(GatherDebugData(SomeBuffer))
---@param Buffer FCellBufferHandle
---@return string
function UCellBufferLib.GatherDebugData(Buffer) end

---Reads a single bit from the cell at the given BitIndex.
---Byte buffers: 8-bit field (0..7), FColor buffers: 32-bit field (packed in R (0..7), G (8..15), B (16..23), A (24..31) order).
---Float buffers: bit manipulation is not supported.
---@param Buffer FCellBufferHandle
---@param CellIndex integer
---@param BitIndex integer
---@return boolean
function UCellBufferLib.GetBitValue(Buffer, CellIndex, BitIndex) end

---Returns the GPU-Side data (render target).
---@param Buffer FCellBufferHandle
---@return UTextureRenderTarget2D
function UCellBufferLib.GetDataRenderTarget(Buffer) end

---Returns the pixel format of the buffer's GPU-Side render target.
---@param Buffer FCellBufferHandle
---@return integer
function UCellBufferLib.GetDataRenderTargetFormat(Buffer) end

---Returns the dependency list of Buffer. If the buffer is invalid, returns an empty static array.
---@param Buffer FCellBufferHandle
---@return TArray<FCellBufferDependency>
function UCellBufferLib.GetDependencies(Buffer) end

---Returns buffer's internal flags
---@param Buffer FCellBufferHandle
---@return ECellBufferFlags
function UCellBufferLib.GetFlags(Buffer) end

---Returns buffer's internal flags as int32 for Blueprint use.
---@param Buffer FCellBufferHandle
---@return integer
function UCellBufferLib.GetFlags_BP(Buffer) end

---Returns a copy of the scheduled GPU work item with the given name.
---@param Buffer FCellBufferHandle
---@param WorkName string
---@return FScheduledGPUWork
function UCellBufferLib.GetGPUWork(Buffer, WorkName) end

---Returns the buffer's full list of scheduled GPU work items. Buffer must be alive.
---@param Buffer FCellBufferHandle
---@return TArray<FScheduledGPUWork>
function UCellBufferLib.GetGPUWorkList(Buffer) end

---Returns a reference to the scheduled GPU work item with the given name. Buffer must be alive and ContainsGPUWork() must return true.
---@param Buffer FCellBufferHandle
---@param WorkName string
---@return FScheduledGPUWork
function UCellBufferLib.GetGPUWorkRef(Buffer, WorkName) end

---Returns the previous frame's render target. Valid only if bHasVisualLerp was set during initialization.
---@param Buffer FCellBufferHandle
---@return UTextureRenderTarget2D
function UCellBufferLib.GetLastFrameData(Buffer) end

---Only valid if HasMaxValue() is true.
---@param Buffer FCellBufferHandle
---@return integer
function UCellBufferLib.GetMaxValue_Byte(Buffer) end

---Only valid if HasMaxValue() is true.
---@param Buffer FCellBufferHandle
---@return FColor
function UCellBufferLib.GetMaxValue_Color(Buffer) end

---Only valid if HasMaxValue() is true.
---@param Buffer FCellBufferHandle
---@return number
function UCellBufferLib.GetMaxValue_Float(Buffer) end

---Only valid if HasMinValue() is true.
---@param Buffer FCellBufferHandle
---@return integer
function UCellBufferLib.GetMinValue_Byte(Buffer) end

---Only valid if HasMinValue() is true.
---@param Buffer FCellBufferHandle
---@return FColor
function UCellBufferLib.GetMinValue_Color(Buffer) end

---Only valid if HasMinValue() is true.
---@param Buffer FCellBufferHandle
---@return number
function UCellBufferLib.GetMinValue_Float(Buffer) end

---Returns buffer's owner
---@param Buffer FCellBufferHandle
---@return UGameLevel
function UCellBufferLib.GetOwner(Buffer) end

---Returns the raw CPU-Side data array. Treat as read-only. Never modify it directly, use AddValue()/SetValue() instead.
---@param Buffer FCellBufferHandle
---@return TArray<integer>
function UCellBufferLib.GetRawData_Byte(Buffer) end

---Returns the raw CPU-Side data array. Treat as read-only. Never modify it directly, use AddValue()/SetValue() instead.
---@param Buffer FCellBufferHandle
---@return TArray<FColor>
function UCellBufferLib.GetRawData_Color(Buffer) end

---Returns the raw CPU-Side data array. Treat as read-only. Never modify it directly, use AddValue()/SetValue() instead.
---@param Buffer FCellBufferHandle
---@return TArray<number>
function UCellBufferLib.GetRawData_Float(Buffer) end

---Returns buffer's size
---@param Buffer FCellBufferHandle
---@param OutX integer @[out]
---@param OutY integer @[out]
function UCellBufferLib.GetSize(Buffer, OutX, OutY) end

---Returns the render target from two frames ago. Valid only if bHasVisualLerp was set during initialization.
---@param Buffer FCellBufferHandle
---@return UTextureRenderTarget2D
function UCellBufferLib.GetTwoFramesBackData(Buffer) end

---Returns the buffer's update mode.
---@param Buffer FCellBufferHandle
---@return ECellBufferUpdateMode
function UCellBufferLib.GetUpdateMode(Buffer) end

---Returns the value at the given cell index. For heavy iterations, use GetRawData_Byte() instead.
---@param Buffer FCellBufferHandle
---@param CellIndex integer
---@return integer
function UCellBufferLib.GetValue_Byte(Buffer, CellIndex) end

---Returns the value at the given cell index. For heavy iterations, use GetRawData_Color() instead.
---@param Buffer FCellBufferHandle
---@param CellIndex integer
---@return FColor
function UCellBufferLib.GetValue_Color(Buffer, CellIndex) end

---Returns the value at the given cell index. For heavy iterations, use GetRawData_Float() instead.
---@param Buffer FCellBufferHandle
---@param CellIndex integer
---@return number
function UCellBufferLib.GetValue_Float(Buffer, CellIndex) end

---Returns the value type of the buffer (Byte, Float or Color).
---@param Buffer FCellBufferHandle
---@return ECellBufferValueType
function UCellBufferLib.GetValueType(Buffer) end

---Returns a work provider handle for the given buffer. Returns an invalid handle if the buffer is not alive or has an unsupported value type.
---@param Buffer FCellBufferHandle
---@return FWorkProviderHandle
function UCellBufferLib.HandleToWorkProvider(Buffer) end

---If true, the buffer has a valid MaxValue field. @@see ClampValue_*()
---@param Buffer FCellBufferHandle
---@return boolean
function UCellBufferLib.HasMaxValue(Buffer) end

---If true, the buffer has a valid MinValue field. @@see ClampValue_*()
---@param Buffer FCellBufferHandle
---@return boolean
function UCellBufferLib.HasMinValue(Buffer) end

---Returns true if the buffer has at least one scheduled GPU work item.
---@param Buffer FCellBufferHandle
---@return boolean
function UCellBufferLib.HasScheduledWork(Buffer) end

---Schedules a new GPU Work at the given index. bOverrideIfFound: Overrides an existing entry with the same name. Otherwise, the work with the same name is left on its previous index.
---@param Buffer FCellBufferHandle
---@param Work FScheduledGPUWork
---@param Index integer
---@param bOverrideIfFound? boolean @[default: true]
function UCellBufferLib.InsertGPUWork(Buffer, Work, Index, bOverrideIfFound) end

---Returns true if the buffer is still alive (not destroyed by the owner).
---@param Buffer FCellBufferHandle
---@return boolean
function UCellBufferLib.IsAlive(Buffer) end

---Impure variant of IsAlive() - expands into True/False exec output pins in Blueprints.
---@param Buffer FCellBufferHandle
---@return boolean
function UCellBufferLib.IsAlive_Impure(Buffer) end

---Returns true if the buffer was initialized as a bit buffer.
---@param Buffer FCellBufferHandle
---@return boolean
function UCellBufferLib.IsBitBuffer(Buffer) end

---Returns true if the buffer is marked as DownloadDirty (GPU changes are pending, CPU writes are deferred).
---@param Buffer FCellBufferHandle
---@return boolean
function UCellBufferLib.IsDownloadDirty(Buffer) end

---Returns true if the next Upload will sync the entire buffer instead of individual chunks. @@see MarkAsHardUploadAwaiting()
---@param Buffer FCellBufferHandle
---@return boolean
function UCellBufferLib.IsHardUploadAwaiting(Buffer) end

---Pause means that new lifecycle updates will not start (but the current one will be finished).
---@param Buffer FCellBufferHandle
---@return boolean
function UCellBufferLib.IsPaused(Buffer) end

---Returns true if the buffer has CPU-Side changes waiting to be uploaded to GPU.
---@param Buffer FCellBufferHandle
---@return boolean
function UCellBufferLib.IsUploadDirty(Buffer) end

---Call this if the next Upload process must sync the whole buffer instead of sending individual chunks.
---Useful if we're making huge changes, and building Chunks for each of them is costly.
---Intended usage: buffer loading from disk (filling with values from CPU)
---Note: this must be used with UploadDirty flag. It has no effect on its own.
---@param Buffer FCellBufferHandle
function UCellBufferLib.MarkAsHardUploadAwaiting(Buffer) end

---Tries to remove the buffer of the given ValueType. Returns false if nothing is removed.
---Note: Corresponding render target may stay in memory if it has external strong references.
---@param Owner UGameLevel
---@param BufferName string
---@param ValueType ECellBufferValueType
---@return boolean
function UCellBufferLib.RemoveBuffer(Owner, BufferName, ValueType) end

---Removes a dependency edge from Buffer to Target. Returns false if not found.
---@param Buffer FCellBufferHandle
---@param Target FCellBufferHandle
---@return boolean
function UCellBufferLib.RemoveDependency(Buffer, Target) end

---Tries to remove the scheduled GPU work item with the given name. Returns false if not found.
---@param Buffer FCellBufferHandle
---@param WorkName string
---@return boolean
function UCellBufferLib.RemoveGPUWork(Buffer, WorkName) end

---Sets a single bit in the cell at the given BitIndex.
---Byte buffers: 8-bit field (0..7), FColor buffers: 32-bit field (packed in R (0..7), G (8..15), B (16..23), A (24..31) order).
---Float buffers: bit manipulation is not supported.
---@param Buffer FCellBufferHandle
---@param CellIndex integer
---@param BitIndex integer
---@param NewValue boolean
function UCellBufferLib.SetBitValue(Buffer, CellIndex, BitIndex, NewValue) end

---Switches the buffer's pause state.
---Pause means that new lifecycle updates will not start (but the current one will be finished).
---@param Buffer FCellBufferHandle
---@param bPausedNow boolean
function UCellBufferLib.SetIsPaused(Buffer, bPausedNow) end

---Sets the value at the given cell index. Safe to call during any SyncStatus step.
---Prefer AddValue() for performance when the Sync process is ongoing (i.e. ShouldWriteChangesToDeferredBuffers() returns true).
---Note: No need to manually start uploading. This process is managed by buffer lifecycle.
---@param Buffer FCellBufferHandle
---@param CellIndex integer
---@param NewValue integer
function UCellBufferLib.SetValue_Byte(Buffer, CellIndex, NewValue) end

---Sets the value at the given cell index. Safe to call during any SyncStatus step.
---Prefer AddValue() for performance when the Sync process is ongoing (i.e. ShouldWriteChangesToDeferredBuffers() returns true).
---Note: No need to manually start uploading. This process is managed by buffer lifecycle.
---@param Buffer FCellBufferHandle
---@param CellIndex integer
---@param NewValue FColor
function UCellBufferLib.SetValue_Color(Buffer, CellIndex, NewValue) end

---Sets the value at the given cell index. Safe to call during any SyncStatus step.
---Prefer AddValue() for performance when the Sync process is ongoing (i.e. ShouldWriteChangesToDeferredBuffers() returns true).
---Note: No need to manually start uploading. This process is managed by buffer lifecycle.
---@param Buffer FCellBufferHandle
---@param CellIndex integer
---@param NewValue number
function UCellBufferLib.SetValue_Float(Buffer, CellIndex, NewValue) end

---Returns true if CPU changes should now be written to deferred buffers instead of Data directly,
---which is true during any download-related sync step.
---@param Buffer FCellBufferHandle
---@return boolean
function UCellBufferLib.ShouldWriteChangesToDeferredBuffers(Buffer) end

---Tries to resize the buffer. Optionally transfers previous data at the given start location. Returns true on success.
---@param Buffer FCellBufferHandle
---@param NewSizeX integer
---@param NewSizeY integer
---@param bTransferPreviousData? boolean @[default: false]
---@param PreviousDataStartLocationX? integer @[default: 0]
---@param PreviousDataStartLocationY? integer @[default: 0]
---@return boolean
function UCellBufferLib.TryResize(Buffer, NewSizeX, NewSizeY, bTransferPreviousData, PreviousDataStartLocationX, PreviousDataStartLocationY) end

---Removes a bound listener from the buffer's OnDownloadComplete delegate.
---@param Buffer FCellBufferHandle
---@param Event Delegate
function UCellBufferLib.UnbindOnDownloadComplete(Buffer, Event) end

---@param Buffer FCellBufferHandle
---@param Event Delegate
function UCellBufferLib.UnbindOnPreSync(Buffer, Event) end

---@param Buffer FCellBufferHandle
---@param Event Delegate
function UCellBufferLib.UnbindOnSyncStarted(Buffer, Event) end

---Returns true if the buffer's next process should run synchronously.
---@param Buffer FCellBufferHandle
---@return boolean
function UCellBufferLib.WantsSyncProcess(Buffer) end

---Returns a cell buffer handle from a work provider handle. Returns an invalid handle if the provider is not alive.
---@param WorkProvider FWorkProviderHandle
---@return FCellBufferHandle
function UCellBufferLib.WorkProviderToHandle(WorkProvider) end

