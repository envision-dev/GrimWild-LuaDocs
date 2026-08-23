---@meta
---Containers, native entry points and the Lua-to-C++ result channel used by UTempTest_LuaContainerArgs.
---Deliberately a plain UObject: the suite must create no actors, components or tick sources.
---@class UTempTest_LuaContainerArgs_Fixture : UObject
---@field public IntItems TArray<integer> @---- containers under test ----
---@field public StringItems TArray<string>
---@field public ByteItems TArray<integer>
---@field public VectorItems TArray<FVector>
---@field public DerivedItems TArray<UTempTest_LuaContainerArgs_Derived>
---@field public ObjectItems TArray<UObject>
---@field public StringIntMap TMap<string, integer>
---@field public IntIntMap TMap<integer, integer>
---@field public IntSet TSet<integer>
---@field public CallCount integer @---- proof that a native entry point was reached ----
---@field public bLuaCallFailed boolean @---- result channel written by the Lua side ----
---@field public LuaErrorMessage string
---@field public bSecondLuaCallFailed boolean @Second outcome slot, so a test can report a rejection and a following valid call separately.
---@field public LastObjectCount integer @Written by the Lua side from CountObjects' return value, so the assertion covers the value that actually crossed back rather than one the callee stored on its way out.
---@field public LastStringsByValue TArray<string>
---@field public LastIntsByValue TArray<integer>
---@field public LastDefaultedExtra integer
---@field public SpareDerived UTempTest_LuaContainerArgs_Derived @Appended by the object-pointer growth entry points; held as a UPROPERTY so it survives GC.
UTempTest_LuaContainerArgs_Fixture = {}

---@param In TArray<UObject>
---@return integer
function UTempTest_LuaContainerArgs_Fixture:CountObjects(In) end

---Resolution channel for the generated Lua module, which has no other way to reach this instance.
---@return UTempTest_LuaContainerArgs_Fixture
function UTempTest_LuaContainerArgs_Fixture.GetCurrent() end

---@param InOut TArray<UTempTest_LuaContainerArgs_Derived> @[out, modified in place]
function UTempTest_LuaContainerArgs_Fixture:GrowDerivedArray(InOut) end

------- native entry points ----
---@param InOut TArray<integer> @[out, modified in place]
function UTempTest_LuaContainerArgs_Fixture:GrowIntArray(InOut) end

---@param InOut TMap<string, integer> @[out, modified in place]
function UTempTest_LuaContainerArgs_Fixture:GrowIntMap(InOut) end

---@param InOut TSet<integer> @[out, modified in place]
function UTempTest_LuaContainerArgs_Fixture:GrowIntSet(InOut) end

---@param InOut TArray<UObject> @[out, modified in place]
function UTempTest_LuaContainerArgs_Fixture:GrowObjectArray(InOut) end

---@param InOut TArray<string> @[out, modified in place]
function UTempTest_LuaContainerArgs_Fixture:GrowStringArray(InOut) end

---@param InOut TSet<string> @[out, modified in place]
function UTempTest_LuaContainerArgs_Fixture:GrowStringSet(InOut) end

---Declared over FRotator so a TArray<FVector> reaches it with a matching layout and a different type.
---@param InOut TArray<FRotator> @[out, modified in place]
function UTempTest_LuaContainerArgs_Fixture:GrowVectorArray(InOut) end

---@param In TArray<integer>
---@param Extra? integer @[default: 7]
function UTempTest_LuaContainerArgs_Fixture:TakeIntsWithDefault(In, Extra) end

---@param In TArray<string>
function UTempTest_LuaContainerArgs_Fixture:TakeStringsByValue(In) end

