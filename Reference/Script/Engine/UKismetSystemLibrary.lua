---@class UKismetSystemLibrary : UBlueprintFunctionLibrary
UKismetSystemLibrary = {}

---@param Value number
---@param FloatHistory FDebugFloatHistory
---@return FDebugFloatHistory
function UKismetSystemLibrary.AddFloatHistorySample(Value, FloatHistory) end

---Begin a new undo transaction. An undo transaction is defined as all actions which take place when the user selects "undo" a single time.
---@param Context string
---@param Description string
---@param PrimaryObject UObject
---@return integer
function UKismetSystemLibrary.BeginTransaction(Context, Description, PrimaryObject) end

---Returns an array of actors that overlap the given axis-aligned box.
---@param WorldContextObject UObject
---@param BoxPos FVector
---@param BoxExtent FVector
---@param ObjectTypes TArray<integer>
---@param ActorClassFilter TSubclassOf<UObject>
---@param ActorsToIgnore TArray<AActor>
---@param OutActors TArray<AActor> @[out]
---@return boolean
function UKismetSystemLibrary.BoxOverlapActors(WorldContextObject, BoxPos, BoxExtent, ObjectTypes, ActorClassFilter, ActorsToIgnore, OutActors) end

---Returns an array of components that overlap the given axis-aligned box.
---@param WorldContextObject UObject
---@param BoxPos FVector
---@param Extent FVector
---@param ObjectTypes TArray<integer>
---@param ComponentClassFilter TSubclassOf<UObject>
---@param ActorsToIgnore TArray<AActor>
---@param OutComponents TArray<UPrimitiveComponent> @[out]
---@return boolean
function UKismetSystemLibrary.BoxOverlapComponents(WorldContextObject, BoxPos, Extent, ObjectTypes, ComponentClassFilter, ActorsToIgnore, OutComponents) end

---Sweeps a box along the given line and returns all hits encountered.
---This trace finds the objects that RESPONDS to the given TraceChannel
---@param WorldContextObject UObject
---@param Start FVector
---@param End FVector
---@param HalfSize FVector
---@param Orientation FRotator
---@param TraceChannel integer
---@param bTraceComplex boolean
---@param ActorsToIgnore TArray<AActor>
---@param DrawDebugType integer
---@param OutHits TArray<FHitResult> @[out]
---@param bIgnoreSelf boolean
---@param TraceColor? FLinearColor @[default: (R=1.000000,G=0.000000,B=0.000000,A=1.000000)]
---@param TraceHitColor? FLinearColor @[default: (R=0.000000,G=1.000000,B=0.000000,A=1.000000)]
---@param DrawTime? number @[default: 5.000000]
---@return boolean
function UKismetSystemLibrary.BoxTraceMulti(WorldContextObject, Start, End, HalfSize, Orientation, TraceChannel, bTraceComplex, ActorsToIgnore, DrawDebugType, OutHits, bIgnoreSelf, TraceColor, TraceHitColor, DrawTime) end

---Sweep a box against the world and return all initial overlaps using a specific profile, then overlapping hits and then first blocking hit
---Results are sorted, so a blocking hit (if found) will be the last element of the array
---Only the single closest blocking result will be generated, no tests will be done after that
---@param WorldContextObject UObject
---@param Start FVector
---@param End FVector
---@param HalfSize FVector
---@param Orientation FRotator
---@param ProfileName string
---@param bTraceComplex boolean
---@param ActorsToIgnore TArray<AActor>
---@param DrawDebugType integer
---@param OutHits TArray<FHitResult> @[out]
---@param bIgnoreSelf boolean
---@param TraceColor? FLinearColor @[default: (R=1.000000,G=0.000000,B=0.000000,A=1.000000)]
---@param TraceHitColor? FLinearColor @[default: (R=0.000000,G=1.000000,B=0.000000,A=1.000000)]
---@param DrawTime? number @[default: 5.000000]
---@return boolean
function UKismetSystemLibrary.BoxTraceMultiByProfile(WorldContextObject, Start, End, HalfSize, Orientation, ProfileName, bTraceComplex, ActorsToIgnore, DrawDebugType, OutHits, bIgnoreSelf, TraceColor, TraceHitColor, DrawTime) end

---Sweeps a box along the given line and returns all hits encountered.
---This only finds objects that are of a type specified by ObjectTypes.
---@param WorldContextObject UObject
---@param Start FVector
---@param End FVector
---@param HalfSize FVector
---@param Orientation FRotator
---@param ObjectTypes TArray<integer>
---@param bTraceComplex boolean
---@param ActorsToIgnore TArray<AActor>
---@param DrawDebugType integer
---@param OutHits TArray<FHitResult> @[out]
---@param bIgnoreSelf boolean
---@param TraceColor? FLinearColor @[default: (R=1.000000,G=0.000000,B=0.000000,A=1.000000)]
---@param TraceHitColor? FLinearColor @[default: (R=0.000000,G=1.000000,B=0.000000,A=1.000000)]
---@param DrawTime? number @[default: 5.000000]
---@return boolean
function UKismetSystemLibrary.BoxTraceMultiForObjects(WorldContextObject, Start, End, HalfSize, Orientation, ObjectTypes, bTraceComplex, ActorsToIgnore, DrawDebugType, OutHits, bIgnoreSelf, TraceColor, TraceHitColor, DrawTime) end

---Sweeps a box along the given line and returns the first blocking hit encountered.
---This trace finds the objects that RESPONDS to the given TraceChannel
---@param WorldContextObject UObject
---@param Start FVector
---@param End FVector
---@param HalfSize FVector
---@param Orientation FRotator
---@param TraceChannel integer
---@param bTraceComplex boolean
---@param ActorsToIgnore TArray<AActor>
---@param DrawDebugType integer
---@param OutHit FHitResult @[out]
---@param bIgnoreSelf boolean
---@param TraceColor? FLinearColor @[default: (R=1.000000,G=0.000000,B=0.000000,A=1.000000)]
---@param TraceHitColor? FLinearColor @[default: (R=0.000000,G=1.000000,B=0.000000,A=1.000000)]
---@param DrawTime? number @[default: 5.000000]
---@return boolean
function UKismetSystemLibrary.BoxTraceSingle(WorldContextObject, Start, End, HalfSize, Orientation, TraceChannel, bTraceComplex, ActorsToIgnore, DrawDebugType, OutHit, bIgnoreSelf, TraceColor, TraceHitColor, DrawTime) end

---Sweep a box against the world and return the first blocking hit using a specific profile
---@param WorldContextObject UObject
---@param Start FVector
---@param End FVector
---@param HalfSize FVector
---@param Orientation FRotator
---@param ProfileName string
---@param bTraceComplex boolean
---@param ActorsToIgnore TArray<AActor>
---@param DrawDebugType integer
---@param OutHit FHitResult @[out]
---@param bIgnoreSelf boolean
---@param TraceColor? FLinearColor @[default: (R=1.000000,G=0.000000,B=0.000000,A=1.000000)]
---@param TraceHitColor? FLinearColor @[default: (R=0.000000,G=1.000000,B=0.000000,A=1.000000)]
---@param DrawTime? number @[default: 5.000000]
---@return boolean
function UKismetSystemLibrary.BoxTraceSingleByProfile(WorldContextObject, Start, End, HalfSize, Orientation, ProfileName, bTraceComplex, ActorsToIgnore, DrawDebugType, OutHit, bIgnoreSelf, TraceColor, TraceHitColor, DrawTime) end

---Sweeps a box along the given line and returns the first hit encountered.
---This only finds objects that are of a type specified by ObjectTypes.
---@param WorldContextObject UObject
---@param Start FVector
---@param End FVector
---@param HalfSize FVector
---@param Orientation FRotator
---@param ObjectTypes TArray<integer>
---@param bTraceComplex boolean
---@param ActorsToIgnore TArray<AActor>
---@param DrawDebugType integer
---@param OutHit FHitResult @[out]
---@param bIgnoreSelf boolean
---@param TraceColor? FLinearColor @[default: (R=1.000000,G=0.000000,B=0.000000,A=1.000000)]
---@param TraceHitColor? FLinearColor @[default: (R=0.000000,G=1.000000,B=0.000000,A=1.000000)]
---@param DrawTime? number @[default: 5.000000]
---@return boolean
function UKismetSystemLibrary.BoxTraceSingleForObjects(WorldContextObject, Start, End, HalfSize, Orientation, ObjectTypes, bTraceComplex, ActorsToIgnore, DrawDebugType, OutHit, bIgnoreSelf, TraceColor, TraceHitColor, DrawTime) end

---Breaks an ARFilter struct into its component pieces. You should be using ClassPaths and RecursiveClassPathsExclusionSet from this node, ClassNames and RecursiveClassesExclusionSet are deprecated.
---@param InARFilter FARFilter
---@param PackageNames TArray<string> @[out]
---@param PackagePaths TArray<string> @[out]
---@param SoftObjectPaths TArray<FSoftObjectPath> @[out]
---@param ClassPaths TArray<FTopLevelAssetPath> @[out]
---@param RecursiveClassPathsExclusionSet TSet<FTopLevelAssetPath> @[out]
---@param ClassNames TArray<string> @[out] [DEPRECATED] - Class names are now represented by path names. Please use the ClassPaths output instead.
---@param RecursiveClassesExclusionSet TSet<string> @[out] [DEPRECATED] - Class names are now represented by path names. Please use the RecursiveClassPathsExclusionSet output instead.
---@param bRecursivePaths boolean @[out]
---@param bRecursiveClasses boolean @[out]
---@param bIncludeOnlyOnDiskAssets boolean @[out]
function UKismetSystemLibrary.BreakARFilter(InARFilter, PackageNames, PackagePaths, SoftObjectPaths, ClassPaths, RecursiveClassPathsExclusionSet, ClassNames, RecursiveClassesExclusionSet, bRecursivePaths, bRecursiveClasses, bIncludeOnlyOnDiskAssets) end

---Gets the path string out of a Soft Class Path
---@param InSoftClassPath FSoftClassPath
---@param PathString string @[out]
function UKismetSystemLibrary.BreakSoftClassPath(InSoftClassPath, PathString) end

---Gets the path string out of a Soft Object Path
---@param InSoftObjectPath FSoftObjectPath
---@param PathString string @[out]
function UKismetSystemLibrary.BreakSoftObjectPath(InSoftObjectPath, PathString) end

---Gets the path string out of a TopLevelAssetPath
---@param TopLevelAssetPath FTopLevelAssetPath
---@param PathString string @[out]
function UKismetSystemLibrary.BreakTopLevelAssetPath(TopLevelAssetPath, PathString) end

---Cancel the current transaction, and no longer capture actions to be placed in the undo buffer.
---@param Index integer
function UKismetSystemLibrary.CancelTransaction(Index) end

---@param URL string
---@return boolean
function UKismetSystemLibrary.CanLaunchURL(URL) end

---Returns an array of actors that overlap the given capsule.
---@param WorldContextObject UObject
---@param CapsulePos FVector
---@param Radius number
---@param HalfHeight number
---@param ObjectTypes TArray<integer>
---@param ActorClassFilter TSubclassOf<UObject>
---@param ActorsToIgnore TArray<AActor>
---@param OutActors TArray<AActor> @[out]
---@return boolean
function UKismetSystemLibrary.CapsuleOverlapActors(WorldContextObject, CapsulePos, Radius, HalfHeight, ObjectTypes, ActorClassFilter, ActorsToIgnore, OutActors) end

