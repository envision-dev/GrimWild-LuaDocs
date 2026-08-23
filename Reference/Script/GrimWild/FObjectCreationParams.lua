---@meta
---Parameters for UGameWorld::CreateNewObject().
---@class FObjectCreationParams : Struct
---@field public bAttachToWorld boolean @Attaches the newly-created object to the world as a top-level object. Set to false for manual attachment.
---@field public bOverrideTransient boolean @When true, overrides the object's Transient flag with bOverriddenTransient.
---@field public bOverriddenTransient boolean @The target Transient state when bOverrideTransient is true.
FObjectCreationParams = {}
