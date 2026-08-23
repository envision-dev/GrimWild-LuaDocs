---@meta
---Delegates and the Lua-to-C++ result channel used by UTempTest_LuaSparseDelegate.
---The delegate pair lives on a plain UObject so the two paths can be compared without a world;
---the actor slots exist separately, for the cases that need a delegate the engine itself declares.
---@class UTempTest_LuaSparseDelegate_Fixture : UObject
---@field public OnSparseEvent MulticastDelegate|fun(Value: integer) @---- delegates under test ----
---@field public OnInlineEvent MulticastDelegate|fun(Value: integer)
---@field public TargetActor AActor @The actor a Lua module is asked to subscribe to.
---@field public OtherActor AActor @A second actor of the same class, never subscribed to. Its invocation list staying empty is what rules out the engine resolving a sparse owner by scanning objects of the class.
---@field public SparseCallCount integer @---- proof that a Lua callback actually ran ----
---@field public InlineCallCount integer
---@field public ActorCallCount integer
---@field public LastValue integer
---@field public MetaName string @__name read off the metatable of the userdata Lua receives for OnSparseEvent.
---@field public bHasAdd boolean
---@field public bHasRemoveAll boolean @RemoveAll exists only on the project's override, never on the upstream method table, so this alone distinguishes which of the two is installed on the metatable.
---@field public AddFormUsed string @"none", "fn" or "object+fn": which Add call shape the Lua side got through with.
---@field public bAddReturnedHandle boolean @The project's Add answers with a table carrying Remove; the upstream one returns nothing.
---@field public bIsBoundFromLua boolean
---@field public ListenersRemovedCount integer @What the listener-removal methods answered with.
---@field public bTwoArgAddRejected boolean @Whether the two-argument call shape upstream UnLua accepts was refused, and with what message. Kept apart from LuaErrorMessage because both calls are made in one pass.
---@field public bTwoArgRemoveRejected boolean
---@field public TwoArgAddError string
---@field public TwoArgRemoveError string
---@field public bLuaCallFailed boolean
---@field public LuaErrorMessage string
UTempTest_LuaSparseDelegate_Fixture = {}

---Resolution channel for the Lua modules, which have no other way to reach this instance.
---@return UTempTest_LuaSparseDelegate_Fixture
function UTempTest_LuaSparseDelegate_Fixture.GetCurrent() end

