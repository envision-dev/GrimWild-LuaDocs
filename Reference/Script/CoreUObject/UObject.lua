---@meta
---Direct base class for all UE objects
---@class UObject
UObject = {}

---Executes some portion of the ubergraph.
---@param EntryPoint integer @The entry point to start code execution at.
function UObject:ExecuteUbergraph(EntryPoint) end

---Load an object by its UE reference path. Example: UObject.Load("/Game/Core/Data/DT_Items.DT_Items").
---Note: no _C at the end of the path.
---Raises an error when the path resolves to nothing, and when it resolves to a class: the latter
---names UClass.Load as the call to use instead.
---@param ObjectPath string
---@return UObject
function UObject.Load(ObjectPath) end

---Test validity of an object. False once the object has been destroyed.
---@return boolean
function UObject:IsValid() end

---Get the name of an object (with no path information)
---@return string
function UObject:GetName() end

---Get the UObject this object resides in
---@return UObject
function UObject:GetOuter() end

---Get the UClass that defines the fields of this object
---@return UClass
function UObject:GetClass() end

---Get the UWorld this object is contained within
---@return UWorld
function UObject:GetWorld() end

---Test whether this object is of the specified class. The type name is accepted directly:
---Pawn:IsA(APawn).
---@param Class UClass
---@return boolean
function UObject:IsA(Class) end

---Get the UClass a type name stands for. Kept for compatibility with older scripts: the type name
---itself already resolves to its UClass, so APawn and APawn.StaticClass() are interchangeable
---everywhere, including as a call target (APawn:GetDefaultObject()) and as an argument.
---Called on an instance it returns that instance's class, which is what GetClass does.
---@return UClass
function UObject.StaticClass() end

---Return this object if it is of the specified class, otherwise nil. Structs have no Cast.
---Casting is only for asking about a type: calling a method never requires one.
---@param Class UClass
---@return UObject|nil
function UObject:Cast(Class) end
