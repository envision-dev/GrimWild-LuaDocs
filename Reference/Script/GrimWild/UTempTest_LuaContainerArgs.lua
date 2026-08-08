---Verifies how UnLua hands a TArray/TMap/TSet owned by a UObject on the Lua side to a native UFUNCTION:
---that a matching container is mutated in place and handed back intact, that a mismatched layout or
---element type is refused before the callee is entered, and that object-pointer covariance is accepted
---in the widening direction only.
---@class UTempTest_LuaContainerArgs : UTestSuiteBase
---@field private Fixture UTempTest_LuaContainerArgs_Fixture
UTempTest_LuaContainerArgs = {}

---@param WorldContext UObject
function UTempTest_LuaContainerArgs:Start(WorldContext) end

