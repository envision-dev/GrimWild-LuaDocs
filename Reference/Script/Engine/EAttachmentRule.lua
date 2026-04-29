---Rules for attaching components - needs to be kept synced to EDetachmentRule
---@class EAttachmentRule
---@field public KeepRelative EAttachmentRule [0] Keeps current relative transform as the relative transform to the new parent.
---@field public KeepWorld EAttachmentRule [1] Automatically calculates the relative transform such that the attached component maintains the same world transform.
---@field public SnapToTarget EAttachmentRule [2] Snaps transform to the attach point
EAttachmentRule = {}
