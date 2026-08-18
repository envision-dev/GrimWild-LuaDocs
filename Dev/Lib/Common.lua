-- Shared helpers used across dev scripts.

local This = {}

--- Returns the playtest scene actor present in the current world.
---@return APlaytestScene|nil
function This.GetPlaytestScene()

    ---@type APlaytestScene
    local Scene = UGameplayStatics.GetActorOfClass(GetWorld(), APlaytestScene)

    if not Scene then
        LogError("APlaytestScene was not found in the current world")
        return nil
    end

    return Scene
end

return This
