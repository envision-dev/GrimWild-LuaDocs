---@meta
---Asks one question about the engine as it stands today: does a module that resubscribes on every
---reload accumulate listeners when its callback was written somewhere else.
---Nothing here encodes a decision about what ownership ought to be. Every expectation below is a
---prediction about current behaviour, and the point of running it is to find out whether the
---prediction holds before anything is changed on the strength of it.
---@class UTempTest_LuaListenerAccumulation : UTestSuiteBase
---@field private Fixture UTempTest_LuaListenerAccumulation_Fixture
UTempTest_LuaListenerAccumulation = {}

---@param WorldContext UObject
function UTempTest_LuaListenerAccumulation:Start(WorldContext) end

