local This = {}

---Set to 'true' to enable OnTick() execution from the start of the script lifecycle.
---We can also switch tick execution by calling This.SetTickEnabled() during lifecycle.  
This.StartWithTickEnabled = false

--- Executes on script load
function This:OnConstruct()
end

---Executes every game frame. 
---Enable by setting This.StartWithTickEnabled to true or by calling This.SetTickEnabled()
---@param DeltaTime number: time elapsed between the previous frame and the current frame, in seconds.
function This:OnTick(DeltaTime)
end

---Call Unload() function to unload this script, e.g. from a button callback.
---This triggers OnDestruct(), cleans up any delegate bindings created by this script, and removes it from package.loaded.
---Example:
---function This:OnButtonPressed()
---    Unload()
---end

---Called once, when this script is unloaded (via the Unload() function, or externally by the engine).
---Use this to undo anything OnConstruct() set up, e.g. releasing resources or state not already covered by automatic delegate cleanup.
function This:OnDestruct()
end

return This
