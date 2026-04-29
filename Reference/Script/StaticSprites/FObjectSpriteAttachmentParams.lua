---@class FObjectSpriteAttachmentParams
---@field public ParentProxyId integer @Parent to attach the proxy to. Use INDEX_NONE to make it a root! INVALID_PARENT_INDEX not allowed
---@field public ParentSocket string @Socket of the Parent object sprite we're attaching to
---@field public RelativeTransform FSpriteTransform @Transform relative to the attachment (i.e. parent + parent socket + my socket)
---@field public RelativeRenderPriority integer @Render Priority offset, relative to the parent
FObjectSpriteAttachmentParams = {}
