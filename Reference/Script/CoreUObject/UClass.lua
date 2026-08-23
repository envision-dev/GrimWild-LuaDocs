---@meta
---@class UClass : UStruct
UClass = {}

---Load a class by its UE reference path. Example: UClass.Load("/Game/Core/Blueprints/AICharacter.AICharacter_C").
---Note: there is a _C at the end of the path.
---Raises an error when the path resolves to nothing, and when it resolves to something that is not
---a class: the latter names UObject.Load as the call to use instead.
---@param Path string @UE reference path to the class
---@return UClass
function UClass.Load(Path) end

---Test whether this class is a child of another class. Both the type name and the UClass it stands
---for work as the call target and as the argument: AGPlayerPawn:IsChildOf(APawn).
---@param TargetClass UClass
---@return boolean @true if this class derives from the target class.
function UClass:IsChildOf(TargetClass) end

---Get default object of a class. Called on the class, not on an instance: an instance raises
---"invalid source class".
---@return UObject @class default object
function UClass:GetDefaultObject() end
