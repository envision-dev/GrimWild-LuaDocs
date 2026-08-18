---First execution of four Lua-layer changes that have landed but never run: the object-property value
---classifier and the four write paths that route through it, UClass.Load and UObject.Load raising
---instead of answering nil, and the removal of Length from TArray, TMap and TSet.
---The regression behind all of it: assigning a live actor instance to a TSubclassOf<APawn> used to
---succeed, leaving an object pointer in a class-typed property for every later C++ read to dereference
---as a UClass*. Every rejection here is therefore asserted twice, once that the operation failed and
---once that the property still holds what it held before, because an implementation that raises and
---writes anyway passes the first assertion on its own. The accepting cases are mandatory for the
---mirror-image reason: an implementation that refuses everything passes every negative test.
---Needs a PIE or Standalone session with a live world, a player pawn and a game mode.
---@class UTempTest_LuaTypeSafety : UTestSuiteBase
---@field private Fixture UTempTest_LuaTypeSafety_Fixture
UTempTest_LuaTypeSafety = {}

---@param WorldContext UObject
function UTempTest_LuaTypeSafety:Start(WorldContext) end

