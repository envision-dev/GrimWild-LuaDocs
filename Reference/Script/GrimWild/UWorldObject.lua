---Correct lifecycle: create via UGameWorld::CreateNewObject(), not NewObject<>()!
---@class UWorldObject : UWorldObjectBase
---@field protected RuntimeState EWorldObjectRuntimeState @Runtime lifecycle state. Do not set directly.
---@field protected Role EWorldObjectRole @Whether this is a Native Template, Template Copy, or World Instance.
---@field public CopyPolicy ETemplateCopyPolicy @Controls which derived worlds/assets receive an individual copy of this object.
---@field public UserFlags EWorldObjectUserFlags @Opt-out gameplay flags (e.g. Transient to skip saving).
---@field protected AttachChildren TMap<string, FObjectAttachment>
---@field protected AttachmentSlots TMap<string, FAttachmentSlot> @Declared attachment slots. Optional — undeclared slots pass through CanAttachObject. RuntimeGenerated slots are excluded from save bytes.
---@field protected AttachParent TWeakObjectPtr<UWorldObject> @Stores the Parent we've been strongly attached to. Note: Valid for Individual copies only. Static components can't know how many template copies and world instances have them referenced. Note: Does not store shared parents (objects we've been attached to with Shared Attachment).
---@field protected Owner TWeakObjectPtr<UWorldObject> @The object that owns this one. Separate from the attachment parent - ownership is a gameplay concept.
---@field public OnChildAttached MulticastDelegate|fun(Object: UWorldObject, AttachmentSlot: string, AttachmentFlags: EObjectAttachmentFlags) @Fired when a new child has been attached to us.
---@field public OnAttached MulticastDelegate|fun(Object: UWorldObject, AttachmentSlot: string, AttachmentFlags: EObjectAttachmentFlags) @Fired when this object has been attached to a new parent. Called for Strong or Shared individual copies only (not Static reference, not COW-Awaiting). Also called when a COW-Awaiting slot gets an individual copy. Note: fires for Individually attached objects only (Strong and Shared); not for Static one
---@field public OnChildDetached MulticastDelegate|fun(Object: UWorldObject, AttachmentSlot: string, AttachmentFlags: EObjectAttachmentFlags) @Fired when any child (individual, shared or static) has been detached from us.
---@field public OnDetached MulticastDelegate|fun(Object: UWorldObject, AttachmentSlot: string, AttachmentFlags: EObjectAttachmentFlags) @Fired when this object has been detached from its parent.
---@field public OnOwnerChanged MulticastDelegate|fun(PreviousOwner: UWorldObject, NewOwner: UWorldObject) @Fired when our Owner changes. Null Owner means we're owned by the Game World or it's invalid (check for RuntimeState: ValidOwner)
---@field public OnSlotsChanged MulticastDelegate|fun(ChangedObject: UWorldObject) @Fired when AttachmentSlots map changes (entries added, removed, or flags changed).
---@field protected bSelfVisible boolean
---@field protected bSelfGameCollision boolean
---@field protected bSelfPlayerCollision boolean
---@field public OnVisibilityChanged MulticastDelegate|fun(bNewState: boolean) @Fired when the object's real Visibility changes (not SelfVisibility).
---@field public OnCollisionChanged MulticastDelegate|fun(bNewState: boolean) @Fired when the object's real Collision changes (not SelfCollision).
---@field public OnInitialized MulticastDelegate|fun() @Fires right after the object has been initialized (AssetId, InstanceId, Archetype, Role set), but no attachment (Parent, Owner), data loading and BeginPlay performed. It's a good place to bind game logic delegates.
---@field public OnBeganPlay MulticastDelegate|fun() @Fires right after BeginPlay() execution.
---@field public OnPreDestroy MulticastDelegate|fun() @Fires before object destruction. Our children are still valid, they'll be destroyed (strong individual) or detached (shared) after.
---@field public State FDynamicState
UWorldObject = {}

---Strong Individual Attachment. WI->WI or TC->TC only.
---@param ObjectToAttach UWorldObject
---@param AttachmentId string
---@return boolean
function UWorldObject:AttachObject(ObjectToAttach, AttachmentId) end

---Shared attachment. WI->WI only.
---@param ObjectToAttach UWorldObject
---@param AttachmentId string
---@return boolean
function UWorldObject:AttachObjectShared(ObjectToAttach, AttachmentId) end

---Static attachment. NT->TC, NT->WI, TC->WI. Only for objects from different worlds - the child must always be a Template.
---@param ObjectToAttach UWorldObject
---@param AttachmentId string
---@return boolean
function UWorldObject:AttachObjectStatic(ObjectToAttach, AttachmentId) end

---Static Copy-On-Write attachment. NT->WI, TC->WI.
---@param ObjectToAttach UWorldObject
---@param AttachmentId string
---@return boolean
function UWorldObject:AttachObjectStaticCOW(ObjectToAttach, AttachmentId) end

---Called after the object is fully initialized. Children (copied from template) have already begun play. Fires from leaves to root.
function UWorldObject:BeginPlay() end

---Can check for any type of attachment: static (if !TreatAsNonConst), shared (SharedAttachment), COW (TreatAsNonConst + COWAwaiting)
---@param AttachmentId string
---@param ObjectToAttach UWorldObject
---@param AttachmentFlags EObjectAttachmentFlags
---@return boolean
function UWorldObject:CanAttachObject(AttachmentId, ObjectToAttach, AttachmentFlags) end

---Iterates over all recursive children (strong individual) and throws an error if infinite loop was found.
---Note: it's a slow operation. Use this function only during development.
---@return boolean
function UWorldObject:Debug_CheckForInfiniteAttachmentLoop() end

---Removes the object and all attached objects from the world.
function UWorldObject:Destroy() end

---Detaches a child by slot name. Works for any attachment type (strong, shared, COW-awaiting, static).
---@param ChildAttachmentName string
---@param bReAttaching? boolean @[default: true]
function UWorldObject:DetachChild(ChildAttachmentName, bReAttaching) end

---Gets primary asset Id associated with this object
---@return FPrimaryAssetId
function UWorldObject:GetAssetId() end

---@param AttachmentId string
---@return UWorldObject
function UWorldObject:GetAttachChild(AttachmentId) end

---@param AttachmentId string
---@return UWorldObject
function UWorldObject:GetAttachChild_Mutable(AttachmentId) end

---@return TMap<string, FObjectAttachment>
function UWorldObject:GetAttachChildren() end

---@param bWarnIfInvalid? boolean @[default: true]
---@return UWorldObject
function UWorldObject:GetAttachParent(bWarnIfInvalid) end

---@return string
function UWorldObject:GetDebugName() end

---@return integer
function UWorldObject:GetInstanceId() end

---Returns the template object this instance was created from. Can be null for native templates.
---Blueprints / Lua: treat as const. It's prohibited to modify object archetypes.
---@return UWorldObject
function UWorldObject:GetMyArchetype() end

---Retrieves the asset this template object belongs to.
---@return UGAssetBase
function UWorldObject:GetOuterAsset() end

---Retrieves the Game World this object belongs to. Works only for world instances (see IsWorldInstance())
---@return UGameWorld
function UWorldObject:GetOuterGameWorld() end

---@return UWorldObject
function UWorldObject:GetOwner() end

---Returns a const reference to the state of the object
---@return FDynamicState
function UWorldObject:GetState() end

---@return FDynamicStateHandle
function UWorldObject:GetStateHandle() end

---Returns a non-const reference to the state of the object
---@return FDynamicState
function UWorldObject:GetStateRef() end

---Returns true if the object is fully initialized and ready to be used in gameplay logic (BeginPlay called)
---@return boolean
function UWorldObject:HasBegunPlay() end

---@return boolean
function UWorldObject:IsGameCollisionEnabled() end

---Checks whether the object can be used in gameplay logic.
---Returns true if it's initialized (but may still have no initial attachment) and not marked for destruction (inside PreDestroy() it's still valid).
---@return boolean
function UWorldObject:IsGameplayValid() end

