---@meta
---Modal confirmation dialog.
---Delegate contract: exactly one of OnConfirmedAction / OnCancelledAction fires, exactly once,
---no matter how the window disappears. Player input fires the matching delegate; every other
---removal path (programmatic RemoveFromParent, parent widget teardown, viewport destruction)
---fires OnCancelledAction as a fallback. There is no silent-close path, so callers may safely
---drive asynchronous flows from these delegates without their own timeout or watchdog.
---Anyone adding a new way to dismiss this window must preserve that guarantee.
---@class UConfirmationWindow : UUserWidget
---@field protected TB_MainText UGTextBlock
---@field protected B_Confirm UButton
---@field protected B_Cancel UButton
UConfirmationWindow = {}

function UConfirmationWindow:OnCancelClicked() end

function UConfirmationWindow:OnConfirmClicked() end

