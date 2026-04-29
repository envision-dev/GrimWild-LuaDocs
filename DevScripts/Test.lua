local This = {}

This.StartWithTickEnabled = true
This.TickCounter = 0

function This:OnConstruct()
    LogError("Hello world")
    --local res = GetGameWorld().OnSyncTick:Add(function() print("Game Ticked!") end)

    local oss = require("Dev.Examples.OneShotScript")
end
function This:OnTick(DeltaTime)
    self.TickCounter = self.TickCounter + 1
    if self.TickCounter % 60 == 0 then
        print("[TickTest] OnTick fired " .. self.TickCounter .. " times")
    end
end

function This:OnDestruct()
    print("Goodbye")
end

return This