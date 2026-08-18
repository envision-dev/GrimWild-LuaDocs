---Channel between the generated Lua modules and the suite. Every callback the suite subscribes has
---its own counter, because "which listener survived" is the only question this suite ever asks and a
---shared counter could not answer it.
---@class UTempTest_LuaListenerOwnership_Fixture : UObject
---@field public OnEvent MulticastDelegate|fun(Value: integer)
---@field public LibCallCount integer @L.Callback, the shared library function module A subscribes.
---@field public FactoryCallCount integer @The closure L.MakeHandler() returns: defined inside L, obtained by A.
---@field public OwnCallCount integer @A function defined in A and subscribed by A. The control case.
---@field public LibOwnCallCount integer @A function L defines and L itself subscribes, so "unloading L removes nothing" cannot pass on an implementation that removes nothing at all.
---@field public CrossEnvCallCount integer @Subscribed by the module living in the throwaway env.
---@field public TailCallCount integer @Subscribed through a tail call, which destroys the frame that would name the subscriber.
---@field public SecondModuleCallCount integer @Subscribed by module B, used only by the two-modules-one-function test.
---@field public NativeCallCount integer
---@field public LastValue integer
---@field public SharedCallbackIdA string @Identity of the function each module actually subscribed, written as a string on the Lua side. Two modules meaning to subscribe "the same function" can end up holding two different objects once a reload has replaced the library table under one of them, and a deduplication test that cannot see that difference reports success without having exercised deduplication at all.
---@field public SharedCallbackIdB string
---@field public bLuaCallFailed boolean
---@field public LuaErrorMessage string
---@field public ListenersRemovedCount integer @What the last RemoveModuleListeners-style call answered. -1 means nothing wrote to it.
---@field public bAddReturnedHandle boolean
UTempTest_LuaListenerOwnership_Fixture = {}

---@return UTempTest_LuaListenerOwnership_Fixture
function UTempTest_LuaListenerOwnership_Fixture.GetCurrent() end

---Subscribed natively so every test has a listener that no Lua-side cleanup may ever touch. Any
---test that ends with this one missing has found cleanup reaching past the Lua layer.
---@param Value integer
function UTempTest_LuaListenerOwnership_Fixture:NativeHandler(Value) end