---Returns an array of components that overlap the given capsule.
---@param WorldContextObject UObject
---@param CapsulePos FVector
---@param Radius number
---@param HalfHeight number
---@param ObjectTypes TArray<integer>
---@param ComponentClassFilter TSubclassOf<UObject>
---@param ActorsToIgnore TArray<AActor>
---@param OutComponents TArray<UPrimitiveComponent> @[out]
---@return boolean
function UKismetSystemLibrary.CapsuleOverlapComponents(WorldContextObject, CapsulePos, Radius, HalfHeight, ObjectTypes, ComponentClassFilter, ActorsToIgnore, OutComponents) end

---Sweeps a capsule along the given line and returns all hits encountered up to and including the first blocking hit.
---This trace finds the objects that RESPOND to the given TraceChannel
---@param WorldContextObject UObject
---@param Start FVector
---@param End FVector
---@param Radius number
---@param HalfHeight number
---@param TraceChannel integer
---@param bTraceComplex boolean
---@param ActorsToIgnore TArray<AActor>
---@param DrawDebugType integer
---@param OutHits TArray<FHitResult> @[out]
---@param bIgnoreSelf boolean
---@param TraceColor? FLinearColor @[default: (R=1.000000,G=0.000000,B=0.000000,A=1.000000)]
---@param TraceHitColor? FLinearColor @[default: (R=0.000000,G=1.000000,B=0.000000,A=1.000000)]
---@param DrawTime? number @[default: 5.000000]
---@return boolean
function UKismetSystemLibrary.CapsuleTraceMulti(WorldContextObject, Start, End, Radius, HalfHeight, TraceChannel, bTraceComplex, ActorsToIgnore, DrawDebugType, OutHits, bIgnoreSelf, TraceColor, TraceHitColor, DrawTime) end

---Sweep a capsule against the world and return all initial overlaps using a specific profile, then overlapping hits and then first blocking hit
---Results are sorted, so a blocking hit (if found) will be the last element of the array
---Only the single closest blocking result will be generated, no tests will be done after that
---@param WorldContextObject UObject
---@param Start FVector
---@param End FVector
---@param Radius number
---@param HalfHeight number
---@param ProfileName string
---@param bTraceComplex boolean
---@param ActorsToIgnore TArray<AActor>
---@param DrawDebugType integer
---@param OutHits TArray<FHitResult> @[out]
---@param bIgnoreSelf boolean
---@param TraceColor? FLinearColor @[default: (R=1.000000,G=0.000000,B=0.000000,A=1.000000)]
---@param TraceHitColor? FLinearColor @[default: (R=0.000000,G=1.000000,B=0.000000,A=1.000000)]
---@param DrawTime? number @[default: 5.000000]
---@return boolean
function UKismetSystemLibrary.CapsuleTraceMultiByProfile(WorldContextObject, Start, End, Radius, HalfHeight, ProfileName, bTraceComplex, ActorsToIgnore, DrawDebugType, OutHits, bIgnoreSelf, TraceColor, TraceHitColor, DrawTime) end

---Sweeps a capsule along the given line and returns all hits encountered.
---This only finds objects that are of a type specified by ObjectTypes.
---@param WorldContextObject UObject
---@param Start FVector
---@param End FVector
---@param Radius number
---@param HalfHeight number
---@param ObjectTypes TArray<integer>
---@param bTraceComplex boolean
---@param ActorsToIgnore TArray<AActor>
---@param DrawDebugType integer
---@param OutHits TArray<FHitResult> @[out]
---@param bIgnoreSelf boolean
---@param TraceColor? FLinearColor @[default: (R=1.000000,G=0.000000,B=0.000000,A=1.000000)]
---@param TraceHitColor? FLinearColor @[default: (R=0.000000,G=1.000000,B=0.000000,A=1.000000)]
---@param DrawTime? number @[default: 5.000000]
---@return boolean
function UKismetSystemLibrary.CapsuleTraceMultiForObjects(WorldContextObject, Start, End, Radius, HalfHeight, ObjectTypes, bTraceComplex, ActorsToIgnore, DrawDebugType, OutHits, bIgnoreSelf, TraceColor, TraceHitColor, DrawTime) end

---Sweeps a capsule along the given line and returns the first blocking hit encountered.
---This trace finds the objects that RESPOND to the given TraceChannel
---@param WorldContextObject UObject
---@param Start FVector
---@param End FVector
---@param Radius number
---@param HalfHeight number
---@param TraceChannel integer
---@param bTraceComplex boolean
---@param ActorsToIgnore TArray<AActor>
---@param DrawDebugType integer
---@param OutHit FHitResult @[out]
---@param bIgnoreSelf boolean
---@param TraceColor? FLinearColor @[default: (R=1.000000,G=0.000000,B=0.000000,A=1.000000)]
---@param TraceHitColor? FLinearColor @[default: (R=0.000000,G=1.000000,B=0.000000,A=1.000000)]
---@param DrawTime? number @[default: 5.000000]
---@return boolean
function UKismetSystemLibrary.CapsuleTraceSingle(WorldContextObject, Start, End, Radius, HalfHeight, TraceChannel, bTraceComplex, ActorsToIgnore, DrawDebugType, OutHit, bIgnoreSelf, TraceColor, TraceHitColor, DrawTime) end

---Sweep a capsule against the world and return the first blocking hit using a specific profile
---@param WorldContextObject UObject
---@param Start FVector
---@param End FVector
---@param Radius number
---@param HalfHeight number
---@param ProfileName string
---@param bTraceComplex boolean
---@param ActorsToIgnore TArray<AActor>
---@param DrawDebugType integer
---@param OutHit FHitResult @[out]
---@param bIgnoreSelf boolean
---@param TraceColor? FLinearColor @[default: (R=1.000000,G=0.000000,B=0.000000,A=1.000000)]
---@param TraceHitColor? FLinearColor @[default: (R=0.000000,G=1.000000,B=0.000000,A=1.000000)]
---@param DrawTime? number @[default: 5.000000]
---@return boolean
function UKismetSystemLibrary.CapsuleTraceSingleByProfile(WorldContextObject, Start, End, Radius, HalfHeight, ProfileName, bTraceComplex, ActorsToIgnore, DrawDebugType, OutHit, bIgnoreSelf, TraceColor, TraceHitColor, DrawTime) end

---Sweeps a capsule along the given line and returns the first hit encountered.
---This only finds objects that are of a type specified by ObjectTypes.
---@param WorldContextObject UObject
---@param Start FVector
---@param End FVector
---@param Radius number
---@param HalfHeight number
---@param ObjectTypes TArray<integer>
---@param bTraceComplex boolean
---@param ActorsToIgnore TArray<AActor>
---@param DrawDebugType integer
---@param OutHit FHitResult @[out]
---@param bIgnoreSelf boolean
---@param TraceColor? FLinearColor @[default: (R=1.000000,G=0.000000,B=0.000000,A=1.000000)]
---@param TraceHitColor? FLinearColor @[default: (R=0.000000,G=1.000000,B=0.000000,A=1.000000)]
---@param DrawTime? number @[default: 5.000000]
---@return boolean
function UKismetSystemLibrary.CapsuleTraceSingleForObjects(WorldContextObject, Start, End, Radius, HalfHeight, ObjectTypes, bTraceComplex, ActorsToIgnore, DrawDebugType, OutHit, bIgnoreSelf, TraceColor, TraceHitColor, DrawTime) end

---Deletes all unreferenced objects, keeping only referenced objects (this command will be queued and happen at the end of the frame)
---Note: This can be a slow operation, and should only be performed where a hitch would be acceptable
function UKismetSystemLibrary.CollectGarbage() end

---Returns an array of actors that overlap the given component.
---@param Component UPrimitiveComponent
---@param ComponentTransform FTransform
---@param ObjectTypes TArray<integer>
---@param ActorClassFilter TSubclassOf<UObject>
---@param ActorsToIgnore TArray<AActor>
---@param OutActors TArray<AActor> @[out]
---@return boolean
function UKismetSystemLibrary.ComponentOverlapActors(Component, ComponentTransform, ObjectTypes, ActorClassFilter, ActorsToIgnore, OutActors) end

---Returns an array of components that overlap the given component.
---@param Component UPrimitiveComponent
---@param ComponentTransform FTransform
---@param ObjectTypes TArray<integer>
---@param ComponentClassFilter TSubclassOf<UObject>
---@param ActorsToIgnore TArray<AActor>
---@param OutComponents TArray<UPrimitiveComponent> @[out]
---@return boolean
function UKismetSystemLibrary.ComponentOverlapComponents(Component, ComponentTransform, ObjectTypes, ComponentClassFilter, ActorsToIgnore, OutComponents) end

---Allows or inhibits screensaver
---@param bAllowScreenSaver boolean
function UKismetSystemLibrary.ControlScreensaver(bAllowScreenSaver) end

---@param Class TSubclassOf<UObject>
---@return TSoftClassPtr<UObject>
function UKismetSystemLibrary.Conv_ClassToSoftClassReference(Class) end

---@param ComponentReference FComponentReference
---@return FSoftComponentReference
function UKismetSystemLibrary.Conv_ComponentReferenceToSoftComponentReference(ComponentReference) end

---Converts an interfance into an object
---@param Interface TScriptInterface<UInterface>
---@return UObject
function UKismetSystemLibrary.Conv_InterfaceToObject(Interface) end

---Casts from an object to a class, this will only work if the object is already a class
---@param Object UObject
---@param Class TSubclassOf<UObject>
---@return TSubclassOf<UObject>
function UKismetSystemLibrary.Conv_ObjectToClass(Object, Class) end

---@param Object UObject
---@return TSoftObjectPtr<UObject>
function UKismetSystemLibrary.Conv_ObjectToSoftObjectReference(Object) end

---Converts a Primary Asset Id to a string. The other direction is not provided because it cannot be validated
---@param PrimaryAssetId FPrimaryAssetId
---@return string
function UKismetSystemLibrary.Conv_PrimaryAssetIdToString(PrimaryAssetId) end

---Converts a Primary Asset Type to a string. The other direction is not provided because it cannot be validated
---@param PrimaryAssetType FPrimaryAssetType
---@return string
function UKismetSystemLibrary.Conv_PrimaryAssetTypeToString(PrimaryAssetType) end

---Converts a Soft Class Path into a base Soft Class Reference, this is not guaranteed to be resolvable
---@param SoftClassPath FSoftClassPath
---@return TSoftClassPtr<UObject>
function UKismetSystemLibrary.Conv_SoftClassPathToSoftClassRef(SoftClassPath) end

---@param SoftClass TSoftClassPtr<UObject>
---@return TSubclassOf<UObject>
function UKismetSystemLibrary.Conv_SoftClassReferenceToClass(SoftClass) end

---Converts a Soft Class Reference to a path string
---@param SoftClassReference TSoftClassPtr<UObject>
---@return string
function UKismetSystemLibrary.Conv_SoftClassReferenceToString(SoftClassReference) end

---Internal functions used by K2Node_LoadAsset and K2Node_ConvertAsset
---@param SoftObject TSoftObjectPtr<UObject>
---@return UObject
function UKismetSystemLibrary.Conv_SoftObjectReferenceToObject(SoftObject) end

---Converts a Soft Object Reference to a path string
---@param SoftObjectReference TSoftObjectPtr<UObject>
---@return string
function UKismetSystemLibrary.Conv_SoftObjectReferenceToString(SoftObjectReference) end

---Converts a Soft Object Path into a base Soft Object Reference, this is not guaranteed to be resolvable
---@param SoftObjectPath FSoftObjectPath
---@return TSoftObjectPtr<UObject>
function UKismetSystemLibrary.Conv_SoftObjPathToSoftObjRef(SoftObjectPath) end

