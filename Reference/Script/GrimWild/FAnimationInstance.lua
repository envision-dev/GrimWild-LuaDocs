---@meta
---One instance of UAnimationData in the world.
---Transient.
---Made as struct for BP support.
---@class FAnimationInstance : Struct
---@field protected Ptr UAnimationData @Should be valid during entire Instance lifecycle
---@field public CustomTimeDilation number @Can be used to control the particular animation instance time dilation. E.g. Pawn walking animation speed depends on their MovementSpeed property
FAnimationInstance = {}