---Returns true if this is a Native Template (the primary template object inside an asset).
---@return boolean
function UWorldObject:IsNativeTemplate() end

---@return boolean
function UWorldObject:IsPlayerCollisionEnabled() end

---@return boolean
function UWorldObject:IsSelfGameCollisionEnabled() end

---@return boolean
function UWorldObject:IsSelfPlayerCollisionEnabled() end

---@return boolean
function UWorldObject:IsSelfVisible() end

---Returns true if this object is a template (asset template or native template).
---@return boolean
function UWorldObject:IsTemplate() end

---Checks whether we're attached straight to the World itself
---@return boolean
function UWorldObject:IsTopLevelObject() end

---@return boolean
function UWorldObject:IsVisible() end

---Returns true if this object is a World Instance (not a template).
---@return boolean
function UWorldObject:IsWorldInstance() end

---@return ETemplateCopyPolicy
function UWorldObject:K2_GetCopyPolicy() end

---@return EWorldObjectRole
function UWorldObject:K2_GetRole() end

---@return EWorldObjectRuntimeState
function UWorldObject:K2_GetRuntimeState() end

---@return EWorldObjectUserFlags
function UWorldObject:K2_GetUserFlags() end

function UWorldObject:K2_Initialize() end

---Children are still valid at the point of execution.
function UWorldObject:K2_PreDestroy() end

---Replaces the given child with an individual copy of itself, making the attachment strong individual.
---Primarily used in Asset Editor, but works for all children in Game World too.
---Does nothing if the child is already a strong individual copy.
---@param ChildAttachmentId string
function UWorldObject:ReplaceChildWithIndividualCopy(ChildAttachmentId) end

---Replaces the given child with its archetype, making the attachment static.
---Primarily used in Asset Editor to remove individual copies, but it works for all types of children in Game World too.
---Please ensure that child's archetype is non-null before calling this.
---@param ChildAttachmentId string
---@param bDestroyPreviousChild boolean @useful only for strong individual attachment.
function UWorldObject:ReplaceChildWithItsArchetype(ChildAttachmentId, bDestroyPreviousChild) end

---@param bCollisionEnabledNow boolean
function UWorldObject:SetSelfGameCollision(bCollisionEnabledNow) end

---@param bCollisionEnabledNow boolean
function UWorldObject:SetSelfPlayerCollision(bCollisionEnabledNow) end

---@param bVisibleNow boolean
function UWorldObject:SetSelfVisibility(bVisibleNow) end

---Works for AttachParent (strong) only. For Shared attachment, use TryDetachFromSharedParent().
---For Static attachment there is no way to detach a child from parent - only the parent can detach the child.
---@param bReAttaching? boolean @[default: true]
function UWorldObject:TryDetachFromParent(bReAttaching) end

---Detaches this object from a shared parent.
---@param SharedParent UWorldObject
---@param SharedAttachmentSlot string
function UWorldObject:TryDetachFromSharedParent(SharedParent, SharedAttachmentSlot) end

---Gathers all useful object instance debug data into string
---@return string DebugString
function UWorldObject:GatherDebugData() end