---Converts a Soft Class Reference into a Soft Class Path (which can be used like a Soft Object Path)
---@param SoftClassReference TSoftClassPtr<UObject>
---@return FSoftClassPath
function UKismetSystemLibrary.Conv_SoftObjRefToSoftClassPath(SoftClassReference) end

---Converts a Soft Object Reference into a Soft Object Path
---@param SoftObjectReference TSoftObjectPtr<UObject>
---@return FSoftObjectPath
function UKismetSystemLibrary.Conv_SoftObjRefToSoftObjPath(SoftObjectReference) end

---Converts passed in filename to use a absolute path
---@param Filename string
---@return string
function UKismetSystemLibrary.ConvertToAbsolutePath(Filename) end

---Converts passed in filename to use a relative path
---@param Filename string
---@return string
function UKismetSystemLibrary.ConvertToRelativePath(Filename) end

---Mark as modified.
---@param ObjectToModify UObject
function UKismetSystemLibrary.CreateCopyForUndoBuffer(ObjectToModify) end

---Perform a latent action with a delay (specified in seconds).  Calling again while it is counting down will be ignored.
---@param WorldContextObject UObject
---@param Duration number @length of delay (in seconds).
function UKismetSystemLibrary.Delay(WorldContextObject, Duration) end

---Perform a latent action with a delay of one tick.  Calling again while it is counting down will be ignored.
---@param WorldContextObject UObject
function UKismetSystemLibrary.DelayUntilNextTick(WorldContextObject) end

---Checks if this object implements a specific interface, works for both native and blueprint interfacse
---@param TestObject UObject
---@param Interface TSubclassOf<UInterface>
---@return boolean
function UKismetSystemLibrary.DoesImplementInterface(TestObject, Interface) end

---Draw directional arrow, pointing from LineStart to LineEnd.
---@param WorldContextObject UObject
---@param LineStart FVector
---@param LineEnd FVector
---@param ArrowSize number
---@param LineColor FLinearColor
---@param Duration? number @[default: 0.000000]
---@param Thickness? number @[default: 0.000000]
function UKismetSystemLibrary.DrawDebugArrow(WorldContextObject, LineStart, LineEnd, ArrowSize, LineColor, Duration, Thickness) end

---Draw a debug box
---@param WorldContextObject UObject
---@param Center FVector
---@param Extent FVector
---@param LineColor FLinearColor
---@param Rotation FRotator
---@param Duration? number @[default: 0.000000]
---@param Thickness? number @[default: 0.000000]
function UKismetSystemLibrary.DrawDebugBox(WorldContextObject, Center, Extent, LineColor, Rotation, Duration, Thickness) end

---Draw a debug camera shape.
---@param CameraActor ACameraActor
---@param CameraColor? FLinearColor @[default: (R=1.000000,G=1.000000,B=1.000000,A=1.000000)]
---@param Duration? number @[default: 0.000000]
function UKismetSystemLibrary.DrawDebugCamera(CameraActor, CameraColor, Duration) end

---Draw a debug capsule
---@param WorldContextObject UObject
---@param Center FVector
---@param HalfHeight number
---@param Radius number
---@param Rotation FRotator
---@param LineColor? FLinearColor @[default: (R=1.000000,G=1.000000,B=1.000000,A=1.000000)]
---@param Duration? number @[default: 0.000000]
---@param Thickness? number @[default: 0.000000]
function UKismetSystemLibrary.DrawDebugCapsule(WorldContextObject, Center, HalfHeight, Radius, Rotation, LineColor, Duration, Thickness) end

---Draw a debug circle!
---@param WorldContextObject UObject
---@param Center FVector
---@param Radius number
---@param NumSegments? integer @[default: 12]
---@param LineColor? FLinearColor @[default: (R=1.000000,G=1.000000,B=1.000000,A=1.000000)]
---@param Duration? number @[default: 0.000000]
---@param Thickness? number @[default: 0.000000]
---@param YAxis? FVector @[default: 0.000000,1.000000,0.000000]
---@param ZAxis? FVector @[default: 0.000000,0.000000,1.000000]
---@param bDrawAxis? boolean @[default: false]
function UKismetSystemLibrary.DrawDebugCircle(WorldContextObject, Center, Radius, NumSegments, LineColor, Duration, Thickness, YAxis, ZAxis, bDrawAxis) end

---Draw a debug cone
---@param WorldContextObject UObject
---@param Origin FVector
---@param Direction FVector
---@param Length number
---@param AngleWidth number
---@param AngleHeight number
---@param NumSides integer
---@param LineColor FLinearColor
---@param Duration? number @[default: 0.000000]
---@param Thickness? number @[default: 0.000000]
function UKismetSystemLibrary.DrawDebugCone(WorldContextObject, Origin, Direction, Length, AngleWidth, AngleHeight, NumSides, LineColor, Duration, Thickness) end

---Draw a debug cone
---Angles are specified in degrees
---@param WorldContextObject UObject
---@param Origin FVector
---@param Direction FVector
---@param Length? number @[default: 100.000000]
---@param AngleWidth? number @[default: 45.000000]
---@param AngleHeight? number @[default: 45.000000]
---@param NumSides? integer @[default: 12]
---@param LineColor? FLinearColor @[default: (R=1.000000,G=1.000000,B=1.000000,A=1.000000)]
---@param Duration? number @[default: 0.000000]
---@param Thickness? number @[default: 0.000000]
function UKismetSystemLibrary.DrawDebugConeInDegrees(WorldContextObject, Origin, Direction, Length, AngleWidth, AngleHeight, NumSides, LineColor, Duration, Thickness) end

---Draw a debug coordinate system.
---@param WorldContextObject UObject
---@param AxisLoc FVector
---@param AxisRot FRotator
---@param Scale? number @[default: 1.000000]
---@param Duration? number @[default: 0.000000]
---@param Thickness? number @[default: 0.000000]
function UKismetSystemLibrary.DrawDebugCoordinateSystem(WorldContextObject, AxisLoc, AxisRot, Scale, Duration, Thickness) end

---Draw a debug cylinder
---@param WorldContextObject UObject
---@param Start FVector
---@param End FVector
---@param Radius? number @[default: 100.000000]
---@param Segments? integer @[default: 12]
---@param LineColor? FLinearColor @[default: (R=1.000000,G=1.000000,B=1.000000,A=1.000000)]
---@param Duration? number @[default: 0.000000]
---@param Thickness? number @[default: 0.000000]
function UKismetSystemLibrary.DrawDebugCylinder(WorldContextObject, Start, End, Radius, Segments, LineColor, Duration, Thickness) end

---Draws a 2D Histogram of size 'DrawSize' based FDebugFloatHistory struct, using DrawLocation for the location in the world, rotation will face camera of first player.
---@param WorldContextObject UObject
---@param FloatHistory FDebugFloatHistory
---@param DrawLocation FVector
---@param DrawSize FVector2D
---@param DrawColor? FLinearColor @[default: (R=1.000000,G=1.000000,B=1.000000,A=1.000000)]
---@param Duration? number @[default: 0.000000]
function UKismetSystemLibrary.DrawDebugFloatHistoryLocation(WorldContextObject, FloatHistory, DrawLocation, DrawSize, DrawColor, Duration) end

---Draws a 2D Histogram of size 'DrawSize' based FDebugFloatHistory struct, using DrawTransform for the position in the world.
---@param WorldContextObject UObject
---@param FloatHistory FDebugFloatHistory
---@param DrawTransform FTransform
---@param DrawSize FVector2D
---@param DrawColor? FLinearColor @[default: (R=1.000000,G=1.000000,B=1.000000,A=1.000000)]
---@param Duration? number @[default: 0.000000]
function UKismetSystemLibrary.DrawDebugFloatHistoryTransform(WorldContextObject, FloatHistory, DrawTransform, DrawSize, DrawColor, Duration) end

---Draws a debug frustum.
---@param WorldContextObject UObject
---@param FrustumTransform FTransform
---@param FrustumColor? FLinearColor @[default: (R=1.000000,G=1.000000,B=1.000000,A=1.000000)]
---@param Duration? number @[default: 0.000000]
---@param Thickness? number @[default: 0.000000]
function UKismetSystemLibrary.DrawDebugFrustum(WorldContextObject, FrustumTransform, FrustumColor, Duration, Thickness) end

---Draw a debug line
---@param WorldContextObject UObject
---@param LineStart FVector
---@param LineEnd FVector
---@param LineColor FLinearColor
---@param Duration? number @[default: 0.000000]
---@param Thickness? number @[default: 0.000000]
function UKismetSystemLibrary.DrawDebugLine(WorldContextObject, LineStart, LineEnd, LineColor, Duration, Thickness) end

---Draws a debug plane.
---@param WorldContextObject UObject
---@param PlaneCoordinates FPlane
---@param Location FVector
---@param Size number
---@param PlaneColor? FLinearColor @[default: (R=1.000000,G=1.000000,B=1.000000,A=1.000000)]
---@param Duration? number @[default: 0.000000]
function UKismetSystemLibrary.DrawDebugPlane(WorldContextObject, PlaneCoordinates, Location, Size, PlaneColor, Duration) end

---Draw a debug point
---@param WorldContextObject UObject
---@param Position FVector
---@param Size number
---@param PointColor FLinearColor
---@param Duration? number @[default: 0.000000]
function UKismetSystemLibrary.DrawDebugPoint(WorldContextObject, Position, Size, PointColor, Duration) end

---Draw a debug sphere
---@param WorldContextObject UObject
---@param Center FVector
---@param Radius? number @[default: 100.000000]
---@param Segments? integer @[default: 12]
---@param LineColor? FLinearColor @[default: (R=1.000000,G=1.000000,B=1.000000,A=1.000000)]
---@param Duration? number @[default: 0.000000]
---@param Thickness? number @[default: 0.000000]
function UKismetSystemLibrary.DrawDebugSphere(WorldContextObject, Center, Radius, Segments, LineColor, Duration, Thickness) end

---Draw a debug string at a 3d world location.
---@param WorldContextObject UObject
---@param TextLocation FVector
---@param Text string
---@param TestBaseActor? AActor @[default: None]
---@param TextColor? FLinearColor @[default: (R=1.000000,G=1.000000,B=1.000000,A=1.000000)]
---@param Duration? number @[default: 0.000000]
function UKismetSystemLibrary.DrawDebugString(WorldContextObject, TextLocation, Text, TestBaseActor, TextColor, Duration) end

---Attempt to end the current undo transaction. Only successful if the transaction's action counter is 1.
---@return integer
function UKismetSystemLibrary.EndTransaction() end

---Returns true if the values are equal (A == B)
---@param A FPrimaryAssetId
---@param B FPrimaryAssetId
---@return boolean
function UKismetSystemLibrary.EqualEqual_PrimaryAssetId(A, B) end

---Returns true if the values are equal (A == B)
---@param A FPrimaryAssetType
---@param B FPrimaryAssetType
---@return boolean
function UKismetSystemLibrary.EqualEqual_PrimaryAssetType(A, B) end

---Returns true if the values are equal (A == B)
---@param A TSoftClassPtr<UObject>
---@param B TSoftClassPtr<UObject>
---@return boolean
function UKismetSystemLibrary.EqualEqual_SoftClassReference(A, B) end

---Returns true if the values are equal (A == B)
---@param A TSoftObjectPtr<UObject>
---@param B TSoftObjectPtr<UObject>
---@return boolean
function UKismetSystemLibrary.EqualEqual_SoftObjectReference(A, B) end

---Executes a console command, optionally on a specific controller
---@param WorldContextObject UObject
---@param Command string
---@param SpecificPlayer? APlayerController @[default: None]
function UKismetSystemLibrary.ExecuteConsoleCommand(WorldContextObject, Command, SpecificPlayer) end

