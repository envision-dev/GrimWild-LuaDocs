---@meta
---Channel between the generated Lua modules and the suite.
---One counter per subscribed callback rather than one shared counter, because every question this
---suite asks is "which of these listeners survived", and a shared counter could not answer it.
---@class UTempTest_LuaCallbackOwnership_Fixture : UObject
---@field public OnEvent MulticastDelegate|fun(Value: integer)
---@field public OwnCallCount integer @A function the feature module defines and subscribes itself. The control case.
---@field public LibCallCount integer @A named function the library defines, subscribed by the feature. Owned by the library, which is what the ownership assertions are about.
---@field public FactoryCallCount integer @A closure the library builds on demand, holding nothing of the feature's. Owned by the library and, having captured nothing that can die, expected to outlive the feature.
---@field public CapturingCallCount integer @A closure the library builds around the feature's own module table. Owned by the library by definition site, but unusable once the feature is gone, which is what the upvalue sweep exists to catch.
---@field public DestructCapturingCallCount integer @Subscribed from OnDestruct with a callback that holds the module table.
---@field public NativeCallCount integer
---@field public LastValue integer
---@field public bLuaCallFailed boolean @---- reporting slots ----
---@field public LuaErrorMessage string
---@field public ListenersRemovedCount integer @What the last RemoveModuleListeners call answered. -1 means nothing wrote to it.
---@field public bAskOnDestructToRemove boolean @---- switches read by the module's OnDestruct ---- OnDestruct also runs on every ordinary reload, so the behaviours under test have to be asked for explicitly or they would fire in tests that are about something else.
---@field public bAskOnDestructToSubscribe boolean
UTempTest_LuaCallbackOwnership_Fixture = {}

---@return UTempTest_LuaCallbackOwnership_Fixture
function UTempTest_LuaCallbackOwnership_Fixture.GetCurrent() end

---Subscribed natively so every test keeps a listener no Lua-side cleanup may ever touch. A test
---that ends with this one missing has found cleanup reaching past the Lua layer.
---@param Value integer
function UTempTest_LuaCallbackOwnership_Fixture:NativeHandler(Value) end

