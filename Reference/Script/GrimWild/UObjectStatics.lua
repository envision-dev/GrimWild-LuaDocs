---@class UObjectStatics : UBlueprintFunctionLibrary
UObjectStatics = {}

---@param Attachment FObjectAttachment
---@return UWorldObject
function UObjectStatics.GetObject(Attachment) end

---@param Attachment FObjectAttachment @[out, modified in place]
---@return UWorldObject
function UObjectStatics.GetObject_Mutable(Attachment) end

---@param Attachment FObjectAttachment
---@return boolean
function UObjectStatics.IsAttachmentIndividualStrong(Attachment) end

---@param Attachment FObjectAttachment
---@return boolean
function UObjectStatics.IsAttachmentShared(Attachment) end

---@param Attachment FObjectAttachment
---@return boolean
function UObjectStatics.IsAttachmentStaticNow(Attachment) end

