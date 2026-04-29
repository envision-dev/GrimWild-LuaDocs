---@class UGPUWorkBase : UObject
UGPUWorkBase = {}

---Dispatches this work as a standalone operation (creates its own RDG builder and executes immediately).
function UGPUWorkBase:Dispatch() end

