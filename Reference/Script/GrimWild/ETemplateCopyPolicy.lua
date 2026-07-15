---Controls which derived worlds/assets receive an individual copy of a template object.
---@class ETemplateCopyPolicy
---@field public None ETemplateCopyPolicy [0]
---@field public CopyToAssets ETemplateCopyPolicy [1] Copy object into derived asset templates instead of referencing original
---@field public CopyToWorldInstances ETemplateCopyPolicy [2] Copy object into world instances
---@field public WorldInstancesWithCOW ETemplateCopyPolicy [4] World instance copies are created lazily (copy-on-write)
ETemplateCopyPolicy = {}
