---@class UBlueprintSetLibrary : UBlueprintFunctionLibrary
UBlueprintSetLibrary = {}

---Adds item to set
---@param TargetSet TSet<integer>
---@param NewItem integer
function UBlueprintSetLibrary.Set_Add(TargetSet, NewItem) end

---Adds all elements from an Array to a Set
---@param TargetSet TSet<integer>
---@param NewItems TArray<integer>
function UBlueprintSetLibrary.Set_AddItems(TargetSet, NewItems) end

---Clear a set, removes all content.
---@param TargetSet TSet<integer>
function UBlueprintSetLibrary.Set_Clear(TargetSet) end

---Returns true if the set contains the given item.
---@param TargetSet TSet<integer>
---@param ItemToFind integer
---@return boolean
function UBlueprintSetLibrary.Set_Contains(TargetSet, ItemToFind) end

---Assigns Result to the relative difference of two sets, A and B. That is, Result will
---contain  all elements that are in Set A but are not found in Set B. Note that the
---difference between two sets  is not commutative. The Set whose elements you wish to
---preserve should be the first (top) parameter. Also called the relative complement.
---@param A TSet<integer>
---@param B TSet<integer>
---@param Result TSet<integer> @[out]
function UBlueprintSetLibrary.Set_Difference(A, B, Result) end

---Assigns Result to the intersection of Set A and Set B. That is, Result will contain
---all elements that are in both Set A and Set B. To intersect with the empty set use
---Clear.
---@param A TSet<integer>
---@param B TSet<integer>
---@param Result TSet<integer> @[out]
function UBlueprintSetLibrary.Set_Intersection(A, B, Result) end

---Check if the set is empty
---@param TargetSet TSet<integer>
---@return boolean
function UBlueprintSetLibrary.Set_IsEmpty(TargetSet) end

---Check if the set has any elements
---@param TargetSet TSet<integer>
---@return boolean
function UBlueprintSetLibrary.Set_IsNotEmpty(TargetSet) end

---Get the number of items in a set.
---@param TargetSet TSet<integer>
---@return integer
function UBlueprintSetLibrary.Set_Length(TargetSet) end

---Remove item from set. Output value indicates if something was actually removed. False
---indicates no equivalent item was found.
---@param TargetSet TSet<integer>
---@param Item integer
---@return boolean
function UBlueprintSetLibrary.Set_Remove(TargetSet, Item) end

---Removes all elements in an Array from a set.
---@param TargetSet TSet<integer>
---@param Items TArray<integer>
function UBlueprintSetLibrary.Set_RemoveItems(TargetSet, Items) end

---Outputs an Array containing copies of the entries of a Set.
---@param A TSet<integer> @Set
---@param Result TArray<integer> @[out] Array
function UBlueprintSetLibrary.Set_ToArray(A, Result) end

---Assigns Result to the union of two sets, A and B. That is, Result will contain
---all elements that are in Set A and in addition all elements in Set B. Note that
---a Set is a collection of unique elements, so duplicates will be eliminated.
---@param A TSet<integer>
---@param B TSet<integer>
---@param Result TSet<integer> @[out]
function UBlueprintSetLibrary.Set_Union(A, B, Result) end

---Not exposed to users. Supports setting a set property on an object by name.
---@param Object UObject
---@param PropertyName string
---@param Value TSet<integer>
function UBlueprintSetLibrary.SetSetPropertyByName(Object, PropertyName, Value) end

