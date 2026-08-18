---Channel between the generated Lua modules and the suite.
---Subscription is driven from here rather than by calling an exported function: the pattern under
---test is a module resubscribing from OnConstruct on every reload, and reproducing it any other way
---would exercise a path a mod author never takes.
---@class UTempTest_LuaListenerAccumulation_Fixture : UObject
---@field public OnEvent MulticastDelegate|fun(Value: integer)
---@field public SubscribeMode integer @Read by the module's OnConstruct to decide what to subscribe: 0 nothing, 1 its own function, 2 a closure the library builds, 3 a function the library exports.
---@field public ConstructCount integer @Bumped by every OnConstruct. A test that reloads twice and sees fewer than two of these is measuring a reload that did not happen, not an engine behaviour.
---@field public OwnCallCount integer
---@field public FactoryCallCount integer
---@field public SharedCallCount integer
---@field public NativeCallCount integer
---@field public bLuaCallFailed boolean
---@field public LuaErrorMessage string
UTempTest_LuaListenerAccumulation_Fixture = {}

---@return UTempTest_LuaListenerAccumulation_Fixture
function UTempTest_LuaListenerAccumulation_Fixture.GetCurrent() end

---Native subscriber, present in every test so a count of zero is distinguishable from a delegate
---that was emptied wholesale by something reaching past the Lua layer.
---@param Value integer
function UTempTest_LuaListenerAccumulation_Fixture:NativeHandler(Value) end

