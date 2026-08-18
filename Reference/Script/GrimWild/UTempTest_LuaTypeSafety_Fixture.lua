---Properties, native entry points and the Lua-to-C++ result channel used by UTempTest_LuaTypeSafety.
---Deliberately a plain UObject: the suite must create no actors, components or tick sources, and
---borrows the pawn and game mode the running session already has instead of spawning its own.
---@class UTempTest_LuaTypeSafety_Fixture : UObject
---@field public PawnClass TSubclassOf<APawn> @Class-typed slot, so FObjectPropertyDesc::IsValueAssignable classifies through its MetaClass branch.
---@field public PawnRef APawn @Plain object slot, so the same classifier takes its non-MetaClass branch instead.
---@field public PlayerPawn APawn @Accepted by PawnRef, and refused by PawnClass: an instance is not a class.
---@field public GameMode AGameModeBase @Refused by both: neither a class, nor of the lineage PawnRef declares.
---@field public SafePawnClass TSubclassOf<APawn> @The player pawn's own class. Accepted by PawnClass, and doubles as the suite's baseline value.
---@field public Numbers TArray<integer> @---- containers, for the Length-removal test ----
---@field public Lookup TMap<string, integer>
---@field public Ids TSet<integer>
---@field public PawnClasses TArray<TSubclassOf<APawn>> @Reaches FArrayPropertyDesc, with an element the classifier weighs through its MetaClass branch.
---@field public PawnRefs TSet<APawn> @Reaches FSetPropertyDesc, with an element weighed against PropertyClass instead.
---@field public ClassesByName TMap<string, TSubclassOf<APawn>> @Reaches FMapPropertyDesc on its value side alone: a string key can refuse nothing, so a refusal here can only have come from the value.
---@field public CountsByClass TMap<TSubclassOf<APawn>, integer> @The key side of the same descriptor, which is a separate write through a separate interface and is the one checked first.
---@field public CallCount integer @---- proof that a native entry point was reached ----
---@field public OutCallCount integer
---@field public ReturnCallCount integer
---@field public ArrayCallCount integer
---@field public LastReceivedClassName string @---- values captured by the native entry points ----
---@field public OutParamSlotOnEntry TSubclassOf<APawn> @What FillPawnClassOut found in its slot on entry. Held in a class-typed slot on purpose: this is the field the out-parameter test inspects for a pointer that has no business being there.
---@field public LastReceivedElementCount integer @How many elements TakePawnClassArray was handed. Starts below zero so a body that never ran stays distinguishable from one handed an empty container.
---@field public LastReceivedElementNames string @Names of the elements that were non-null when the body read them, so an element that failed to arrive shows up as a shorter list rather than as a value nobody may touch.
---@field public bLuaCallFailed boolean @---- result channel written by the Lua side ----
---@field public LuaErrorMessage string
---@field public bSecondLuaCallFailed boolean @Second outcome slot, so a test driving two call shapes can report each separately.
---@field public SecondLuaErrorMessage string
---@field public bThirdLuaCallFailed boolean @Third and fourth outcome slots. One test case has to drive all four container shapes, and a shared slot would let a later refusal stand in for an earlier one that never happened.
---@field public ThirdLuaErrorMessage string
---@field public bFourthLuaCallFailed boolean
---@field public FourthLuaErrorMessage string
---@field public ReturnedClassName string @Name of the class ReturnPawnClass handed back, read on the Lua side so the assertion covers the value that actually crossed rather than the one the callee returned.
---@field public LoadedName string
---@field public bLoadReturnedValue boolean
---@field public bArrayLengthWasNil boolean @---- container observations made on the Lua side ----
---@field public bMapLengthWasNil boolean
---@field public bSetLengthWasNil boolean
---@field public ArrayNumFromLua integer
---@field public MapNumFromLua integer
---@field public SetNumFromLua integer
UTempTest_LuaTypeSafety_Fixture = {}

---Out-parameter shape: a class-typed value travelling back out to Lua. Records whatever occupied
---the slot on entry before overwriting it, so a wrong-typed write into that slot stays visible
---after the call instead of being erased by the body.
---@param InOutClass TSubclassOf<APawn> @[out, modified in place]
function UTempTest_LuaTypeSafety_Fixture:FillPawnClassOut(InOutClass) end

---Resolution channel for the generated Lua module, which has no other way to reach this instance.
---@return UTempTest_LuaTypeSafety_Fixture
function UTempTest_LuaTypeSafety_Fixture.GetCurrent() end

---Return-slot shape of the same thing. Declared with no parameters so an argument supplied from
---Lua lands on the return property rather than on a parameter.
---@return TSubclassOf<APawn>
function UTempTest_LuaTypeSafety_Fixture:ReturnPawnClass() end

---Takes a class by value, so a wrong-typed argument is classified on the function-parameter path.
---Reads the argument as a plain UObject and never as a class, so a value that reached the body
---wrongly is recorded rather than dereferenced.
---@param InClass TSubclassOf<APawn>
function UTempTest_LuaTypeSafety_Fixture:TakePawnClass(InClass) end

---Takes its container by value, because a reference parameter can resolve to a real caller address
---in FFunctionDesc::PreCall and take the early-out that skips the parameter check entirely. Reads
---the elements as plain UObjects, so an element that arrived wrongly is counted rather than
---dereferenced.
---@param InClasses TArray<TSubclassOf<APawn>>
function UTempTest_LuaTypeSafety_Fixture:TakePawnClassArray(InClasses) end

