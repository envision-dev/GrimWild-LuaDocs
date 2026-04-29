---@class USpriteData : UGAssetBase
---@field protected Type ESpriteDataType
---@field protected Sprites TArray<FObjectSprite>
---@field protected TileMap TArray<integer> @An array of 256 elements (2^8) to hold every possible neighbor condition set. "Any" neighbor state gets converted to both "1" and "0" here, so we store every possible condition we can ever meet. We can safely use an array instead of TMap. Well-designed tile set simply contains all possible conditions to cover all 256 ways of wall placement. (in form of "Any" neighbors that get converted to both variants) Condition array (mask) = element index (converted to value, since they're all unique) Sprite Index = element value
USpriteData = {}

function USpriteData:GenerateTileMap() end

---Gets ObjectSprite non-const reference from the given Index. Allows us to edit sprite contents.
---Note: this will crash if the target Index sprite is not found. To check this, use IsValidIndex()
---@param SpriteIndex? integer @[default: 0]
---@return FObjectSprite
function USpriteData:GetSprite(SpriteIndex) end

---@return TArray<FObjectSprite>
function USpriteData:GetSprites() end

---For tile sets only. Returns the sprite index of the tile that meets the given conditions.
---Bit order: from North, clockwise (N, NE, E, SE, S, SW, W, NW).
---@param ConditionMask integer
---@param bWarnIfNotFound? boolean @[default: true]
---@return integer
function USpriteData:GetTileIndex(ConditionMask, bWarnIfNotFound) end

---@return ESpriteDataType
function USpriteData:GetType() end

---Checks whether this SpriteData object contains a valid sprite index.
---@param SpriteIndex? integer @[default: 0]
---@return boolean
function USpriteData:IsValidSpriteIndex(SpriteIndex) end

---@param NewType ESpriteDataType
function USpriteData:SetType(NewType) end

---Gathers all useful object instance debug data into string
---@param DebugString string @[out]
function USpriteData:GatherDebugData(DebugString) end

