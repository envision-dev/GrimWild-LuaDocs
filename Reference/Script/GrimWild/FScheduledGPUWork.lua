---@meta
---@class FScheduledGPUWork : Struct
---@field public WorkName string
---@field public WorkObject UGPUWorkBase
---@field public bPersistent boolean @TODO; false = one-shot (execute and destroy), persistent = executes every buffer update, removed manually
FScheduledGPUWork = {}