---Removes all debug strings.
---@param WorldContextObject UObject
function UKismetSystemLibrary.FlushDebugStrings(WorldContextObject) end

---Flush all persistent debug lines and shapes.
---@param WorldContextObject UObject
function UKismetSystemLibrary.FlushPersistentDebugLines(WorldContextObject) end

---Forces closed any displayed ad. Can lead to loss of revenue
---(iOS and Android only)
function UKismetSystemLibrary.ForceCloseAdBanner() end

---@param Actor AActor
---@param Origin FVector @[out]
---@param BoxExtent FVector @[out]
function UKismetSystemLibrary.GetActorBounds(Actor, Origin, BoxExtent) end

---Returns an array of unique actors represented by the given list of components.
---@param ComponentList TArray<UPrimitiveComponent>
---@param ActorClassFilter TSubclassOf<UObject>
---@param OutActorList TArray<AActor> @[out]
function UKismetSystemLibrary.GetActorListFromComponentList(ComponentList, ActorClassFilter, OutActorList) end

---Retrieves the total number of Ad IDs that can be selected between
---@return integer
function UKismetSystemLibrary.GetAdIDCount() end

---Build configuration, for displaying to end users in diagnostics.
---@return string
function UKismetSystemLibrary.GetBuildConfiguration() end

---Build version, for displaying to end users in diagnostics.
---@return string
function UKismetSystemLibrary.GetBuildVersion() end

---Returns the display name of a class
---@param Class TSubclassOf<UObject>
---@return string
function UKismetSystemLibrary.GetClassDisplayName(Class) end

---Returns the Blueprint Class associated with a Primary Asset Id, this will only return a valid object if it is in memory, it will not load it
---@param PrimaryAssetId FPrimaryAssetId
---@return TSubclassOf<UObject>
function UKismetSystemLibrary.GetClassFromPrimaryAssetId(PrimaryAssetId) end

---Returns the full path to the specified class as a Top Level Asset Path used by asset utilities
---@param Class TSubclassOf<UObject>
---@return FTopLevelAssetPath
function UKismetSystemLibrary.GetClassTopLevelAssetPath(Class) end

---Returns the command line that the process was launched with.
---@return string
function UKismetSystemLibrary.GetCommandLine() end

---Get bounds
---@param Component USceneComponent
---@param Origin FVector @[out]
---@param BoxExtent FVector @[out]
---@param SphereRadius number @[out]
function UKismetSystemLibrary.GetComponentBounds(Component, Origin, BoxExtent, SphereRadius) end

---Evaluates, if it exists, whether the specified integer console variable has a non-zero value (true) or not (false).
---@param VariableName string
---@return boolean
function UKismetSystemLibrary.GetConsoleVariableBoolValue(VariableName) end

---Attempts to retrieve the value of the specified float console variable, if it exists.
---@param VariableName string
---@return number
function UKismetSystemLibrary.GetConsoleVariableFloatValue(VariableName) end

---Attempts to retrieve the value of the specified integer console variable, if it exists.
---@param VariableName string
---@return integer
function UKismetSystemLibrary.GetConsoleVariableIntValue(VariableName) end

---Attempts to retrieve the value of the specified string console variable, if it exists.
---@param VariableName string
---@return string
function UKismetSystemLibrary.GetConsoleVariableStringValue(VariableName) end

---Gets the list of windowed resolutions which are convenient for the current primary display size.
---@param Resolutions TArray<FIntPoint> @[out]
---@return boolean
function UKismetSystemLibrary.GetConvenientWindowedResolutions(Resolutions) end

---Returns the list of loaded bundles for a given Primary Asset. This will return false if the asset is not loaded at all.
---If ForceCurrentState is true it will return the current state even if a load is in process
---@param PrimaryAssetId FPrimaryAssetId
---@param bForceCurrentState boolean
---@param OutBundles TArray<string> @[out]
---@return boolean
function UKismetSystemLibrary.GetCurrentBundleState(PrimaryAssetId, bForceCurrentState, OutBundles) end

---Get the default language (for localization) used by this platform
--- - A two-letter ISO 639-1 language code (eg, "zh")
--- - An optional four-letter ISO 15924 script code (eg, "Hans")
--- - An optional two-letter ISO 3166-1 country code (eg, "CN")
---@return string
function UKismetSystemLibrary.GetDefaultLanguage() end

---Get the default locale (for internationalization) used by this platform
--- - A two-letter ISO 639-1 language code (eg, "zh")
--- - An optional four-letter ISO 15924 script code (eg, "Hans")
--- - An optional two-letter ISO 3166-1 country code (eg, "CN")
---@return string
function UKismetSystemLibrary.GetDefaultLocale() end

---Returns the platform specific unique device id
---@return string
function UKismetSystemLibrary.GetDeviceId() end

---Returns the display name (or actor label), for displaying as a debugging aid.
---Note: In editor builds, this is the actor label.  In non-editor builds, this is the actual object name.  This function should not be used to uniquely identify actors!
---It is not localized and should not be used for display to an end user of a game.
---@param Object UObject
---@return string
function UKismetSystemLibrary.GetDisplayName(Object) end

---Attempts to retrieve the value of a named property from the given object.
---@param Object UObject @The object you want to retrieve a property value from.
---@param PropertyName string @The name of the object property to retrieve the value from.
---@param PropertyValue integer @[out] The retrieved property value, if found.
---@return boolean
function UKismetSystemLibrary.GetEditorProperty(Object, PropertyName, PropertyValue) end

---Engine build number, for displaying to end users.
---@return string
function UKismetSystemLibrary.GetEngineVersion() end

---Returns the full path to the specified enum as a Top Level Asset Path used by asset utilities
---@param Enum UEnum
---@return FTopLevelAssetPath
function UKismetSystemLibrary.GetEnumTopLevelAssetPath(Enum) end

---Returns the value of GFrameCounter, a running count of the number of frames that have occurred.
---@return integer
function UKismetSystemLibrary.GetFrameCount() end

---Retrieves the game's platform-specific bundle identifier or package name of the game
---@return string
function UKismetSystemLibrary.GetGameBundleId() end

---Get the name of the current game
---@return string
function UKismetSystemLibrary.GetGameName() end

---Returns glyph assigned to a gamepad button (or a null ptr if not assigned) (iOS and tvOS only)
---@param ButtonKey string
---@param ControllerIndex integer
---@return UTexture2D
function UKismetSystemLibrary.GetGamepadButtonGlyph(ButtonKey, ControllerIndex) end

---Returns name of controller if assigned to a gamepad (or None if not assigned) (Android and iOS only)
---@param ControllerId integer
---@return string
function UKismetSystemLibrary.GetGamepadControllerName(ControllerId) end

---Get the current game time, in seconds. This stops when the game is paused and is affected by slomo.
---@param WorldContextObject UObject
---@return number
function UKismetSystemLibrary.GetGameTimeInSeconds(WorldContextObject) end

---Returns the currency code associated with the device's locale
---@return string
function UKismetSystemLibrary.GetLocalCurrencyCode() end

---Returns the currency symbol associated with the device's locale
---@return string
function UKismetSystemLibrary.GetLocalCurrencySymbol() end

---Gets the smallest Y resolution we want to support in the 3D view, clamped within reasons
---@return integer
function UKismetSystemLibrary.GetMinYResolutionFor3DView() end

---Gets the smallest Y resolution we want to support in the UI, clamped within reasons
---@return integer
function UKismetSystemLibrary.GetMinYResolutionForUI() end

---Returns the Object associated with a Primary Asset Id, this will only return a valid object if it is in memory, it will not load it
---@param PrimaryAssetId FPrimaryAssetId
---@return UObject
function UKismetSystemLibrary.GetObjectFromPrimaryAssetId(PrimaryAssetId) end

---Returns the actual object name.
---@param Object UObject
---@return string
function UKismetSystemLibrary.GetObjectName(Object) end

---Returns the outer object of an object.
---@param Object UObject
---@return UObject
function UKismetSystemLibrary.GetOuterObject(Object) end

---Returns the full path to the specified object as a string
---@param Object UObject
---@return string
function UKismetSystemLibrary.GetPathName(Object) end

---Returns the current platform time in seconds. Not coupled to any gameplay or other containerization logic - this
---function is useful for timing execution time or timestamping data. Marked as callable rather than pure because
---implicit evaluation may be confusing, both for blueprint authors and blueprint readers. For implicit execution
---simply wrap it in a blueprint pure function.
---@return number
function UKismetSystemLibrary.GetPlatformTime_Seconds() end

---Get the current user dir from the OS
---@return string
function UKismetSystemLibrary.GetPlatformUserDir() end

---Get the current user name from the OS
---@return string
function UKismetSystemLibrary.GetPlatformUserName() end

---Returns an array of the user's preferred languages in order of preference
---@return TArray<string>
function UKismetSystemLibrary.GetPreferredLanguages() end

---Returns the Primary Asset Id for a Class, this can return an invalid one if not registered
---@param Class TSubclassOf<UObject>
---@return FPrimaryAssetId
function UKismetSystemLibrary.GetPrimaryAssetIdFromClass(Class) end

---Returns the Primary Asset Id for an Object, this can return an invalid one if not registered
---@param Object UObject
---@return FPrimaryAssetId
function UKismetSystemLibrary.GetPrimaryAssetIdFromObject(Object) end

---Returns the Primary Asset Id for a Soft Class Reference, this can return an invalid one if not registered
---@param SoftClassReference TSoftClassPtr<UObject>
---@return FPrimaryAssetId
function UKismetSystemLibrary.GetPrimaryAssetIdFromSoftClassReference(SoftClassReference) end

---Returns the Primary Asset Id for a Soft Object Reference, this can return an invalid one if not registered
---@param SoftObjectReference TSoftObjectPtr<UObject>
---@return FPrimaryAssetId
function UKismetSystemLibrary.GetPrimaryAssetIdFromSoftObjectReference(SoftObjectReference) end

---Returns list of PrimaryAssetIds for a PrimaryAssetType
---@param PrimaryAssetType FPrimaryAssetType
---@param OutPrimaryAssetIdList TArray<FPrimaryAssetId> @[out]
function UKismetSystemLibrary.GetPrimaryAssetIdList(PrimaryAssetType, OutPrimaryAssetIdList) end

---Returns the list of assets that are in a given bundle state. Required Bundles must be specified
---If ExcludedBundles is not empty, it will not return any assets in those bundle states
---If ValidTypes is not empty, it will only return assets of those types
---If ForceCurrentState is true it will use the current state even if a load is in process
---@param RequiredBundles TArray<string>
---@param ExcludedBundles TArray<string>
---@param ValidTypes TArray<FPrimaryAssetType>
---@param bForceCurrentState boolean
---@param OutPrimaryAssetIdList TArray<FPrimaryAssetId> @[out]
function UKismetSystemLibrary.GetPrimaryAssetsWithBundleState(RequiredBundles, ExcludedBundles, ValidTypes, bForceCurrentState, OutPrimaryAssetIdList) end

---Get the content directory of the current project
---@return string
function UKismetSystemLibrary.GetProjectContentDirectory() end

---Get the directory of the current project
---@return string
function UKismetSystemLibrary.GetProjectDirectory() end

---Get the saved directory of the current project
---@return string
function UKismetSystemLibrary.GetProjectSavedDirectory() end

---Get the clamped state of r.DetailMode, see console variable help (allows for scalability, cannot be used in construction scripts)
---0: low, show only object with DetailMode low or higher
---1: medium, show all object with DetailMode medium or higher
---2: high, show all objects
---@return integer
function UKismetSystemLibrary.GetRenderingDetailMode() end

