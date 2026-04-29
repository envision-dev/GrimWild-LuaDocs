---Button widget for UI category selection.
---@class UCategoryButton : UUserWidget
---@field public B_Content UGButton
---@field public MyCategoryAssetId FPrimaryAssetId @Set in UMG designer to preview and configure this button. Also assigned at runtime via Init().
---@field public OnPressed MulticastDelegate|fun(CategoryName: string)
UCategoryButton = {}

function UCategoryButton:Init_K2() end

function UCategoryButton:OnButtonPressed() end

---@param bInSelected boolean
function UCategoryButton:SwitchSelection(bInSelected) end

