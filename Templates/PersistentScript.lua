-- Everything below is optional except "local This = {}" and "return This".
-- Basics.md explains what the engine does with each part.

local This = {}

---Set to 'true' to enable OnTick() execution from the start of the script lifecycle.
---We can also switch tick execution by calling This:SetTickEnabled() during lifecycle.  
This.StartWithTickEnabled = false

--- Executes on script load
function This:OnConstruct()
end

---Executes every game frame. 
---Ticking starts on load only if This.StartWithTickEnabled is true; This:SetTickEnabled() turns it on and off afterwards.
---@param DeltaTime number: time elapsed between the previous frame and the current frame, in seconds.
function This:OnTick(DeltaTime)
end

---Call This:Unload() function to unload this script, e.g. from a button callback.
---This triggers OnDestruct(), cleans up any delegate bindings created by this script, and removes it from the module list.
---Example:
---function This:OnButtonPressed()
---    This:Unload()
---end

---Called once, when this script is unloaded (via the This:Unload() function, or externally by the engine).
---Use this to undo anything OnConstruct() set up, e.g. releasing resources or state not already covered by automatic delegate cleanup.
function This:OnDestruct()
end

--Persistent scripts must return 'This' table.
return This
