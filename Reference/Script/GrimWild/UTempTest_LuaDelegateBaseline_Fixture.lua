---@meta
---Delegates and the Lua-to-C++ result channel used by UTempTest_LuaDelegateBaseline.
---Deliberately a plain UObject: the suite must create no actors, components or tick sources.
---@class UTempTest_LuaDelegateBaseline_Fixture : UObject
---@field public OnEvent MulticastDelegate|fun(Value: integer) @---- delegates under test ----
---@field public OnOtherEvent MulticastDelegate|fun(Value: integer) @A second delegate of the same shape, so a removal scoped to one delegate can be told apart from one that swept every delegate the module subscribed to.
---@field public OnSingleEvent Delegate|fun(Value: integer)
---@field public StoredParameterCallback Delegate|fun(Value: integer) @Where a Lua function handed to a delegate-typed UFUNCTION parameter ends up. Such a binding is attached to a delegate the script never sees, so nothing else in the suite can reach it.
---@field public MulticastCallCount integer @---- proof that a callback actually ran ----
---@field public NativeCallCount integer
---@field public OtherCallCount integer
---@field public SubModuleCallCount integer @Written by the disposable module's own callback, so a test with two modules subscribed to the same delegate can tell whose listener ran.
---@field public OneShotCallCount integer
---@field public ParameterCallCount integer
---@field public SingleCallCountA integer
---@field public SingleCallCountB integer
---@field public LastValue integer
---@field public bLuaCallFailed boolean @---- result channel written by the Lua side ----
---@field public LuaErrorMessage string
---@field public bAddReturnedHandle boolean
---@field public RemovedCount integer @What delegate:Remove(fn) answered with, so the count is asserted on the value that actually crossed back rather than one inferred from a later broadcast.
---@field public ListenersRemovedCount integer @What the listener-removal methods answered with, kept apart from RemovedCount so a test can assert on both a removal by function and a scoped removal in the same pass.
---@field public bIsBoundFromLua boolean
UTempTest_LuaDelegateBaseline_Fixture = {}

---Resolution channel for the generated Lua modules, which have no other way to reach this
---instance.
---@return UTempTest_LuaDelegateBaseline_Fixture
function UTempTest_LuaDelegateBaseline_Fixture.GetCurrent() end

------- native subscriber, so RemoveAll's blast radius is measurable ----
---@param Value integer
function UTempTest_LuaDelegateBaseline_Fixture:NativeHandler(Value) end

---@param InCallback fun(Value: integer)
function UTempTest_LuaDelegateBaseline_Fixture:StoreParameterCallback(InCallback) end

