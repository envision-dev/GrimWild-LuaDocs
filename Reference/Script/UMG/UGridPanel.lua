---A table-like panel that retains the width of every column throughout the table.
---* Many Children
---@class UGridPanel : UPanelWidget
---@field public ColumnFill TArray<number> @The column fill rules
---@field public RowFill TArray<number> @The row fill rules
UGridPanel = {}

---@param Content UWidget
---@param InRow? integer @[default: 0]
---@param InColumn? integer @[default: 0]
---@return UGridSlot
function UGridPanel:AddChildToGrid(Content, InRow, InColumn) end

---@param ColumnIndex integer
---@param Coefficient number
function UGridPanel:SetColumnFill(ColumnIndex, Coefficient) end

---@param RowIndex integer
---@param Coefficient number
function UGridPanel:SetRowFill(RowIndex, Coefficient) end

