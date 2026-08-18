---Delegates, native entry points and the Lua-to-C++ result channel used by
---UTempTest_LuaDelegateAssignment. Deliberately a plain UObject: the suite must create no actors,
---components or tick sources.
---@class UTempTest_LuaDelegateAssignment_Fixture : UObject
---@field public OnSingleEvent Delegate|fun(Value: integer) @---- delegate fields under test ----
---@field public OnMulticastEvent MulticastDelegate|fun(Value: integer)
---@field public OnSparseEvent MulticastDelegate|fun(Value: integer)
---@field public StoredParameterCallback Delegate|fun(Value: integer) @Where a Lua function handed to a single-cast delegate-typed UFUNCTION parameter ends up. The script never sees this delegate, so the binding it holds can only have come through the parameter path.
---@field public ReceivedMulticastParameter MulticastDelegate|fun(Value: integer) @Destination for the multicast delegate parameter T18 needs. It stays empty for as long as the UFUNCTION that would fill it is absent - see StoreMulticastParameter below.
---@field public ControlNumber integer @---- plain property, the control for the refusal's blast radius ----
---@field public ControlNumberReadBack integer @What the Lua side read back out of ControlNumber right after writing it, so the control covers the round trip rather than only the write.
---@field public SingleCallCount integer @---- proof that a callback actually ran ----
---@field public LastSingleValue integer
---@field public OtherSingleCallCount integer @Second single-cast counter, so a refused assignment that silently replaced an existing binding shows up as the wrong callback running rather than as the right count.
---@field public LastOtherSingleValue integer
---@field public MulticastCallCountA integer
---@field public LastMulticastValueA integer
---@field public MulticastCallCountB integer
---@field public LastMulticastValueB integer
---@field public SparseCallCount integer
---@field public LastSparseValue integer
---@field public ParameterCallCount integer
---@field public LastParameterValue integer
---@field public NativeCallCount integer @Incremented by NativeHandler, so an assignment form that was supposed to be refused but quietly went through is visible as a native subscriber that fired.
---@field public LastNativeValue integer
---@field public LastDelegateArrayCount integer @How many delegates TakeDelegateArray was handed. Starts below zero so a body that never ran stays distinguishable from one handed an empty container.
UTempTest_LuaDelegateAssignment_Fixture = {}

---@param Value integer
function UTempTest_LuaDelegateAssignment_Fixture:BroadcastMulticast(Value) end

---@param Value integer
function UTempTest_LuaDelegateAssignment_Fixture:BroadcastSparse(Value) end

---@param Value integer
function UTempTest_LuaDelegateAssignment_Fixture:ExecuteStoredParameterCallback(Value) end

------- firing, from C++ ----
---@param Value integer
function UTempTest_LuaDelegateAssignment_Fixture:FireSingle(Value) end

function UTempTest_LuaDelegateAssignment_Fixture:ForceGarbageCollection() end

---Resolution channel for the generated Lua module, which has no other way to reach this instance.
---@return UTempTest_LuaDelegateAssignment_Fixture
function UTempTest_LuaDelegateAssignment_Fixture.GetCurrent() end

---@return boolean
function UTempTest_LuaDelegateAssignment_Fixture:IsMulticastBound() end

---@return boolean
function UTempTest_LuaDelegateAssignment_Fixture:IsReceivedMulticastParameterBound() end

------- what each field currently reports about itself ----
---@return boolean
function UTempTest_LuaDelegateAssignment_Fixture:IsSingleBound() end

---@return boolean
function UTempTest_LuaDelegateAssignment_Fixture:IsSparseBound() end

---@return boolean
function UTempTest_LuaDelegateAssignment_Fixture:IsStoredParameterCallbackBound() end

---Signature-compatible target for the { Object, "FunctionName" } assignment form.
---@param Value integer
function UTempTest_LuaDelegateAssignment_Fixture:NativeHandler(Value) end

---Called from Lua with the id the suite asked for, whether the pcall succeeded, and the error text
---when it did not. Reporting through a call rather than a return value keeps the result independent
---of what CallScriptFunction can marshal back out.
---@param OutcomeId string
---@param bSucceeded boolean
---@param ErrorText string
function UTempTest_LuaDelegateAssignment_Fixture:ReportOutcome(OutcomeId, bSucceeded, ErrorText) end

---Single-cast delegate as a UFUNCTION parameter: the path the refusal must not have touched.
---@param InCallback fun(Value: integer)
function UTempTest_LuaDelegateAssignment_Fixture:StoreParameterCallback(InCallback) end

---TArray of single-cast delegates as a UFUNCTION parameter, for the element-level refusal in T20.
---Plain UFUNCTION rather than BlueprintCallable: Blueprint exposure is the usual reason UHT refuses
---an exotic parameter shape, and nothing here needs to be callable from a graph. Taken by value,
---because a reference parameter can resolve to a real caller address in FFunctionDesc::PreCall and
---take the early-out that skips the parameter type check this test is about.
---@param InDelegates TArray<Delegate|fun(Value: integer)>
function UTempTest_LuaDelegateAssignment_Fixture:TakeDelegateArray(InDelegates) end

