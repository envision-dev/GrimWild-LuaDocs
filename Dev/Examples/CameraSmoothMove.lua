-- Moves the camera from one point to another over a fixed duration, then unloads itself.
-- Shows a persistent module driving work from OnTick and ending its own lifetime.

local This = {}

-- PARAMETERS (edit before running)
local StartCameraLocation = FVector2D(0, 0)
local EndCameraLocation = FVector2D(10000, 5000)
local Duration = 5.0
local EaseType = {
    Linear = 1,
    Ease = 2,
    Cubic = 3,
}
local SelectedEaseType = EaseType.Cubic

-- A persistent module has no separate "run" entry point, so the animation has to start ticking the
-- moment the module loads.
This.StartWithTickEnabled = true

local ElapsedTime = 0

local function EaseAlpha(Alpha, Type)
    if Type == EaseType.Cubic then
        if Alpha < 0.5 then
            return 4 * Alpha * Alpha * Alpha
        end
        local Remainder = -2 * Alpha + 2
        return 1 - (Remainder * Remainder * Remainder) / 2
    elseif Type == EaseType.Ease then
        if Alpha < 0.5 then
            return 2 * Alpha * Alpha
        end
        local Remainder = -2 * Alpha + 2
        return 1 - (Remainder * Remainder) / 2
    end
    return Alpha
end

function This:OnConstruct()
    ElapsedTime = 0
end

function This:OnTick(DeltaTime)
    ElapsedTime = ElapsedTime + DeltaTime

    -- Guard against Duration <= 0, which would otherwise divide by zero.
    local Alpha = Duration > 0 and math.min(ElapsedTime / Duration, 1.0) or 1.0
    local EasedAlpha = EaseAlpha(Alpha, SelectedEaseType)

    local NewX = StartCameraLocation.X + (EndCameraLocation.X - StartCameraLocation.X) * EasedAlpha
    local NewY = StartCameraLocation.Y + (EndCameraLocation.Y - StartCameraLocation.Y) * EasedAlpha
    local NewLocation = FVector2D(NewX, NewY)

    GetPlayerPawn():SetCameraLocation(NewLocation, false)

    if Alpha >= 1.0 then
        This:Unload()
    end
end

return This
