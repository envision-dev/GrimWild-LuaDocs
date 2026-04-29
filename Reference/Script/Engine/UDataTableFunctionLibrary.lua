---@class UDataTableFunctionLibrary : UBlueprintFunctionLibrary
UDataTableFunctionLibrary = {}

---Add a row to a Data Table with the provided name and data.
---@param DataTable UDataTable
---@param RowName string
---@param RowData FTableRowBase
function UDataTableFunctionLibrary.AddDataTableRow(DataTable, RowName, RowData) end

---Returns whether or not Table contains a row named RowName
---@param Table UDataTable
---@param RowName string
---@return boolean
function UDataTableFunctionLibrary.DoesDataTableRowExist(Table, RowName) end

---@param CurveTable UCurveTable
---@param RowName string
---@param InXY number
---@param OutResult integer @[out]
---@param OutXY number @[out]
---@param ContextString string
function UDataTableFunctionLibrary.EvaluateCurveTableRow(CurveTable, RowName, InXY, OutResult, OutXY, ContextString) end

---Empty and fill a Data Table from CSV file.
---@param DataTable UDataTable
---@param CSVFilePath string
---@return boolean
function UDataTableFunctionLibrary.FillDataTableFromCSVFile(DataTable, CSVFilePath) end

---Empty and fill a Data Table from CSV string.
---@param DataTable UDataTable
---@param CSVString string
---@return boolean
function UDataTableFunctionLibrary.FillDataTableFromCSVString(DataTable, CSVString) end

---Empty and fill a Data Table from JSON file.
---@param DataTable UDataTable
---@param JSONFilePath string
---@param ImportRowStruct? UScriptStruct @[default: None]
---@return boolean
function UDataTableFunctionLibrary.FillDataTableFromJSONFile(DataTable, JSONFilePath, ImportRowStruct) end

---Empty and fill a Data Table from JSON string.
---@param DataTable UDataTable
---@param JSONString string
---@return boolean
function UDataTableFunctionLibrary.FillDataTableFromJSONString(DataTable, JSONString) end

---Export from the DataTable all the row for one column. Export it as string. The row name is not included.
---@param DataTable UDataTable
---@param PropertyName string
---@return TArray<string>
function UDataTableFunctionLibrary.GetDataTableColumnAsString(DataTable, PropertyName) end

---Get a Row from a DataTable given a RowName
---@param Table UDataTable
---@param RowName string
---@param OutRow FTableRowBase @[out]
---@return boolean
function UDataTableFunctionLibrary.GetDataTableRowFromName(Table, RowName, OutRow) end

---@param Table UDataTable
---@param OutRowNames TArray<string> @[out]
function UDataTableFunctionLibrary.GetDataTableRowNames(Table, OutRowNames) end


---@param P0 UDataTable 
---@param P1 string 
---@param P2 lightuserdata 
---@return boolean
function UDataTableFunctionLibrary.GetTableDataRowFromName(P0, P1, P2) end

---@param P0 UDataTable 
---@param P1 string 
---@param P2 lightuserdata 
---@return boolean
function UDataTableFunctionLibrary.GetDataTableRowFromName(P0, P1, P2) end
