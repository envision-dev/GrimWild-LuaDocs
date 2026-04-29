---In-game sprite editor. Also used as the content widget for Editor-only UObjectSpriteEditor.
---@class USpriteEditorWindow : UModEditorWindowBase
---@field protected CurrentSpriteData USpriteData
---@field protected CurrentSpriteIndex integer
---@field protected ETB_SpriteDataName UEditableTextBox @/Widgets
---@field protected B_LoadSpriteData UButton
---@field protected SB_SpriteIndex UGSpinBox
---@field protected SB_PivotPointX UGSpinBox
---@field protected SB_PivotPointY UGSpinBox
---@field protected CB_PivotPointUpdatesSockets UCheckBox
---@field protected B_AddSocket UButton
USpriteEditorWindow = {}

---Adds a new socket to the current object sprite
---@return boolean
function USpriteEditorWindow:AddSocket() end

---Input: an array of regular texture files on the disk.
---Output: a new file on the disk.
---Array index = the "channel" of the composite texture (e.g. 0 = Color+A, 1 = Tint...)
---@param InRawTextures TArray<string>
---@param OutputFilename string
---@return boolean
function USpriteEditorWindow:BuildAndSaveCompositeTexture(InRawTextures, OutputFilename) end

---@param PreviousName string
---@param NewName string
---@return boolean
function USpriteEditorWindow:ChangeSocketName(PreviousName, NewName) end

function USpriteEditorWindow:CopySocketsToClipboard() end

---@param SocketId string
function USpriteEditorWindow:CopySocketToClipboard(SocketId) end

---Adds an empty ObjectSprite to the end of the array. WARNING: Don't call this during gameplay, existing Sprite Ids may change
function USpriteEditorWindow:CreateNewSprite() end

---@param Direction integer
---@return integer
function USpriteEditorWindow:GetTileCondition(Direction) end

---@return boolean
function USpriteEditorWindow:IsCurrentSpriteValid() end

---Loads SpriteData from the SpriteDataName box value
function USpriteEditorWindow:LoadSpriteData() end

---@param InValue number
---@param CommitMethod integer
function USpriteEditorWindow:OnCurrentSpriteValueCommitted(InValue, CommitMethod) end

---@param InValue number
---@param CommitMethod integer
function USpriteEditorWindow:OnPivotPointBoxesChanged(InValue, CommitMethod) end

function USpriteEditorWindow:PasteSocketsFromClipboard() end

---Removes current sprite from the asset. WARNING: Don't call this during gameplay, existing Sprite Ids may change
function USpriteEditorWindow:RemoveCurrentSprite() end

---@param SocketId string
---@return boolean
function USpriteEditorWindow:RemoveSocket(SocketId) end

---NewSizeUV: normalized coordinates
---@param NewSizeUV FVector2D
function USpriteEditorWindow:SetSizeUV(NewSizeUV) end

---NewStartUV: normalized coordinates
---@param NewStartUV FVector2D
function USpriteEditorWindow:SetStartUV(NewStartUV) end

---Direction: from North, clockwise. NewValue: 0 = free, 1 = occupied, 2 = any
---@param Direction integer
---@param NewValue integer
function USpriteEditorWindow:SetTileCondition(Direction, NewValue) end

---@param bNewUseCRT boolean
function USpriteEditorWindow:SetUseCRT(bNewUseCRT) end

---@param Path string
---@param FileName string
function USpriteEditorWindow:Test_VAsset_Export(Path, FileName) end

---@param Filename string
function USpriteEditorWindow:Test_VAsset_Import(Filename) end

---@param SocketId string
---@param NewTransform FSpriteTransform
---@return boolean
function USpriteEditorWindow:UpdateSocketTransform(SocketId, NewTransform) end

