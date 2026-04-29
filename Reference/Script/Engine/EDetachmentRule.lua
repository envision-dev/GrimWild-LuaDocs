---Rules for detaching components - needs to be kept synced to EAttachmentRule
---@class EDetachmentRule
---@field public KeepRelative EDetachmentRule [0] Keeps current relative transform.
---@field public KeepWorld EDetachmentRule [1] Automatically calculates the relative transform such that the detached component maintains the same world transform.
EDetachmentRule = {}