---Get the clamped state of r.MaterialQualityLevel, see console variable help (allows for scalability, cannot be used in construction scripts)
---0: low
---1: high
---2: medium
---@return integer
function UKismetSystemLibrary.GetRenderingMaterialQualityLevel() end

---Returns the full path to the specified class as a Soft Class Path (that can be used as a Soft Object Path)
---@param Class TSubclassOf<UObject>
---@return FSoftClassPath
function UKismetSystemLibrary.GetSoftClassPath(Class) end

---Returns the Blueprint Class Id associated with a Primary Asset Id, this works even if the asset is not loaded
---@param PrimaryAssetId FPrimaryAssetId
---@return TSoftClassPtr<UObject>
function UKismetSystemLibrary.GetSoftClassReferenceFromPrimaryAssetId(PrimaryAssetId) end

---Converts a Soft Class Reference to a Top Level Asset Path used by asset utilities
---@param SoftClassReference TSoftClassPtr<UObject>
---@return FTopLevelAssetPath
function UKismetSystemLibrary.GetSoftClassTopLevelAssetPath(SoftClassReference) end

---Returns the full path to the specified object as a Soft Object Path
---@param Object UObject
---@return FSoftObjectPath
function UKismetSystemLibrary.GetSoftObjectPath(Object) end

---Returns the Object Id associated with a Primary Asset Id, this works even if the asset is not loaded
---@param PrimaryAssetId FPrimaryAssetId
---@return TSoftObjectPtr<UObject>
function UKismetSystemLibrary.GetSoftObjectReferenceFromPrimaryAssetId(PrimaryAssetId) end

---Returns the full path to the specified struct as a Top Level Asset Path used by asset utilities
---@param Struct UScriptStruct
---@return FTopLevelAssetPath
function UKismetSystemLibrary.GetStructTopLevelAssetPath(Struct) end

---Gets the list of support fullscreen resolutions.
---@param Resolutions TArray<FIntPoint> @[out]
---@return boolean
function UKismetSystemLibrary.GetSupportedFullscreenResolutions(Resolutions) end

---Returns the full file system path to a UObject
---If given a non-asset UObject, it will return an empty string
---@param Object UObject
---@return string
function UKismetSystemLibrary.GetSystemPath(Object) end

---Returns the platform specific unique device id
---@return string
function UKismetSystemLibrary.GetUniqueDeviceId() end

---Returns true if system default handling of volume up and volume down buttons enabled (Android only)
---@return boolean
function UKismetSystemLibrary.GetVolumeButtonsHandledBySystem() end

---Returns whether there are currently multiple local players in the given world
---@param WorldContextObject UObject
---@return boolean
function UKismetSystemLibrary.HasMultipleLocalPlayers(WorldContextObject) end

---Hides the ad banner (iAd on iOS, or AdMob on Android). Will force close the ad if it's open
---(iOS and Android only)
function UKismetSystemLibrary.HideAdBanner() end

---Returns true if controller id assigned to a gamepad (Android and iOS only)
---@param ControllerId integer
---@return boolean
function UKismetSystemLibrary.IsControllerAssignedToGamepad(ControllerId) end

---Returns whether this is running on a dedicated server
---@param WorldContextObject UObject
---@return boolean
function UKismetSystemLibrary.IsDedicatedServer(WorldContextObject) end

---Returns true if the requested interstitial ad is loaded and ready
---(Android only)
---@return boolean
function UKismetSystemLibrary.IsInterstitialAdAvailable() end

---Returns true if the requested interstitial ad has been successfully requested (false if load request fails)
---(Android only)
---@return boolean
function UKismetSystemLibrary.IsInterstitialAdRequested() end

---Returns whether the player is logged in to the currently active online subsystem.
---@param SpecificPlayer APlayerController
---@return boolean
function UKismetSystemLibrary.IsLoggedIn(SpecificPlayer) end

---Returns whether this is a build that is packaged for distribution
---@return boolean
function UKismetSystemLibrary.IsPackagedForDistribution() end

---Returns true if screen saver is enabled.
---@return boolean
function UKismetSystemLibrary.IsScreensaverEnabled() end

---Returns whether the world this object is in is the host or not
---@param WorldContextObject UObject
---@return boolean
function UKismetSystemLibrary.IsServer(WorldContextObject) end

---@param WorldContextObject UObject
---@return boolean
function UKismetSystemLibrary.IsSplitScreen(WorldContextObject) end

---Returns whether this game instance is stand alone (no networking).
---@param WorldContextObject UObject
---@return boolean
function UKismetSystemLibrary.IsStandalone(WorldContextObject) end

---Returns true if running unattended (-unattended is on the command line)
---@return boolean
function UKismetSystemLibrary.IsUnattended() end

---Return true if the object is usable : non-null and not pending kill
---@param Object UObject
---@return boolean
function UKismetSystemLibrary.IsValid(Object) end

---Return true if the class is usable : non-null and not pending kill
---@param Class TSubclassOf<UObject>
---@return boolean
function UKismetSystemLibrary.IsValidClass(Class) end

---Returns true if the Primary Asset Id is valid
---@param PrimaryAssetId FPrimaryAssetId
---@return boolean
function UKismetSystemLibrary.IsValidPrimaryAssetId(PrimaryAssetId) end

---Returns list of Primary Asset Ids for a PrimaryAssetType
---@param PrimaryAssetType FPrimaryAssetType
---@return boolean
function UKismetSystemLibrary.IsValidPrimaryAssetType(PrimaryAssetType) end

---Returns true if the Soft Class Reference is not null
---@param SoftClassReference TSoftClassPtr<UObject>
---@return boolean
function UKismetSystemLibrary.IsValidSoftClassReference(SoftClassReference) end

---Returns true if the Soft Object Reference is not null
---@param SoftObjectReference TSoftObjectPtr<UObject>
---@return boolean
function UKismetSystemLibrary.IsValidSoftObjectReference(SoftObjectReference) end

---Clears a set timer.
---@param WorldContextObject UObject
---@param Handle FTimerHandle @[out]
function UKismetSystemLibrary.K2_ClearAndInvalidateTimerHandle(WorldContextObject, Handle) end

---Clears a set timer.
---@param Object UObject
---@param FunctionName string
function UKismetSystemLibrary.K2_ClearTimer(Object, FunctionName) end

---Clears a set timer.
---@param Delegate Delegate|fun()
function UKismetSystemLibrary.K2_ClearTimerDelegate(Delegate) end

---Clears a set timer.
---@param WorldContextObject UObject
---@param Handle FTimerHandle
function UKismetSystemLibrary.K2_ClearTimerHandle(WorldContextObject, Handle) end

---Returns elapsed time for the given delegate (time since current countdown iteration began).
---@param Object UObject
---@param FunctionName string
---@return number
function UKismetSystemLibrary.K2_GetTimerElapsedTime(Object, FunctionName) end

---Returns elapsed time for the given delegate (time since current countdown iteration began).
---@param Delegate Delegate|fun()
---@return number
function UKismetSystemLibrary.K2_GetTimerElapsedTimeDelegate(Delegate) end

---Returns elapsed time for the given handle (time since current countdown iteration began).
---@param WorldContextObject UObject
---@param Handle FTimerHandle
---@return number
function UKismetSystemLibrary.K2_GetTimerElapsedTimeHandle(WorldContextObject, Handle) end

---Returns time until the timer will next execute its delegate.
---@param Object UObject
---@param FunctionName string
---@return number
function UKismetSystemLibrary.K2_GetTimerRemainingTime(Object, FunctionName) end

---Returns time until the timer will next execute its delegate.
---@param Delegate Delegate|fun()
---@return number
function UKismetSystemLibrary.K2_GetTimerRemainingTimeDelegate(Delegate) end

---Returns time until the timer will next execute its handle.
---@param WorldContextObject UObject
---@param Handle FTimerHandle
---@return number
function UKismetSystemLibrary.K2_GetTimerRemainingTimeHandle(WorldContextObject, Handle) end

---Invalidate the supplied TimerHandle and return it.
---@param Handle FTimerHandle @[out]
---@return FTimerHandle
function UKismetSystemLibrary.K2_InvalidateTimerHandle(Handle) end

---Returns true if a timer exists and is active for the given delegate, false otherwise.
---@param Object UObject
---@param FunctionName string
---@return boolean
function UKismetSystemLibrary.K2_IsTimerActive(Object, FunctionName) end

---Returns true if a timer exists and is active for the given delegate, false otherwise.
---@param Delegate Delegate|fun()
---@return boolean
function UKismetSystemLibrary.K2_IsTimerActiveDelegate(Delegate) end

---Returns true if a timer exists and is active for the given handle, false otherwise.
---@param WorldContextObject UObject
---@param Handle FTimerHandle
---@return boolean
function UKismetSystemLibrary.K2_IsTimerActiveHandle(WorldContextObject, Handle) end

---Returns true if a timer exists and is paused for the given delegate, false otherwise.
---@param Object UObject
---@param FunctionName string
---@return boolean
function UKismetSystemLibrary.K2_IsTimerPaused(Object, FunctionName) end

---Returns true if a timer exists and is paused for the given delegate, false otherwise.
---@param Delegate Delegate|fun()
---@return boolean
function UKismetSystemLibrary.K2_IsTimerPausedDelegate(Delegate) end

---Returns true if a timer exists and is paused for the given handle, false otherwise.
---@param WorldContextObject UObject
---@param Handle FTimerHandle
---@return boolean
function UKismetSystemLibrary.K2_IsTimerPausedHandle(WorldContextObject, Handle) end

---Returns whether the timer handle is valid. This does not indicate that there is an active timer that this handle references, but rather that it once referenced a valid timer.
---@param Handle FTimerHandle
---@return boolean
function UKismetSystemLibrary.K2_IsValidTimerHandle(Handle) end

---Pauses a set timer at its current elapsed time.
---@param Object UObject
---@param FunctionName string
function UKismetSystemLibrary.K2_PauseTimer(Object, FunctionName) end

---Pauses a set timer at its current elapsed time.
---@param Delegate Delegate|fun()
function UKismetSystemLibrary.K2_PauseTimerDelegate(Delegate) end

---Pauses a set timer at its current elapsed time.
---@param WorldContextObject UObject
---@param Handle FTimerHandle
function UKismetSystemLibrary.K2_PauseTimerHandle(WorldContextObject, Handle) end

---Set a timer to execute delegate. Setting an existing timer will reset that timer with updated parameters.
---@param Object UObject
---@param FunctionName string
---@param Time number
---@param bLooping boolean
---@param InitialStartDelay? number @[default: 0.000000]
---@param InitialStartDelayVariance? number @[default: 0.000000]
---@return FTimerHandle
function UKismetSystemLibrary.K2_SetTimer(Object, FunctionName, Time, bLooping, InitialStartDelay, InitialStartDelayVariance) end

---Set a timer to execute delegate. Setting an existing timer will reset that timer with updated parameters.
---@param Delegate Delegate|fun()
---@param Time number
---@param bLooping boolean
---@param InitialStartDelay? number @[default: 0.000000]
---@param InitialStartDelayVariance? number @[default: 0.000000]
---@return FTimerHandle
function UKismetSystemLibrary.K2_SetTimerDelegate(Delegate, Time, bLooping, InitialStartDelay, InitialStartDelayVariance) end

---Set a timer to execute a delegate on the next tick.
---@param Object UObject
---@param FunctionName string
---@return FTimerHandle
function UKismetSystemLibrary.K2_SetTimerForNextTick(Object, FunctionName) end

