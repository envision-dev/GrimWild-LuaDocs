---Stylized UProgressBar wrapper with Envision color style and alternate look support.
---@class UGProgressBar : UProgressBar
---@field public WidgetColorStyle FWidgetColorStyle
---@field public bAlternateLook boolean
UGProgressBar = {}

---@param bNewAlternateLook boolean
function UGProgressBar:SetAlternateLook(bNewAlternateLook) end

---@param NewStyle FWidgetColorStyle
function UGProgressBar:SetWidgetColorStyle(NewStyle) end

function UGProgressBar:ApplyStyle() end

