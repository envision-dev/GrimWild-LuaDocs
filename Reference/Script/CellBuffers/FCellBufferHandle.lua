---A safe, type-erased reference to a cell buffer.
---Prefer FCellBufferHandle over raw FCellBufferBase* whenever the handle may
---outlive the current stack frame: async tasks, stored delegates, dependency
---edges, BP wrappers. Use raw FCellBufferBase* only for synchronous game-thread
---code where lifetime is guaranteed by the call site.
---@class FCellBufferHandle
FCellBufferHandle = {}
