---Base class for creating game asset subclasses. GAssetManager operates on UGAssetBase.
---@class UGAssetBase : UPrimaryDataAsset
---@field public VisibleName FEText
---@field public Description FEText
---@field public State FDynamicState
---@field public bUAsset boolean @true = Unreal Asset (base game), false = VAsset (from mod)
---@field protected TemplateClass TSubclassOf<UWorldObject> @Inherited assets: leave null to use Parent Template as our Native Template; Define something, and instead of copying we'll create our own Native Template. TLDR: Inherited + TemplateClass == Parent.TemplateClass: copy template from Parent Template Inherited + TemplateClass != Parent.TemplateClass: create new template with our own class
---@field public OnInitialized MulticastDelegate @Fires when the asset object is created but not yet loaded. Ideal place to bind delegates.
---@field public OnLoadComplete MulticastDelegate @Fires when the basic asset info (not the Template object) has been loaded.
---@field public OnPreUnload MulticastDelegate @Fires before unloading the whole asset.
---@field public OnTemplatePreUnload MulticastDelegate @Fires before unloading the template object. Also fires when unloading the whole asset, since the template is unloaded too.
---@field protected TemplateObjects TMap<integer, TWeakObjectPtr<UWorldObject>>
---@field protected TopLevelObjects TMap<integer, UWorldObject>
UGAssetBase = {}

---Creates a copy of the given template and places it into this asset's world.
---To start copy object lifecycle you must attach it to another template object.
---@param TemplateToCopy UWorldObject
---@return UWorldObject
function UGAssetBase:CreateTemplateCopy(TemplateToCopy) end

---@return UWorldObject
function UGAssetBase:GetTemplate() end

---Gets the loaded Template object. Use IsTemplateLoaded()
---@return UWorldObject
function UGAssetBase:GetTemplate_Mutable() end

---@return boolean
function UGAssetBase:IsTemplateLoaded() end

function UGAssetBase:K2_Initialize() end

function UGAssetBase:K2_LoadComplete() end

function UGAssetBase:K2_PreUnload() end

---Gathers all useful object instance debug data into string
---@param DebugString string @[out]
function UGAssetBase:GatherDebugData(DebugString) end

