---What to do with the Children of the Sprite Instance we're about to destroy
---@class ESpriteDestroyChildrenAction
---@field public Destroy ESpriteDestroyChildrenAction [0]
---@field public ReattachToMyParent ESpriteDestroyChildrenAction [1] Destroying all of them recursively
---@field public ReattachToMyRoot ESpriteDestroyChildrenAction [2] Reattaching all the top-level children to the Sprite Instance's Parent
---@field public MakeRoots ESpriteDestroyChildrenAction [3] Reattaching all the top-level children to the Sprite Instance's parent Root scene
ESpriteDestroyChildrenAction = {}
