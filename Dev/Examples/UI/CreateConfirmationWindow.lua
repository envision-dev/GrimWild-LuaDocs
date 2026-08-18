local This = {}

-- Executes automatically after the script load
function This:OnConstruct()
    local HUD = GetPlayerController():GetGameHUD()

    --Create the confirmation window and call This.OnConfirmed when the player clicks "Confirm" inside it.
    local ConfWindow = HUD:CreateConfirmationWindow("Confirm?", This.OnConfirmed)
end

function This.OnConfirmed()
    LogWarn("Nice!")
    This:Unload()
end

return This