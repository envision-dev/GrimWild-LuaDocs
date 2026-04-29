---Usage: Add this to the screen and bind OnConfirmedAction to any desired function to be executed on pressing "Confirm".
---@class UConfirmationWindow : UUserWidget
---@field protected TB_MainText UGTextBlock
---@field protected B_Confirm UButton
---@field protected B_Cancel UButton
UConfirmationWindow = {}

function UConfirmationWindow:OnCancelClicked() end

function UConfirmationWindow:OnConfirmClicked() end

