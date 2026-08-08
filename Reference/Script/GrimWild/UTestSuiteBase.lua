---Base for automated test suites. Absorbs the bootstrap/lifecycle every concrete suite would otherwise
---copy (owning an FTestSequenceRunner, rooting itself for the lifetime of the run, wiring
---ResetToCleanState/TeardownSuite) and proxies the runner's assertion API so subclasses never need to name
---FTestSequenceRunner directly.
---A concrete suite declares its own entry point (its input type varies by suite, so the base cannot fix a
---signature), e.g. UFUNCTION(BlueprintCallable) void Start(UGameInstance* GameInstance); which resolves the
---suite's own dependencies into its own fields and then calls RunSuite(...).
---@class UTestSuiteBase : UObject
UTestSuiteBase = {}

