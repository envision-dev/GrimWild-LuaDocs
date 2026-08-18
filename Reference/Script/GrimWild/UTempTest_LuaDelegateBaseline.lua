---Pins down the behaviour the project's delegate layer already has for non-sparse delegates, so a
---later change to that layer cannot break it silently. Written before any such change exists and
---expected to pass as-is; a failure here on a clean tree means the suite is wrong, not the code.
---Covers, for an inline multicast delegate and a single-cast one: dispatch and argument marshalling,
---the removable handle, deduplication by function identity, removal by function, the deliberately
---global RemoveAll including native subscribers, module-scoped cleanup on unload, rejection of
---colon-style callbacks, single-cast rebinding replacing the previous binding, the three
---script-driven listener removals and their argument validation, and a one-shot script re-run
---keeping both runs' bindings.
---@class UTempTest_LuaDelegateBaseline : UTestSuiteBase
---@field private Fixture UTempTest_LuaDelegateBaseline_Fixture
UTempTest_LuaDelegateBaseline = {}

---@param WorldContext UObject
function UTempTest_LuaDelegateBaseline:Start(WorldContext) end

