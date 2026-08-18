local M = {}

local function Log(Text)
    LogInfo("[TimerDemo] " .. Text)
end

function M:OnConstruct()
    Log("=== timer and routine demo ===")

    -- The whole demo runs inside a Routine so the sections happen one after another
    -- instead of all starting at once. Wait is only allowed in here.
    self.Demo = Routine(function()

        -- 1. A one-shot timer. Fires once, then it is gone.
        Log("1. one-shot timer, fires once in 1 second")
        SetTimer(1, function()
            Log("   fired")
        end)
        Wait(2)

        -- 2. A repeating timer. The counter lives in the closure, so it survives
        -- between occurrences. Ticker is declared before it is assigned, otherwise
        -- the callback could not see it.
        Log("2. repeating timer, every 0.5s, stops itself after 3")
        local Count = 0
        local Ticker
        Ticker = SetTimer(0.5, function()
            Count = Count + 1
            Log("   tick " .. Count)
            if Count == 3 then
                Ticker:Cancel()
                Log("   cancelled itself")
            end
        end, true)
        Wait(3)

        -- 3. Cancelling before it ever fires.
        Log("3. cancelling a timer before it fires")
        local Doomed = SetTimer(1, function()
            Log("   THIS SHOULD NEVER APPEAR")
        end)
        Log("   pending: " .. tostring(Doomed:IsPending()))
        Doomed:Cancel()
        Log("   pending after cancel: " .. tostring(Doomed:IsPending()))
        Doomed:Cancel()
        Log("   cancelling a second time is harmless")
        Wait(1.5)

        -- 4. There is no retriggerable timer. Cancel plus a fresh SetTimer is the pattern,
        -- and this is what to reach for when a Blueprint would use RetriggerableDelay.
        Log("4. restarting a countdown on every activity")
        local Idle
        local function OnActivity()
            if Idle then Idle:Cancel() end
            Idle = SetTimer(1, function()
                Log("   a full second passed with no activity")
            end)
        end
        OnActivity()
        Wait(0.4) OnActivity() Log("   activity, countdown restarted")
        Wait(0.4) OnActivity() Log("   activity, countdown restarted")
        Wait(1.5)

        -- 5. Everything survives a Wait: locals, loop counters, call depth.
        Log("5. locals and loops survive a Wait")
        for i = 1, 3 do
            local Label = "step " .. i
            Wait(0.5)
            Log("   " .. Label)
        end

        -- 6. A Routine can be cancelled while it is waiting. It never resumes.
        Log("6. cancelling a routine that is waiting")
        local Long = Routine(function()
            Wait(10)
            Log("   THIS SHOULD NEVER APPEAR")
        end)
        Wait(0.5)
        Long:Cancel()
        Log("   cancelled while it was waiting, it will not resume")

        -- 7. Anything still running belongs to this module and dies with it. That is why
        -- OnDestruct below has nothing to clean up.
        Log("7. this timer keeps running until the module is unloaded")
        self.Leftover = SetTimer(2, function()
            Log("   still alive. Unload this module to stop me.")
        end, true)

        Log("=== demo finished ===")
    end)
end

function M:OnDestruct()
    -- Deliberately empty. Timers and routines are owned by the module that created them,
    -- so unloading cancels them without anything here.
end

return M