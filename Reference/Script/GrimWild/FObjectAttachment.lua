---@class FObjectAttachment
---@field protected Id string
---@field protected Object UWorldObject @STRONG Attachment only: The object we're referring to. It may be our own copy or something not own by us like Static or Singleton. COW: refers to the Archetype (any template, not WorldInstance) initially; refers to the individual copy after GetObject_Mutable() call BPs: Don't use it directly! Use GetObject() or GetObject_Mutable() versions.
---@field protected WeakObjectInstanceId integer @WEAK Attachment only: The object we're referring to. Can be only a World Instance. Used for shared component. Dereferenced by referring to the game world object container.
---@field protected Flags EObjectAttachmentFlags
---@field protected AttachmentOuter TWeakObjectPtr<UWorldObject> @Outer object in which this attachment exists. Should always be valid during the regular slot lifecycle. For Individual copies, it's identical to Object->AttachParent.
FObjectAttachment = {}