---Set a timer to execute a delegate next tick.
---@param Delegate Delegate|fun()
---@return FTimerHandle
function UKismetSystemLibrary.K2_SetTimerForNextTickDelegate(Delegate) end

---Returns true is a timer for the given delegate exists, false otherwise.
---@param Object UObject
---@param FunctionName string
---@return boolean
function UKismetSystemLibrary.K2_TimerExists(Object, FunctionName) end

---Returns true is a timer for the given delegate exists, false otherwise.
---@param Delegate Delegate|fun()
---@return boolean
function UKismetSystemLibrary.K2_TimerExistsDelegate(Delegate) end

---Returns true is a timer for the given handle exists, false otherwise.
---@param WorldContextObject UObject
---@param Handle FTimerHandle
---@return boolean
function UKismetSystemLibrary.K2_TimerExistsHandle(WorldContextObject, Handle) end

---Resumes a paused timer from its current elapsed time.
---@param Object UObject
---@param FunctionName string
function UKismetSystemLibrary.K2_UnPauseTimer(Object, FunctionName) end

---Resumes a paused timer from its current elapsed time.
---@param Delegate Delegate|fun()
function UKismetSystemLibrary.K2_UnPauseTimerDelegate(Delegate) end

---Resumes a paused timer from its current elapsed time.
---@param WorldContextObject UObject
---@param Handle FTimerHandle
function UKismetSystemLibrary.K2_UnPauseTimerHandle(WorldContextObject, Handle) end

---Opens the specified URL in the platform's web browser of choice
---@param URL string
function UKismetSystemLibrary.LaunchURL(URL) end

---Does a collision trace along the given line and returns all hits encountered up to and including the first blocking hit.
---This trace finds the objects that RESPOND to the given TraceChannel
---@param WorldContextObject UObject
---@param Start FVector
---@param End FVector
---@param TraceChannel integer
---@param bTraceComplex boolean
---@param ActorsToIgnore TArray<AActor>
---@param DrawDebugType integer
---@param OutHits TArray<FHitResult> @[out]
---@param bIgnoreSelf boolean
---@param TraceColor? FLinearColor @[default: (R=1.000000,G=0.000000,B=0.000000,A=1.000000)]
---@param TraceHitColor? FLinearColor @[default: (R=0.000000,G=1.000000,B=0.000000,A=1.000000)]
---@param DrawTime? number @[default: 5.000000]
---@return boolean
function UKismetSystemLibrary.LineTraceMulti(WorldContextObject, Start, End, TraceChannel, bTraceComplex, ActorsToIgnore, DrawDebugType, OutHits, bIgnoreSelf, TraceColor, TraceHitColor, DrawTime) end

---Trace a ray against the world using a specific profile and return overlapping hits and then first blocking hit
---Results are sorted, so a blocking hit (if found) will be the last element of the array
---Only the single closest blocking result will be generated, no tests will be done after that
---@param WorldContextObject UObject
---@param Start FVector
---@param End FVector
---@param ProfileName string
---@param bTraceComplex boolean
---@param ActorsToIgnore TArray<AActor>
---@param DrawDebugType integer
---@param OutHits TArray<FHitResult> @[out]
---@param bIgnoreSelf boolean
---@param TraceColor? FLinearColor @[default: (R=1.000000,G=0.000000,B=0.000000,A=1.000000)]
---@param TraceHitColor? FLinearColor @[default: (R=0.000000,G=1.000000,B=0.000000,A=1.000000)]
---@param DrawTime? number @[default: 5.000000]
---@return boolean
function UKismetSystemLibrary.LineTraceMultiByProfile(WorldContextObject, Start, End, ProfileName, bTraceComplex, ActorsToIgnore, DrawDebugType, OutHits, bIgnoreSelf, TraceColor, TraceHitColor, DrawTime) end

---Does a collision trace along the given line and returns all hits encountered.
---This only finds objects that are of a type specified by ObjectTypes.
---@param WorldContextObject UObject
---@param Start FVector
---@param End FVector
---@param ObjectTypes TArray<integer>
---@param bTraceComplex boolean
---@param ActorsToIgnore TArray<AActor>
---@param DrawDebugType integer
---@param OutHits TArray<FHitResult> @[out]
---@param bIgnoreSelf boolean
---@param TraceColor? FLinearColor @[default: (R=1.000000,G=0.000000,B=0.000000,A=1.000000)]
---@param TraceHitColor? FLinearColor @[default: (R=0.000000,G=1.000000,B=0.000000,A=1.000000)]
---@param DrawTime? number @[default: 5.000000]
---@return boolean
function UKismetSystemLibrary.LineTraceMultiForObjects(WorldContextObject, Start, End, ObjectTypes, bTraceComplex, ActorsToIgnore, DrawDebugType, OutHits, bIgnoreSelf, TraceColor, TraceHitColor, DrawTime) end

---Does a collision trace along the given line and returns the first blocking hit encountered.
---This trace finds the objects that RESPONDS to the given TraceChannel
---@param WorldContextObject UObject
---@param Start FVector
---@param End FVector
---@param TraceChannel integer
---@param bTraceComplex boolean
---@param ActorsToIgnore TArray<AActor>
---@param DrawDebugType integer
---@param OutHit FHitResult @[out]
---@param bIgnoreSelf boolean
---@param TraceColor? FLinearColor @[default: (R=1.000000,G=0.000000,B=0.000000,A=1.000000)]
---@param TraceHitColor? FLinearColor @[default: (R=0.000000,G=1.000000,B=0.000000,A=1.000000)]
---@param DrawTime? number @[default: 5.000000]
---@return boolean
function UKismetSystemLibrary.LineTraceSingle(WorldContextObject, Start, End, TraceChannel, bTraceComplex, ActorsToIgnore, DrawDebugType, OutHit, bIgnoreSelf, TraceColor, TraceHitColor, DrawTime) end

---Trace a ray against the world using a specific profile and return the first blocking hit
---@param WorldContextObject UObject
---@param Start FVector
---@param End FVector
---@param ProfileName string
---@param bTraceComplex boolean
---@param ActorsToIgnore TArray<AActor>
---@param DrawDebugType integer
---@param OutHit FHitResult @[out]
---@param bIgnoreSelf boolean
---@param TraceColor? FLinearColor @[default: (R=1.000000,G=0.000000,B=0.000000,A=1.000000)]
---@param TraceHitColor? FLinearColor @[default: (R=0.000000,G=1.000000,B=0.000000,A=1.000000)]
---@param DrawTime? number @[default: 5.000000]
---@return boolean
function UKismetSystemLibrary.LineTraceSingleByProfile(WorldContextObject, Start, End, ProfileName, bTraceComplex, ActorsToIgnore, DrawDebugType, OutHit, bIgnoreSelf, TraceColor, TraceHitColor, DrawTime) end

---Does a collision trace along the given line and returns the first hit encountered.
---This only finds objects that are of a type specified by ObjectTypes.
---@param WorldContextObject UObject
---@param Start FVector
---@param End FVector
---@param ObjectTypes TArray<integer>
---@param bTraceComplex boolean
---@param ActorsToIgnore TArray<AActor>
---@param DrawDebugType integer
---@param OutHit FHitResult @[out]
---@param bIgnoreSelf boolean
---@param TraceColor? FLinearColor @[default: (R=1.000000,G=0.000000,B=0.000000,A=1.000000)]
---@param TraceHitColor? FLinearColor @[default: (R=0.000000,G=1.000000,B=0.000000,A=1.000000)]
---@param DrawTime? number @[default: 5.000000]
---@return boolean
function UKismetSystemLibrary.LineTraceSingleForObjects(WorldContextObject, Start, End, ObjectTypes, bTraceComplex, ActorsToIgnore, DrawDebugType, OutHit, bIgnoreSelf, TraceColor, TraceHitColor, DrawTime) end

---@param WorldContextObject UObject
---@param Asset TSoftObjectPtr<UObject>
---@param OnLoaded Delegate|fun(Loaded: UObject)
function UKismetSystemLibrary.LoadAsset(WorldContextObject, Asset, OnLoaded) end

---Resolves or loads a Soft Object Reference immediately, this will cause hitches and Async Load Asset should be used if possible
---@param Asset TSoftObjectPtr<UObject>
---@return UObject
function UKismetSystemLibrary.LoadAsset_Blocking(Asset) end

---@param WorldContextObject UObject
---@param AssetClass TSoftClassPtr<UObject>
---@param OnLoaded Delegate|fun(Loaded: TSubclassOf<UObject>)
function UKismetSystemLibrary.LoadAssetClass(WorldContextObject, AssetClass, OnLoaded) end

---Resolves or loads a Soft Class Reference immediately, this will cause hitches and Async Load Class Asset should be used if possible
---@param AssetClass TSoftClassPtr<UObject>
---@return TSubclassOf<UObject>
function UKismetSystemLibrary.LoadClassAsset_Blocking(AssetClass) end

---Will load a fullscreen interstitial AdMob ad. Call this before using ShowInterstitialAd
---(Android only)
---@param AdIdIndex integer @The index of the ID to select for the ad to show
function UKismetSystemLibrary.LoadInterstitialAd(AdIdIndex) end

---Prints a string to the log
---If Print To Log is true, it will be visible in the Output Log window.  Otherwise it will be logged only as 'Verbose', so it generally won't show up.
---@param InString? string @[default: Hello]
---@param bPrintToLog? boolean @[default: true]
function UKismetSystemLibrary.LogString(InString, bPrintToLog) end

---Builds an ARFilter struct. You should be using ClassPaths and RecursiveClassPathsExclusionSet, ClassNames and RecursiveClassesExclusionSet are deprecated.
---@param PackageNames TArray<string>
---@param PackagePaths TArray<string>
---@param SoftObjectPaths TArray<FSoftObjectPath>
---@param ClassPaths TArray<FTopLevelAssetPath>
---@param RecursiveClassPathsExclusionSet TSet<FTopLevelAssetPath>
---@param ClassNames TArray<string> @[DEPRECATED] - Class names are now represented by path names. If non-empty, this input will result in a runtime warning. Please use the ClassPaths input instead.
---@param RecursiveClassesExclusionSet TSet<string> @[DEPRECATED] - Class names are now represented by path names. If non-empty, this input will result in a runtime warning. Please use the RecursiveClassPathsExclusionSet input instead.
---@param bRecursivePaths? boolean @[default: false]
---@param bRecursiveClasses? boolean @[default: false]
---@param bIncludeOnlyOnDiskAssets? boolean @[default: false]
---@return FARFilter
function UKismetSystemLibrary.MakeARFilter(PackageNames, PackagePaths, SoftObjectPaths, ClassPaths, RecursiveClassPathsExclusionSet, ClassNames, RecursiveClassesExclusionSet, bRecursivePaths, bRecursiveClasses, bIncludeOnlyOnDiskAssets) end

---Creates a literal bool
---@param Value boolean
---@return boolean
function UKismetSystemLibrary.MakeLiteralBool(Value) end

---Creates a literal byte
---@param Value integer
---@return integer
function UKismetSystemLibrary.MakeLiteralByte(Value) end

---Creates a literal float (double-precision)
---@param Value number
---@return number
function UKismetSystemLibrary.MakeLiteralDouble(Value) end

---Creates a literal integer
---@param Value integer
---@return integer
function UKismetSystemLibrary.MakeLiteralInt(Value) end

---Creates a literal 64-bit integer
---@param Value integer
---@return integer
function UKismetSystemLibrary.MakeLiteralInt64(Value) end

---Creates a literal name
---@param Value string
---@return string
function UKismetSystemLibrary.MakeLiteralName(Value) end

---Creates a literal string
---@param Value string
---@return string
function UKismetSystemLibrary.MakeLiteralString(Value) end

