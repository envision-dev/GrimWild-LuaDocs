---@meta
---@class UDataTableFunctionLibrary : UBlueprintFunctionLibrary
UDataTableFunctionLibrary = {}

---Returns whether or not Table contains a row named RowName
---@param Table UDataTable
---@param RowName string
---@return boolean
function UDataTableFunctionLibrary.DoesDataTableRowExist(Table, RowName) end

---@param CurveTable UCurveTable
---@param RowName string
---@param InXY number
---@param ContextString string
---@return integer OutResult
---@return number OutXY
function UDataTableFunctionLibrary.EvaluateCurveTableRow(CurveTable, RowName, InXY, ContextString) end

---Export from the DataTable all the row for one column. Export it as string. The row name is not included.
---@param DataTable UDataTable
---@param PropertyName string
---@return TArray<string>
function UDataTableFunctionLibrary.GetDataTableColumnAsString(DataTable, PropertyName) end

---Get a Row from a DataTable given a RowName
---@param Table UDataTable
---@param RowName string
---@param OutRow FTableRowBase @[out, modified in place]
---@return boolean
function UDataTableFunctionLibrary.GetDataTableRowFromName(Table, RowName, OutRow) end

---@param Table UDataTable
---@param OutRowNames TArray<string> @[out, modified in place]
function UDataTableFunctionLibrary.GetDataTableRowNames(Table, OutRowNames) end

---GetDataTableRowFromName under another name.
---@param Table UDataTable 
---@param RowName string 
---@param OutRow lightuserdata @The struct the row is written into. Must be of the table's row type.
---@return boolean @True when the table holds a row of that name, in which case OutRow was written.
function UDataTableFunctionLibrary.GetTableDataRowFromName(Table, RowName, OutRow) end

---Copies a row of a data table into a struct that already exists. Called with a dot, not a colon.
---@param Table UDataTable 
---@param RowName string 
---@param OutRow lightuserdata @The struct the row is written into. Must be of the table's row type.
---@return boolean @True when the table holds a row of that name, in which case OutRow was written.
function UDataTableFunctionLibrary.GetDataTableRowFromName(Table, RowName, OutRow) end

---A copy of a row of a data table, as a struct of the table's row type, or nil when the table has no
---such row. Called with a dot, not a colon: the table is an ordinary first argument.
---@param Table UDataTable
---@param RowName string
---@return any
function UDataTableFunctionLibrary.GetRowDataStructure(Table, RowName) end
