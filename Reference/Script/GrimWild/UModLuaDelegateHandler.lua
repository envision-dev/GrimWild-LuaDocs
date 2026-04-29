---Delegate handler created by mod/dev scripts. Inherits ULuaDelegateHandler so UE routes
---ProcessEvent to us when the delegate fires. Implements ILuaOwnedHandle so the subsystem
---can clean it up when the owning module unloads.
---Note: We bypass FDelegateRegistry::Add/CreateHandler to avoid private-member entanglement.
---AddTo(nullptr, delegate) and RemoveFrom(nullptr, delegate) both work for FMulticastScriptDelegate
---because TMulticastDelegateTraits<FMulticastScriptDelegate>::AddDelegate ignores the property ptr.
---@class UModLuaDelegateHandler : ULuaDelegateHandler
UModLuaDelegateHandler = {}

