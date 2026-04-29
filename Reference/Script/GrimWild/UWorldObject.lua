---Correct lifecycle: create via UGameWorld::CreateNewObject(), not NewObject<>()!
---@class UWorldObject : UWorldObjectBase
---@field protected ObjectFlags EWorldObjectFlags @A set of flags that define the object technical and gameplay behavior
---@field protected AttachChildren TMap<string, FObjectAttachment>
---@field protected AttachParent TWeakObjectPtr<UWorldObject> @Stores the Parent we've been strongly attached to. Note: Valid for Individual copies only. Static components can't know how many template copies and world instances have them referenced. Note: Does not store weak parents (objects we've been attached to with Weak Attachment).
---@field protected Owner TWeakObjectPtr<UWorldObject> @The object that owns this one. Separate from the attachment parent - ownership is a gameplay concept.
---@field public OnChildAttached MulticastDelegate @Fired when a new child has been attached to us.
---@field public OnAttached MulticastDelegate @Fired when this object has been attached to a new parent. Called for Strong or Weak individual copies only (not Static reference, not COW-Awaiting). Also called when a COW-Awaiting slot gets an individual copy. Note: fires for Individually attached objects only (Strong and Weak); not for Static one
---@field public OnChildDetached MulticastDelegate @Fired when any child (individual, weak or static) has been detached from us.
---@field public OnDetached MulticastDelegate @Fired when this object has been detached from its parent. TODO
---@field public OnOwnerChanged MulticastDelegate @Fired when our Owner changes. Null Owner means we're owned by the Game World or it's invalid (check for ObjectFlags: ValidOwner)
---@field protected bSelfVisible boolean
---@field public OnVisibilityChanged MulticastDelegate @Fired when the object's real Visibility changes (not SelfVisibility).
---@field public OnCollisionChanged MulticastDelegate @Fired when the object's real Collision changes (not SelfCollision).
---@field public OnInitialized MulticastDelegate @Fires right after the object has been initialized (AssetId, InstanceId, Archetype, Flags set), but no attachment (Parent, Owner), data loading and BeginPlay performed. It's a good place to bind game logic delegates.
---@field public OnBeganPlay MulticastDelegate @Fires right after BeginPlay() execution.
---@field public OnPreDestroy MulticastDelegate @Fires before object destruction. Our children are still valid, they'll be destroyed (strong individual) or detached (weak) after.
---@field public State FDynamicState
UWorldObject = {}

---Strong Individual Attachment. WI->WI or TC->TC only.
---@param ObjectToAttach UWorldObject
---@param AttachmentId string
---@return boolean
function UWorldObject:AttachObject(ObjectToAttach, AttachmentId) end

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

---Weak attachment. WI->WI only.
---@param ObjectToAttach UWorldObject
---@param AttachmentId string
---@return boolean
function UWorldObject:AttachObjectWeak(ObjectToAttach, AttachmentId) end

---Called after the object is fully initialized. Children (copied from template) have already begun play. Fires from leaves to root.
function UWorldObject:BeginPlay() end

---Can check for any type of attachment: static (if !TreatAsNonConst), weak (WeakAttachment), COW (TreatAsNonConst + COWAwaiting)
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

---Detaches a child by slot name. Works for any attachment type (strong, weak, COW-awaiting, static).
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
---@return UWorldObject
function UWorldObject:GetMyArchetype() end

---Retrieves the asset this template object belongs to.
---@return UGAssetBase
function UWorldObject:GetOuterAsset() end

---Retrieves the Game World this object belongs to. Works only for world instances (see IsWorldInstance())
---@return UGameWorld
function UWorldObject:GetOuterGameWorld() end

---BP or Lua version with additional checks. In C++, use raw versions
---@return UWorldObject
function UWorldObject:GetOwner() end

---Returns a const reference to the state of the object
---@return FDynamicState
function UWorldObject:GetState() end

---Returns a non-const reference to the state of the object
---@return FDynamicState
function UWorldObject:GetStateRef() end

---Returns true if the object is fully initialized and ready to be used in gameplay logic (BeginPlay called)
---@return boolean
function UWorldObject:HasBegunPlay() end

---Checks whether the object can be used in gameplay logic.
---Returns true if it's initialized (but may still have no initial attachment) and not marked for destruction (inside PreDestroy() it's still valid).
---Using gameplay-invalid objects in gameplay logic may lead to unexpected results.
---@return boolean
function UWorldObject:IsGameplayValid() end

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

---@return integer
function UWorldObject:K2_GetObjectFlags() end

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

---UFUNCTION(BlueprintPure)
---bool IsSelfCollisionEnabled() const { return Collision.SelfValue; }
---UFUNCTION(BlueprintPure)
---bool IsCollisionEnabled() const
---{
---       Top-Level objects don't have Parent Collision
---       return IsTopLevelObject()? Collision.SelfValue : Collision.GetFinalValue();
---}
---@param bVisibleNow boolean
function UWorldObject:SetSelfVisibility(bVisibleNow) end

---Works for AttachParent (strong) only. For Weak attachment, use TryDetachFromWeakParent().
---For Static attachment there is no way to detach a child from parent - only the parent can detach the child.
---@param bReAttaching? boolean @[default: true]
function UWorldObject:TryDetachFromParent(bReAttaching) end

---Detaches this object from a weak parent.
---@param WeakParent UWorldObject
---@param WeakAttachmentSlot string
function UWorldObject:TryDetachFromWeakParent(WeakParent, WeakAttachmentSlot) end

---Gathers all useful object instance debug data into string
---@param DebugString string @[out]
function UWorldObject:GatherDebugData(DebugString) end

