---Properties, native entry points and the Lua-to-C++ result channel used by UTempTest_LuaBindingContract.
---Deliberately a plain UObject: the suite must create no actors, components or tick sources.
---The object-typed properties are the dangerous ones. A write the binding layer refuses but performs
---anyway leaves an address that is not a UObject inside a UPROPERTY, which the garbage collector would
---later walk, so the suite clears them through ClearObjectProperties from C++ rather than from script.
---@class UTempTest_LuaBindingContract_Fixture : UObject
---@field public IntValue integer @---- scalar properties ----
---@field public FloatValue number
---@field public bBoolValue boolean
---@field public StringValue string
---@field public NameValue string
---@field public MoodValue ETempTest_LuaBindingContract_Mood
---@field public VectorValue FVector @Flat struct, and the value every test that needs a full userdata that is not an object uses.
---@field public NestedValue FTempTest_LuaBindingContract_Outer @Three levels, so one Lua expression can reach the innermost field through two intermediate reads.
---@field public ObjectRef UObject @Accepts any object, so a refusal observed here can only have come from the value's shape.
---@field public PawnRef APawn @Refuses almost everything, for the wrong-class case.
---@field public SourceObject UTempTest_LuaBindingContract_Other @A live object of an acceptable class, seeded by the suite and only ever read from script.
---@field public ClassRef TSubclassOf<UObject> @The destination for a bare type table, which the binding layer resolves to a UClass through the ClassDesc a published type table carries rather than through an object binding.
---@field public Numbers TArray<integer> @---- container properties ----
---@field public MoreNumbers TArray<integer> @Same element type as Numbers, so Append has a source it must accept.
---@field public Names TArray<string> @Different element type, so Append has a source it must refuse.
---@field public Lookup TMap<integer, integer>
---@field public Ids TSet<integer>
---@field public OnEvent MulticastDelegate|fun(Value: integer) @---- delegate ----
---@field public TypeProbeR27 integer @One probe per test that reaches a property through the type name instead of through an instance. They are never shared, because the defect they are aimed at is order-dependent: the first access to a property populates a cache on the class table on its way to failing, and a probe another test already touched would arrive at the second attempt's behaviour on its first.
---@field public TypeProbeD07 integer
---@field public TypeProbeD09 integer
---@field public TypeProbeD10 integer
---@field public TypeProbeD11 integer
---@field public TypeProbeD12 integer
---@field public TypeProbeD13 integer
---@field public PingCount integer
---@field public LastPingValue integer
---@field public LastPingClass TSubclassOf<UObject>
---@field public CallbackCount integer @---- proof that a delegate callback ran ----
---@field public LastCallbackValue integer
---@field public ObservedInt integer @---- observations made on the Lua side ----
---@field public ObservedFloat number
---@field public bObservedBool boolean
---@field public ObservedString string
---@field public ObservedName string
---@field public ObservedEnum integer
---@field public ObservedTypeName string @Metatable name of a value read from a property, which is how a leaked internal descriptor is told apart from the type the property actually declares.
---@field public ObservedValueType string @Lua's own type() of a value, recorded per attempt, because one test asserts across two attempts.
---@field public ObservedSecondValueType string
---@field public bObservedFirst boolean @Three generic yes/no slots. Several tests record more than one boolean observation, and a shared slot would let a later answer stand in for an earlier one that was never produced.
---@field public bObservedSecond boolean
---@field public bObservedThird boolean
---@field public ObservedCount integer
---@field public bLuaCallFailed boolean @---- result channel written by the Lua side ----
---@field public LuaErrorMessage string
---@field public bSecondLuaCallFailed boolean
---@field public SecondLuaErrorMessage string
---@field public bThirdLuaCallFailed boolean
---@field public ThirdLuaErrorMessage string
UTempTest_LuaBindingContract_Fixture = {}

---Resolution channel for the generated Lua module, which has no other way to reach this instance,
---and the static UFUNCTION the Type.Func() call shape is asserted against.
---@return UTempTest_LuaBindingContract_Fixture
function UTempTest_LuaBindingContract_Fixture.GetCurrent() end

------- native entry point ----
---@param Value integer
function UTempTest_LuaBindingContract_Fixture:Ping(Value) end

---The same value shape as ClassRef, reached as a function parameter instead of as a property,
---because the two go through different entry points into the same descriptor.
---@param InClass TSubclassOf<UObject>
function UTempTest_LuaBindingContract_Fixture:PingClass(InClass) end