---Creates a literal FText
---@param Value string
---@return string
function UKismetSystemLibrary.MakeLiteralText(Value) end

---Builds a Soft Class Path struct from a string that contains a full /folder/packagename.class path.
---For blueprint classes, this needs to point to the actual class (often with _C) and not the blueprint editor asset
---@param PathString string
---@return FSoftClassPath
function UKismetSystemLibrary.MakeSoftClassPath(PathString) end

---Builds a Soft Object Path struct from a string that contains a full /folder/packagename.object path
---@param PathString string
---@return FSoftObjectPath
function UKismetSystemLibrary.MakeSoftObjectPath(PathString) end

---Builds a TopLevelAssetPath struct from single Path string or from PackageName and AssetName string.
---@param PackageName string
---@param AssetName string
---@return FTopLevelAssetPath
function UKismetSystemLibrary.MakeTopLevelAssetPath(PackageName, AssetName) end

---* Interpolate a component to the specified relative location and rotation over the course of OverTime seconds.
---* @@param Component                                             Component to interpolate
---* @@param TargetRelativeLocation                Relative target location
---* @@param TargetRelativeRotation                Relative target rotation
---* @@param bEaseOut                                              if true we will ease out (ie end slowly) during interpolation
---* @@param bEaseIn                                               if true we will ease in (ie start slowly) during interpolation
---* @@param OverTime                                              duration of interpolation
---* @@param bForceShortestRotationPath    if true we will always use the shortest path for rotation
---* @@param MoveAction                                    required movement behavior @@see EMoveComponentAction
---* @@param LatentInfo                                    The latent action
---@param Component USceneComponent
---@param TargetRelativeLocation FVector
---@param TargetRelativeRotation FRotator
---@param bEaseOut boolean
---@param bEaseIn boolean
---@param OverTime number
---@param bForceShortestRotationPath boolean
---@param MoveAction integer
function UKismetSystemLibrary.MoveComponentTo(Component, TargetRelativeLocation, TargetRelativeRotation, bEaseOut, bEaseIn, OverTime, bForceShortestRotationPath, MoveAction) end

---Convert all / and \ to TEXT("/")
---@param InFilename string
---@return string
function UKismetSystemLibrary.NormalizeFilename(InFilename) end

---Returns true if the values are not equal (A != B)
---@param A FPrimaryAssetId
---@param B FPrimaryAssetId
---@return boolean
function UKismetSystemLibrary.NotEqual_PrimaryAssetId(A, B) end

---Returns true if the values are not equal (A != B)
---@param A FPrimaryAssetType
---@param B FPrimaryAssetType
---@return boolean
function UKismetSystemLibrary.NotEqual_PrimaryAssetType(A, B) end

---Returns true if the values are not equal (A != B)
---@param A TSoftClassPtr<UObject>
---@param B TSoftClassPtr<UObject>
---@return boolean
function UKismetSystemLibrary.NotEqual_SoftClassReference(A, B) end

---Returns true if the values are not equal (A != B)
---@param A TSoftObjectPtr<UObject>
---@param B TSoftObjectPtr<UObject>
---@return boolean
function UKismetSystemLibrary.NotEqual_SoftObjectReference(A, B) end

---@param Loaded TSubclassOf<UObject>
function UKismetSystemLibrary:OnAssetClassLoaded__DelegateSignature(Loaded) end

---@param Loaded UObject
function UKismetSystemLibrary:OnAssetLoaded__DelegateSignature(Loaded) end

---* Parses the given string into loose tokens, switches (arguments that begin with - or /) and parameters (-mySwitch=myVar)
---*
---* @@param        InCmdLine                       The the string to parse (ie '-foo -bar=/game/baz testtoken' )
---* @@param        OutTokens[out]          Filled with all loose tokens found in the string (ie: testToken in above example)
---* @@param        OutSwitches[out]        Filled with all switches found in the string (ie -foo)
---* @@param        OutParams[out]          Filled with all switches found in the string with the format key = value (ie: -bar, /game/baz)
---@param InCmdLine string
---@param OutTokens TArray<string> @[out]
---@param OutSwitches TArray<string> @[out]
---@param OutParams TMap<string, string> @[out]
function UKismetSystemLibrary.ParseCommandLine(InCmdLine, OutTokens, OutSwitches, OutParams) end

---Returns true if the string has -param in it (do not specify the leading -)
---@param InString string
---@param InParam string
---@return boolean
function UKismetSystemLibrary.ParseParam(InString, InParam) end

---Returns 'value' if -option=value is in the string
---@param InString string
---@param InParam string
---@param OutValue string @[out]
---@return boolean
function UKismetSystemLibrary.ParseParamValue(InString, InParam, OutValue) end

---Prints a string to the log, and optionally, to the screen
---If Print To Log is true, it will be visible in the Output Log window.  Otherwise it will be logged only as 'Verbose', so it generally won't show up.
---@param WorldContextObject UObject
---@param InString? string @[default: Hello]
---@param bPrintToScreen? boolean @[default: true]
---@param bPrintToLog? boolean @[default: true]
---@param TextColor? FLinearColor @[default: (R=0.000000,G=0.660000,B=1.000000,A=1.000000)]
---@param Duration? number @[default: 2.000000]
---@param Key? string @[default: None]
function UKismetSystemLibrary.PrintString(WorldContextObject, InString, bPrintToScreen, bPrintToLog, TextColor, Duration, Key) end

---Prints text to the log, and optionally, to the screen
---If Print To Log is true, it will be visible in the Output Log window.  Otherwise it will be logged only as 'Verbose', so it generally won't show up.
---@param WorldContextObject UObject
---@param InText? string @[default: INVTEXT("Hello")]
---@param bPrintToScreen? boolean @[default: true]
---@param bPrintToLog? boolean @[default: true]
---@param TextColor? FLinearColor @[default: (R=0.000000,G=0.660000,B=1.000000,A=1.000000)]
---@param Duration? number @[default: 2.000000]
---@param Key? string @[default: None]
function UKismetSystemLibrary.PrintText(WorldContextObject, InText, bPrintToScreen, bPrintToLog, TextColor, Duration, Key) end

---Prints a warning string to the log and the screen. Meant to be used as a way to inform the user that they misused the node.
---WARNING!! Don't change the signature of this function without fixing up all nodes using it in the compiler
---@param InString string
function UKismetSystemLibrary.PrintWarning(InString) end

---Exit the editor
function UKismetSystemLibrary.QuitEditor() end

---Exit the current game
---@param WorldContextObject UObject
---@param SpecificPlayer APlayerController
---@param QuitPreference integer
---@param bIgnorePlatformRestrictions boolean
function UKismetSystemLibrary.QuitGame(WorldContextObject, SpecificPlayer, QuitPreference, bIgnorePlatformRestrictions) end

---Requests permission to send remote notifications to the user's device.
---(Android and iOS only)
function UKismetSystemLibrary.RegisterForRemoteNotifications() end

---Resets the gamepad to player controller id assignments (Android and iOS only)
function UKismetSystemLibrary.ResetGamepadAssignments() end

---* Resets the gamepad assignment to player controller id (Android and iOS only)
---@param ControllerId integer
function UKismetSystemLibrary.ResetGamepadAssignmentToController(ControllerId) end

---Perform a latent action with a retriggerable delay (specified in seconds).  Calling again while it is counting down will reset the countdown to Duration.
---@param WorldContextObject UObject
---@param Duration number @length of delay (in seconds).
function UKismetSystemLibrary.RetriggerableDelay(WorldContextObject, Duration) end

---Set a bool property by name
---@param Object UObject
---@param PropertyName string
---@param Value boolean
function UKismetSystemLibrary.SetBoolPropertyByName(Object, PropertyName, Value) end

---Set an uint8 or enum property by name
---@param Object UObject
---@param PropertyName string
---@param Value integer
function UKismetSystemLibrary.SetBytePropertyByName(Object, PropertyName, Value) end

---Set a CLASS property by name
---@param Object UObject
---@param PropertyName string
---@param Value TSubclassOf<UObject>
function UKismetSystemLibrary.SetClassPropertyByName(Object, PropertyName, Value) end

---Set a CollisionProfileName property by name
---@param Object UObject
---@param PropertyName string
---@param Value FCollisionProfileName
function UKismetSystemLibrary.SetCollisionProfileNameProperty(Object, PropertyName, Value) end

---Set a COLOR property by name
---@param Object UObject
---@param PropertyName string
---@param Value FColor
function UKismetSystemLibrary.SetColorPropertyByName(Object, PropertyName, Value) end

---Set a double property by name
---@param Object UObject
---@param PropertyName string
---@param Value number
function UKismetSystemLibrary.SetDoublePropertyByName(Object, PropertyName, Value) end

---Attempts to set the value of a named property on the given object.
---@param Object UObject @The object you want to set a property value on.
---@param PropertyName string @The name of the object property to set the value of.
---@param PropertyValue integer @The property value to set.
---@param ChangeNotifyMode EPropertyAccessChangeNotifyMode @When to emit property change notifications.
---@return boolean
function UKismetSystemLibrary.SetEditorProperty(Object, PropertyName, PropertyValue, ChangeNotifyMode) end

---Set a SOFTOBJECT property by name
---@param Object UObject
---@param PropertyName string
---@param Value Unknown
function UKismetSystemLibrary.SetFieldPathPropertyByName(Object, PropertyName, Value) end

---Sets whether attached gamepads will block feedback from the device itself (Mobile only).
---@param bBlock boolean
function UKismetSystemLibrary.SetGamepadsBlockDeviceFeedback(bBlock) end

---Set an int64 property by name
---@param Object UObject
---@param PropertyName string
---@param Value integer
function UKismetSystemLibrary.SetInt64PropertyByName(Object, PropertyName, Value) end

---Set an INTERFACE property by name
---@param Object UObject
---@param PropertyName string
---@param Value TScriptInterface<UInterface>
function UKismetSystemLibrary.SetInterfacePropertyByName(Object, PropertyName, Value) end

---Set an int32 property by name
---@param Object UObject
---@param PropertyName string
---@param Value integer
function UKismetSystemLibrary.SetIntPropertyByName(Object, PropertyName, Value) end

---Set a LINEAR COLOR property by name
---@param Object UObject
---@param PropertyName string
---@param Value FLinearColor
function UKismetSystemLibrary.SetLinearColorPropertyByName(Object, PropertyName, Value) end

---Set a NAME property by name
---@param Object UObject
---@param PropertyName string
---@param Value string
function UKismetSystemLibrary.SetNamePropertyByName(Object, PropertyName, Value) end

---Set an OBJECT property by name
---@param Object UObject
---@param PropertyName string
---@param Value UObject
function UKismetSystemLibrary.SetObjectPropertyByName(Object, PropertyName, Value) end

---Set a ROTATOR property by name
---@param Object UObject
---@param PropertyName string
---@param Value FRotator
function UKismetSystemLibrary.SetRotatorPropertyByName(Object, PropertyName, Value) end

---Set a SOFTCLASS property by name
---@param Object UObject
---@param PropertyName string
---@param Value TSoftClassPtr<UObject>
function UKismetSystemLibrary.SetSoftClassPropertyByName(Object, PropertyName, Value) end

---Set a SOFTOBJECT property by name
---@param Object UObject
---@param PropertyName string
---@param Value TSoftObjectPtr<UObject>
function UKismetSystemLibrary.SetSoftObjectPropertyByName(Object, PropertyName, Value) end

---Set a STRING property by name
---@param Object UObject
---@param PropertyName string
---@param Value string
function UKismetSystemLibrary.SetStringPropertyByName(Object, PropertyName, Value) end

