--This is an example of Fire-and-Forget script that runs once and is never stored in module list.
--One-shot scripts must return no tables. They don't have OnConstruct, OnTick and OnDestruct functions.

print("Hello, ephemeral world!")

--At this point, the script is unloaded.