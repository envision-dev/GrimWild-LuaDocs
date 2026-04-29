---Internal state flags for TCellBuffer.
---@class ECellBufferFlags
---@field public None ECellBufferFlags [0]
---@field public Initialized ECellBufferFlags [1] Buffer has been successfully initialized.
---@field public UploadDirty ECellBufferFlags [2] Waiting for Upload, CPU changes were made to Data directly (cleared when the Upload process starts).
---@field public HardUploadAwaiting ECellBufferFlags [4] Whether the next Upload process needs to ignore Chunks and sync the entire Data array instead. Resets automatically. Common use: during game loading.
---@field public ApplyDeltasDirty ECellBufferFlags [8] Changes were made to DeltaValues. Waiting to apply them.
---@field public DownloadDirty ECellBufferFlags [16] Indicates that changes were made to RT_Data and CPU-Side Data will be overridden with the new GPU values. New CPU changes must be saved in DeltaValues to be applied after the GPU data insertion is complete.
---@field public IsBitBuffer ECellBufferFlags [128] This buffer is used as a bit-field (values are accessed via GetBitValue/SetBitValue)
ECellBufferFlags = {}
