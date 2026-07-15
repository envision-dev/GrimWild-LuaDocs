---A dependency edge from one buffer to another in the sync graph.
---Cross-mode dependencies define GPU-read relationships used for topological ordering, NOT for triggering Game buffer uploads.
---Game RT is canonical between sync ticks.
---@class FCellBufferDependency
FCellBufferDependency = {}
