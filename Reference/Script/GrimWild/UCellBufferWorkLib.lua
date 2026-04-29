---Factory functions for creating GPU work objects.
---CreateWorkObject_NAME() functions construct work objects with validated inputs.
---They can be used for GPU work on arbitrary render targets (e.g. non-buffer targets)
---or saved and reused to submit buffer GPU work multiple times.
---Usage with regular render targets:
---  Create the work object, then call Work->Dispatch() whenever needed.
---  After Dispatch() the object can be released if it is one-shot.
---Usage with buffers (preferred):
---  Do NOT dispatch manually. Buffers have a centralized work execution system.
---  Pass Buffer->GetDataRenderTarget() as OutputRenderTarget during creation.
---  Add to the buffer's scheduled work list via UCellBufferLib::AddGPUWork().
---  The work object can be reused by keeping a reference to it.
---@class UCellBufferWorkLib : UBlueprintFunctionLibrary
UCellBufferWorkLib = {}

