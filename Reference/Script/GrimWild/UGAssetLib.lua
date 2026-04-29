---Blueprint function library for GAsset management: loading, unloading, event binding.
---@class UGAssetLib : UBlueprintFunctionLibrary
UGAssetLib = {}

---Fired on any asset
---@param Event Delegate|fun(AssetId: FPrimaryAssetId, MutableObject: UObject)
function UGAssetLib.BindEventOnAnyAssetEditAllowed(Event) end

---Fired on any asset
---@param Event Delegate|fun(AssetId: FPrimaryAssetId, LoadedObject: UObject)
function UGAssetLib.BindEventOnAnyAssetLoaded(Event) end

---Fired on any Template
---@param Event Delegate|fun(AssetId: FPrimaryAssetId, MutableObject: UObject)
function UGAssetLib.BindEventOnAnyTemplateEditAllowed(Event) end

---Fired on any Template
---@param Event Delegate|fun(AssetId: FPrimaryAssetId, LoadedObject: UObject)
function UGAssetLib.BindEventOnAnyTemplateLoaded(Event) end

---Bind to a specific Asset
---@param AssetId FPrimaryAssetId
---@param Event Delegate|fun(AssetId: FPrimaryAssetId, MutableObject: UObject)
---@return boolean
function UGAssetLib.BindEventOnAssetEditAllowed(AssetId, Event) end

---Bind to a specific Asset
---@param AssetId FPrimaryAssetId
---@param Event Delegate|fun(AssetId: FPrimaryAssetId, LoadedObject: UObject)
---@return boolean
function UGAssetLib.BindEventOnAssetLoaded(AssetId, Event) end

---Bind to a specific asset Template
---@param AssetId FPrimaryAssetId
---@param Event Delegate|fun(AssetId: FPrimaryAssetId, MutableObject: UObject)
---@return boolean
function UGAssetLib.BindEventOnTemplateEditAllowed(AssetId, Event) end

---Bind to a specific asset Template
---@param AssetId FPrimaryAssetId
---@param Event Delegate|fun(AssetId: FPrimaryAssetId, LoadedObject: UObject)
---@return boolean
function UGAssetLib.BindEventOnTemplateLoaded(AssetId, Event) end

---@param AssetId FPrimaryAssetId
---@return boolean
function UGAssetLib.DoesAssetExist(AssetId) end

---@param AssetId FPrimaryAssetId
---@return EGAssetFormat
function UGAssetLib.GetAssetFormat(AssetId) end

---@param AssetId FPrimaryAssetId
---@return EGLoadStatus
function UGAssetLib.GetAssetLoadStatus(AssetId) end

---Returns a valid object only if the Asset is loaded into memory
---@param AssetId FPrimaryAssetId
---@return UGAssetBase
function UGAssetLib.GetAssetObject(AssetId) end

---@param AssetType FPrimaryAssetType
---@param OutAssets TArray<FPrimaryAssetId> @[out]
function UGAssetLib.GetAssetsOfType(AssetType, OutAssets) end

---Returns a valid object only if the Template is loaded into memory
---@param OuterAssetId FPrimaryAssetId
---@return UWorldObject
function UGAssetLib.GetTemplateObject(OuterAssetId) end

---@param AssetId FPrimaryAssetId
---@return UGAssetBase
function UGAssetLib.LoadGAssetSync(AssetId) end

---@param AssetId FPrimaryAssetId
---@return UWorldObject
function UGAssetLib.LoadGAssetTemplateSync(AssetId) end

---Fired on any asset
---@param Event Delegate|fun(AssetId: FPrimaryAssetId, MutableObject: UObject)
function UGAssetLib.UnbindEventOnAnyAssetEditAllowed(Event) end

---Fired on any asset
---@param Event Delegate|fun(AssetId: FPrimaryAssetId, LoadedObject: UObject)
function UGAssetLib.UnbindEventOnAnyAssetLoaded(Event) end

---Fired on any Template
---@param Event Delegate|fun(AssetId: FPrimaryAssetId, MutableObject: UObject)
function UGAssetLib.UnbindEventOnAnyTemplateEditAllowed(Event) end

---Fired on any Template
---@param Event Delegate|fun(AssetId: FPrimaryAssetId, LoadedObject: UObject)
function UGAssetLib.UnbindEventOnAnyTemplateLoaded(Event) end

---Unbind from a specific Asset. @@returns true even if the given event was not actually bound there.
---@param AssetId FPrimaryAssetId
---@param Event Delegate|fun(AssetId: FPrimaryAssetId, MutableObject: UObject)
---@return boolean
function UGAssetLib.UnbindEventOnAssetEditAllowed(AssetId, Event) end

---Unbind from a specific Asset. @@returns true even if the given event was not actually bound there.
---@param AssetId FPrimaryAssetId
---@param Event Delegate|fun(AssetId: FPrimaryAssetId, LoadedObject: UObject)
---@return boolean
function UGAssetLib.UnbindEventOnAssetLoaded(AssetId, Event) end

---Unbind from a specific asset Template. @@returns true even if the given event was not actually bound there.
---@param AssetId FPrimaryAssetId
---@param Event Delegate|fun(AssetId: FPrimaryAssetId, MutableObject: UObject)
---@return boolean
function UGAssetLib.UnbindEventOnTemplateEditAllowed(AssetId, Event) end

---Unbind from a specific asset Template. @@returns true even if the given event was not actually bound there.
---@param AssetId FPrimaryAssetId
---@param Event Delegate|fun(AssetId: FPrimaryAssetId, LoadedObject: UObject)
---@return boolean
function UGAssetLib.UnbindEventOnTemplateLoaded(AssetId, Event) end

---@param AssetId FPrimaryAssetId
function UGAssetLib.UnloadGAsset(AssetId) end