---Set a custom structure property by name
---@param Object UObject
---@param PropertyName string
---@param Value FGenericStruct
function UKismetSystemLibrary.SetStructurePropertyByName(Object, PropertyName, Value) end

---Sets the state of the transition message rendered by the viewport. (The blue text displayed when the game is paused and so forth.)
---@param WorldContextObject UObject
---@param bState boolean
function UKismetSystemLibrary.SetSuppressViewportTransitionMessage(WorldContextObject, bState) end

---Set a TEXT property by name
---@param Object UObject
---@param PropertyName string
---@param Value string
function UKismetSystemLibrary.SetTextPropertyByName(Object, PropertyName, Value) end

---Set a TRANSFORM property by name
---@param Object UObject
---@param PropertyName string
---@param Value FTransform
function UKismetSystemLibrary.SetTransformPropertyByName(Object, PropertyName, Value) end

---Tells the engine what the user is doing for debug, analytics, etc.
---@param UserActivity FUserActivity
function UKismetSystemLibrary.SetUserActivity(UserActivity) end

---Set a VECTOR3F property by name
---@param Object UObject
---@param PropertyName string
---@param Value FVector3f
function UKismetSystemLibrary.SetVector3fPropertyByName(Object, PropertyName, Value) end

---Set a VECTOR property by name
---@param Object UObject
---@param PropertyName string
---@param Value FVector
function UKismetSystemLibrary.SetVectorPropertyByName(Object, PropertyName, Value) end

---Allows or inhibits system default handling of volume up and volume down buttons (Android only)
---@param bEnabled boolean
function UKismetSystemLibrary.SetVolumeButtonsHandledBySystem(bEnabled) end

---Sets the game window title
---@param Title string
function UKismetSystemLibrary.SetWindowTitle(Title) end

---Will show an ad banner (iAd on iOS, or AdMob on Android) on the top or bottom of screen, on top of the GL view (doesn't resize the view)
---(iOS and Android only)
---@param AdIdIndex integer @The index of the ID to select for the ad to show
---@param bShowOnBottomOfScreen boolean @If true, the iAd will be shown at the bottom of the screen, top otherwise
function UKismetSystemLibrary.ShowAdBanner(AdIdIndex, bShowOnBottomOfScreen) end

---Shows the loaded interstitial ad (loaded with LoadInterstitialAd)
---(Android only)
function UKismetSystemLibrary.ShowInterstitialAd() end

---Displays the built-in achievements GUI (iOS and Android only; this function may be renamed or moved in a future release)
---@param SpecificPlayer APlayerController @Specific player's achievements to show. May not be supported on all platforms. If null, defaults to the player with ControllerId 0
function UKismetSystemLibrary.ShowPlatformSpecificAchievementsScreen(SpecificPlayer) end

---Displays the built-in leaderboard GUI (iOS and Android only; this function may be renamed or moved in a future release)
---@param CategoryName string
function UKismetSystemLibrary.ShowPlatformSpecificLeaderboardScreen(CategoryName) end

---Notify the current transaction (if any) that this object is about to be modified and should be snapshot for intermediate update.
---@param Object UObject
function UKismetSystemLibrary.SnapshotObject(Object) end

---Returns an array of actors that overlap the given sphere.
---@param WorldContextObject UObject
---@param SpherePos FVector
---@param SphereRadius number
---@param ObjectTypes TArray<integer>
---@param ActorClassFilter TSubclassOf<UObject>
---@param ActorsToIgnore TArray<AActor>
---@param OutActors TArray<AActor> @[out]
---@return boolean
function UKismetSystemLibrary.SphereOverlapActors(WorldContextObject, SpherePos, SphereRadius, ObjectTypes, ActorClassFilter, ActorsToIgnore, OutActors) end

---Returns an array of components that overlap the given sphere.
---@param WorldContextObject UObject
---@param SpherePos FVector
---@param SphereRadius number
---@param ObjectTypes TArray<integer>
---@param ComponentClassFilter TSubclassOf<UObject>
---@param ActorsToIgnore TArray<AActor>
---@param OutComponents TArray<UPrimitiveComponent> @[out]
---@return boolean
function UKismetSystemLibrary.SphereOverlapComponents(WorldContextObject, SpherePos, SphereRadius, ObjectTypes, ComponentClassFilter, ActorsToIgnore, OutComponents) end

---Sweeps a sphere along the given line and returns all hits encountered up to and including the first blocking hit.
---This trace finds the objects that RESPOND to the given TraceChannel
---@param WorldContextObject UObject
---@param Start FVector
---@param End FVector
---@param Radius number
---@param TraceChannel integer
---@param bTraceComplex boolean
---@param ActorsToIgnore TArray<AActor>
---@param DrawDebugType integer
---@param OutHits TArray<FHitResult> @[out]
---@param bIgnoreSelf boolean
---@param TraceColor? FLinearColor @[default: (R=1.000000,G=0.000000,B=0.000000,A=1.000000)]
---@param TraceHitColor? FLinearColor @[default: (R=0.000000,G=1.000000,B=0.000000,A=1.000000)]
---@param DrawTime? number @[default: 5.000000]
---@return boolean
function UKismetSystemLibrary.SphereTraceMulti(WorldContextObject, Start, End, Radius, TraceChannel, bTraceComplex, ActorsToIgnore, DrawDebugType, OutHits, bIgnoreSelf, TraceColor, TraceHitColor, DrawTime) end

---Sweep a sphere against the world and return all initial overlaps using a specific profile, then overlapping hits and then first blocking hit
---Results are sorted, so a blocking hit (if found) will be the last element of the array
---Only the single closest blocking result will be generated, no tests will be done after that
---@param WorldContextObject UObject
---@param Start FVector
---@param End FVector
---@param Radius number
---@param ProfileName string
---@param bTraceComplex boolean
---@param ActorsToIgnore TArray<AActor>
---@param DrawDebugType integer
---@param OutHits TArray<FHitResult> @[out]
---@param bIgnoreSelf boolean
---@param TraceColor? FLinearColor @[default: (R=1.000000,G=0.000000,B=0.000000,A=1.000000)]
---@param TraceHitColor? FLinearColor @[default: (R=0.000000,G=1.000000,B=0.000000,A=1.000000)]
---@param DrawTime? number @[default: 5.000000]
---@return boolean
function UKismetSystemLibrary.SphereTraceMultiByProfile(WorldContextObject, Start, End, Radius, ProfileName, bTraceComplex, ActorsToIgnore, DrawDebugType, OutHits, bIgnoreSelf, TraceColor, TraceHitColor, DrawTime) end

---Sweeps a sphere along the given line and returns all hits encountered.
---This only finds objects that are of a type specified by ObjectTypes.
---@param WorldContextObject UObject
---@param Start FVector
---@param End FVector
---@param Radius number
---@param ObjectTypes TArray<integer>
---@param bTraceComplex boolean
---@param ActorsToIgnore TArray<AActor>
---@param DrawDebugType integer
---@param OutHits TArray<FHitResult> @[out]
---@param bIgnoreSelf boolean
---@param TraceColor? FLinearColor @[default: (R=1.000000,G=0.000000,B=0.000000,A=1.000000)]
---@param TraceHitColor? FLinearColor @[default: (R=0.000000,G=1.000000,B=0.000000,A=1.000000)]
---@param DrawTime? number @[default: 5.000000]
---@return boolean
function UKismetSystemLibrary.SphereTraceMultiForObjects(WorldContextObject, Start, End, Radius, ObjectTypes, bTraceComplex, ActorsToIgnore, DrawDebugType, OutHits, bIgnoreSelf, TraceColor, TraceHitColor, DrawTime) end

---Sweeps a sphere along the given line and returns the first blocking hit encountered.
---This trace finds the objects that RESPONDS to the given TraceChannel
---@param WorldContextObject UObject
---@param Start FVector
---@param End FVector
---@param Radius number
---@param TraceChannel integer
---@param bTraceComplex boolean
---@param ActorsToIgnore TArray<AActor>
---@param DrawDebugType integer
---@param OutHit FHitResult @[out]
---@param bIgnoreSelf boolean
---@param TraceColor? FLinearColor @[default: (R=1.000000,G=0.000000,B=0.000000,A=1.000000)]
---@param TraceHitColor? FLinearColor @[default: (R=0.000000,G=1.000000,B=0.000000,A=1.000000)]
---@param DrawTime? number @[default: 5.000000]
---@return boolean
function UKismetSystemLibrary.SphereTraceSingle(WorldContextObject, Start, End, Radius, TraceChannel, bTraceComplex, ActorsToIgnore, DrawDebugType, OutHit, bIgnoreSelf, TraceColor, TraceHitColor, DrawTime) end

---Sweep a sphere against the world and return the first blocking hit using a specific profile
---@param WorldContextObject UObject
---@param Start FVector
---@param End FVector
---@param Radius number
---@param ProfileName string
---@param bTraceComplex boolean
---@param ActorsToIgnore TArray<AActor>
---@param DrawDebugType integer
---@param OutHit FHitResult @[out]
---@param bIgnoreSelf boolean
---@param TraceColor? FLinearColor @[default: (R=1.000000,G=0.000000,B=0.000000,A=1.000000)]
---@param TraceHitColor? FLinearColor @[default: (R=0.000000,G=1.000000,B=0.000000,A=1.000000)]
---@param DrawTime? number @[default: 5.000000]
---@return boolean
function UKismetSystemLibrary.SphereTraceSingleByProfile(WorldContextObject, Start, End, Radius, ProfileName, bTraceComplex, ActorsToIgnore, DrawDebugType, OutHit, bIgnoreSelf, TraceColor, TraceHitColor, DrawTime) end

---Sweeps a sphere along the given line and returns the first hit encountered.
---This only finds objects that are of a type specified by ObjectTypes.
---@param WorldContextObject UObject
---@param Start FVector
---@param End FVector
---@param Radius number
---@param ObjectTypes TArray<integer>
---@param bTraceComplex boolean
---@param ActorsToIgnore TArray<AActor>
---@param DrawDebugType integer
---@param OutHit FHitResult @[out]
---@param bIgnoreSelf boolean
---@param TraceColor? FLinearColor @[default: (R=1.000000,G=0.000000,B=0.000000,A=1.000000)]
---@param TraceHitColor? FLinearColor @[default: (R=0.000000,G=1.000000,B=0.000000,A=1.000000)]
---@param DrawTime? number @[default: 5.000000]
---@return boolean
function UKismetSystemLibrary.SphereTraceSingleForObjects(WorldContextObject, Start, End, Radius, ObjectTypes, bTraceComplex, ActorsToIgnore, DrawDebugType, OutHit, bIgnoreSelf, TraceColor, TraceHitColor, DrawTime) end

---Prints a stack trace to the log, so you can see how a blueprint got to this node
function UKismetSystemLibrary.StackTrace() end

---Notify the current transaction (if any) that this object is about to be modified and should be placed into the undo buffer.
---@param Object UObject
function UKismetSystemLibrary.TransactObject(Object) end

---Unloads a primary asset, which allows it to be garbage collected if nothing else is referencing it
---@param PrimaryAssetId FPrimaryAssetId
function UKismetSystemLibrary.UnloadPrimaryAsset(PrimaryAssetId) end

---Unloads a primary asset, which allows it to be garbage collected if nothing else is referencing it
---@param PrimaryAssetIdList TArray<FPrimaryAssetId>
function UKismetSystemLibrary.UnloadPrimaryAssetList(PrimaryAssetIdList) end

---Requests Requests unregistering from receiving remote notifications to the user's device.
---(Android only)
function UKismetSystemLibrary.UnregisterForRemoteNotifications() end

