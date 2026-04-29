---Coordinate space for socket transform queries on UStaticSpriteComponent.
---Location in the returned FSpriteTransform is always in _UU (Unreal Units).
---@class ESpriteSocketSpace
---@field public Relative ESpriteSocketSpace [0] Transform relative to the sprite's pivot point (no parent world offset). Location in _UU.
---@field public World ESpriteSocketSpace [1] Transform in world space. Location in _UU.
ESpriteSocketSpace = {}
