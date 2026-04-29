---Publicly available parameters, exposed to Proxy creation. Valid for empty scenes as well.
---Validness: Instant (updated inside the game frame)
---@class FSpriteProxyParameters : FDebuggable
---@field public bSelfActive boolean @Active = has visual representation (claimed Static Sprite Component) Inactive / Released = exists as data storage, not represented visually
---@field public SelfVisible boolean
---@field public Tint FColor
FSpriteProxyParameters = {}
