---TODO; an ordered list of passes. Used in Lua, added to buffer work queue.
---Note: 1 pipeline = 1 buffer. Even though we can add multiple passes with different RenderTargets, please, don't
---draw to several buffers. A pipeline is attached to a single buffer, and is executed based on its dependencies.
---@class UGPUPipeline : UGPUWorkBase
UGPUPipeline = {}

