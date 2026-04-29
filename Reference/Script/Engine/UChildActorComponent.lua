---A component that spawns an Actor when registered, and destroys it when unregistered.
---@class UChildActorComponent : USceneComponent
---@field private ChildActorClass TSubclassOf<AActor> @The class of Actor to spawn
---@field private ChildActor AActor @The actor that we spawned and own
---@field private ChildActorTemplate AActor @Property to point to the template child actor for details panel purposes
---@field private EditorTreeViewVisualizationMode EChildActorComponentTreeViewVisualizationMode @Indicates how this component will be visualized for editing in a tree view. Users can change this setting per instance via the context menu in the Blueprint/SCS editor.
---@field private bChildActorIsTransient boolean @Should the spawned actor be marked as transient?
UChildActorComponent = {}

---@param Actor AActor
function UChildActorComponent:OnChildActorDestroyed(Actor) end

function UChildActorComponent:OnRep_ChildActor() end

---Sets the class to use for the child actor.
---If called on a template component (owned by a CDO), the properties of any existing child actor template will be copied as best possible to the template.
---If called on a component instance in a world (and the class is changing), the created ChildActor will use the class defaults as template.
---@param InClass TSubclassOf<AActor> @The Actor subclass to spawn as a child actor
function UChildActorComponent:SetChildActorClass(InClass) end

