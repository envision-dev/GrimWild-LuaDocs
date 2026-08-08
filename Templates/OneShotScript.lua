-- This is an example of OneShot (Fire-and-Forget, FAF) script that runs once and is never stored in module list.
-- One-shot scripts return nothing. They don't have OnConstruct, OnTick and OnDestruct functions.
-- Basics.md explains when to write one of these and when to write a persistent script instead.

LogInfo("Hello, ephemeral world!")

--At this point, the script is unloaded.
--no 'return' needed at all.