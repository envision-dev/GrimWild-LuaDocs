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

---Executes before script unload
function This:OnDestruct()
end

return This
