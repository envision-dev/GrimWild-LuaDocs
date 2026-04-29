---Hardcoded scene made for early playtest versions.
---It's just a wrapper around Game Level, use GetGameLevel() to access any gameplay data (cell buffers, size...).
---@class APlaytestScene : AActor
---@field protected GameLevel UGameLevel
---@field protected RT_WorldHeightDiff UTextureRenderTarget2D
---@field protected WorldHeightDiffMaker UGPUPass
---@field protected WallShadowsMaterial UMaterialInterface
---@field protected MID_WallShadows UMaterialInstanceDynamic
---@field public InitialLevelSize FVector2D
---@field public InputWorldHeight UTexture @Texture we create initial WorldHeight buffer values from
---@field public BufferName_WorldHeight string
---@field public BufferName_CellFeatures string
---@field public BufferName_Restrictions string
---@field public BufferName_Heat string
---@field public BufferName_HeatCond string
---@field public OverlayName_Roofs string
---@field public OverlayMesh UStaticMeshComponent @Created at runtime
---@field public SurfaceDefs TArray<FPlaytestSurfaceDef>
---@field public OverlayDefs TMap<string, FPlaytestOverlayDef>
---@field public Surfaces TMap<string, FPlaytestSurfaceInstance>
---@field public LiquidDefs TArray<FPlaytestLiquidDef>
---@field public Liquids TMap<string, FPlaytestLiquidInstance>
---@field public LiquidNameRegistry FNameRegistry
---@field public bIsLeftMousePressing boolean
---@field public Overlays TMap<string, FPlaytestOverlayInstance>
---@field public CurrentOverlay string
---@field public OnOverlayListUpdated MulticastDelegate|fun()
---@field public OverlayZOrder integer
---@field public CurrentTask UPlayerTask
---@field public bRunLevelChange boolean
---@field public LevelChangeWork UGPUPass_LevelChange
---@field public HeatDiffusionWork UGPUPass_Diffusion
---@field public HeatAtmosphereWork UGPUPass_Atmosphere
APlaytestScene = {}

---@param OverlayName string
---@param Buffer FCellBufferHandle
---@param OverlayMaterial UMaterialInstanceDynamic
function APlaytestScene:AddOverlay(OverlayName, Buffer, OverlayMaterial) end

---@param Cell integer
---@return FVector2D
function APlaytestScene:CellIndexToLocation(Cell) end

---@param BufferName string
function APlaytestScene:CountFloatBufferValues(BufferName) end

---@param Name string
function APlaytestScene:DebugOverlayBuffer(Name) end

function APlaytestScene:DestroyCurrentTask() end

function APlaytestScene:DrawInputTextureToWorldHeight() end

---Integer part is the cell index, fractional part is the in-cell UV offset
---@return FVector2D
function APlaytestScene:GetCellCoordsUnderCursor() end

---@return integer
function APlaytestScene:GetCellUnderCursor() end

---@param OutX integer @[out]
---@param OutY integer @[out]
function APlaytestScene:GetCellUnderCursor_2D(OutX, OutY) end

---@return UGameLevel
function APlaytestScene:GetGameLevel() end

---@return FCellBufferHandle
function APlaytestScene:GetHeatBuffer() end

---@return FLinearColor
function APlaytestScene:GetLevelSizeVectorParam() end

---@return ULightManager
function APlaytestScene:GetLightManager() end

---@return FCellBufferHandle
function APlaytestScene:GetLiquidsBuffer() end

---@param LiquidDefIndex integer
---@return number
function APlaytestScene:GetLiquidZOffset(LiquidDefIndex) end

---@param Offset FVector2D @[out]
---@param Scale FVector2D @[out]
function APlaytestScene:GetPlaneTransform(Offset, Scale) end

---@param SurfaceName string
---@return FCellBufferHandle
function APlaytestScene:GetSurfaceBuffer(SurfaceName) end

---@param Cell integer
---@return string
function APlaytestScene:GetSurfaceName(Cell) end

---@param SurfaceDefIndex integer
---@return number
function APlaytestScene:GetSurfaceZOffset(SurfaceDefIndex) end

---@return number
function APlaytestScene:GetWallShadowZOffset() end

---@return FCellBufferHandle
function APlaytestScene:GetWorldHeightBuffer() end

---@param InEvent integer
function APlaytestScene:OnLeftMouseAction(InEvent) end

function APlaytestScene:OnPreSyncProcess_Game_Liquids() end

---@param BufferHandle FCellBufferHandle
function APlaytestScene:OnWorldHeightPreSync(BufferHandle) end

---@param OverlayName string
function APlaytestScene:RemoveOverlay(OverlayName) end

function APlaytestScene:ResetLevel() end

---@param NewOverlay string
function APlaytestScene:SetCurrentOverlay(NewOverlay) end

---@param Task UPlayerTask
function APlaytestScene:SetCurrentTask(Task) end

---@param NewType ELevelChangeType
function APlaytestScene:SetLevelChangeType(NewType) end

---@param LiquidName string
---@param Cell integer
function APlaytestScene:SetLiquidAtCell(LiquidName, Cell) end

function APlaytestScene:SwitchLevelChange() end

