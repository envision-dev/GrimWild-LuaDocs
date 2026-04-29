---@class UKismetNodeHelperLibrary : UBlueprintFunctionLibrary
UKismetNodeHelperLibrary = {}

---Returns whether the bit at index "Index" is set or not in the data
---@param Data integer @- The integer containing the bits that are being tested against
---@param Index integer @- The bit index into the Data that we are inquiring
---@return boolean
function UKismetNodeHelperLibrary.BitIsMarked(Data, Index) end

---Clears all of the bit in the data
---@param Data integer @[out] - The integer containing the bits that are being cleared
function UKismetNodeHelperLibrary.ClearAllBits(Data) end

---Clears the bit at index "Index" in the data
---@param Data integer @[out] - The integer containing the bits that are being cleared
---@param Index integer @- The bit index into the Data that we are clearing
function UKismetNodeHelperLibrary.ClearBit(Data, Index) end

---Gets enumerator name.
---@param Enum UEnum @- Enumeration
---@param EnumeratorValue integer @- Value of searched enumeration
---@return string
function UKismetNodeHelperLibrary.GetEnumeratorName(Enum, EnumeratorValue) end

---Gets enumerator name as FString. Use DeisplayName when possible.
---@param Enum UEnum @- Enumeration
---@param EnumeratorValue integer @- Value of searched enumeration
---@return string
function UKismetNodeHelperLibrary.GetEnumeratorUserFriendlyName(Enum, EnumeratorValue) end

---
---@param Enum UEnum @- Enumeration
---@param EnumeratorIndex integer @- Input index
---@return integer
function UKismetNodeHelperLibrary.GetEnumeratorValueFromIndex(Enum, EnumeratorIndex) end

---Gets the first index not already marked starting from a specific index and returns the bit index selected
---@param Data integer @- The integer containing the bits that are being set
---@param StartIdx integer @- The index to start looking for an available index from
---@param NumBits integer @- The logical number of bits we want to track
---@return integer
function UKismetNodeHelperLibrary.GetFirstUnmarkedBit(Data, StartIdx, NumBits) end

---Gets a random not already marked bit and returns the bit index selected
---@param Data integer @- The integer containing the bits that are being set
---@param StartIdx integer
---@param NumBits integer @- The logical number of bits we want to track
---@return integer
function UKismetNodeHelperLibrary.GetRandomUnmarkedBit(Data, StartIdx, NumBits) end

---Gets an already unmarked bit and returns the bit index selected
---@param Data integer @- The integer containing the bits that are being set
---@param StartIdx integer @- The index to start with when determining the selection'
---@param NumBits integer @- The logical number of bits we want to track
---@param bRandom boolean @- Whether to select a random index or not
---@return integer
function UKismetNodeHelperLibrary.GetUnmarkedBit(Data, StartIdx, NumBits, bRandom) end

---
---@param Enum UEnum @- Enumeration
---@param EnumeratorValue integer
---@return integer
function UKismetNodeHelperLibrary.GetValidValue(Enum, EnumeratorValue) end

---Returns whether there exists a marked bit in the data
---@param Data integer @- The data being tested against
---@param NumBits integer @- The logical number of bits we want to track
---@return boolean
function UKismetNodeHelperLibrary.HasMarkedBit(Data, NumBits) end

---Returns whether there exists an unmarked bit in the data
---@param Data integer @- The data being tested against
---@param NumBits integer @- The logical number of bits we want to track
---@return boolean
function UKismetNodeHelperLibrary.HasUnmarkedBit(Data, NumBits) end

---Sets the bit at index "Index" in the data
---@param Data integer @[out] - The integer containing the bits that are being set
---@param Index integer @- The bit index into the Data that we are setting
function UKismetNodeHelperLibrary.MarkBit(Data, Index) end

