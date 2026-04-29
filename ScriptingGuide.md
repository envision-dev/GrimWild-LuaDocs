# Lua Scripting Guide

This document describes how to author Lua scripts for the game. It applies to both development scripts and mod scripts; the rules are the same. The tone and conventions assume you have already read the IntelliSense stubs in the `/Reference/` folder and understand which C++ classes and methods are available.

---

## 1. Script Categories

A script's category is determined entirely by what it returns.

### Fire-and-Forget (FAF)

A script that does not return a table is treated as one-shot logic. It runs, completes, and is discarded. FAF scripts have no lifecycle, no persistent state managed by the framework, and cannot be retrieved later.

Use FAF for:
- One-time commands ("teleport the player", "give item", "trigger an event").
- Setup or migration steps that run once.
- Quick experiments during development.

FAF scripts are invoked through `ULuaLibrary.RunScript("owner.path")`. They cannot be loaded with `require`.

### Persistent (Module)

A script that returns a table is treated as a long-lived module. The framework keeps it loaded, runs its lifecycle hooks, and exposes its returned table to other scripts via `require`.

Use Persistent for:
- Listeners that react to game events over time.
- Components that need to react each frame.
- Libraries shared between other scripts.
- Anything with setup/teardown semantics.

Persistent scripts can be loaded with either `require("owner.path")` or `ULuaLibrary.RunScript("owner.path")`. The two have different return values (see Section 6).

The script's category is decided by the body's return at load time. A persistent script that fails to return a table silently becomes FAF; this is a common authoring mistake.

---

## 2. Module Template

A persistent module follows this exact skeleton. Keep the variable named `This`.

```lua
local This = {}

---Set to 'true' to enable OnTick() execution from the start of the script's lifecycle.
---Tick state can also be toggled at any time by calling SetTickEnabled().
This.StartWithTickEnabled = false

---Executes once after the script loads.
function This:OnConstruct()
end

---Executes every game frame while ticking is enabled.
---@param DeltaTime number Time elapsed since the previous frame, in seconds.
function This:OnTick(DeltaTime)
end

---Executes before the script unloads.
function This:OnDestruct()
end

return This
```

Lifecycle hooks (`OnConstruct`, `OnTick`, `OnDestruct`) are always defined with `:` so they receive `self` (the module table). This is the opposite of delegate callbacks; see Section 8.

---

## 3. Lifecycle Hooks

| Hook | When it runs | Purpose |
|---|---|---|
| `OnConstruct` | Once, after the body executes successfully | Register listeners, initialize state |
| `OnTick(DeltaTime)` | Every frame, while ticking is enabled | Per-frame logic |
| `OnDestruct` | Before unload, including failure rollback | Release resources, unbind listeners |

If `OnConstruct` raises an error, the framework rolls the load back: `OnDestruct` is invoked, then the module is fully unloaded. Write `OnDestruct` defensively so it can run after a partial `OnConstruct` (check for nil, guard against duplicate cleanup).

Errors thrown inside `OnTick` are logged but do not unload the module. The next frame is unaffected. Tick handlers should still avoid raising errors; transient failures should be handled internally.

### Tick Control

Ticking is opt-in. A module that does not need per-frame work should leave `StartWithTickEnabled = false` and not call `SetTickEnabled`. Ticking is expensive when applied to many modules.

`SetTickEnabled(bEnabled)` is available inside the script body and inside lifecycle hooks. Call `SetTickEnabled(true)` to begin ticking, `SetTickEnabled(false)` to pause. The change takes effect on the next frame.

---

## 4. Variable Scope

Three scopes are in play. Choose deliberately.

### `local x = ...` — Script-private

The default. Use this for any value that does not need to be visible outside the current script. Local variables disappear when the script unloads. They never leak into other scripts.

### `This.x = ...` — Module field

Lives on the module table. Accessible inside lifecycle hooks via `self.x`. Visible to anything that imports the module via `require`. This is the right place for state that needs to survive between hook invocations.

### `x = ...` (no `local`) — Owner-shared

A non-local assignment writes into a shared environment that all scripts of the same owner can read. This is intended only for explicit cross-script sharing.

Owners isolate scripts:
- **Dev scripts** all share the `dev` owner. A non-local variable in one dev script is visible to every other dev script.
- **Mod scripts** share an owner per mod. All scripts within `mod_X` see each other's non-locals; scripts in `mod_Y` do not.
- **Mods are isolated from each other and from dev.**

Treat non-local assignments as a deliberate communication channel. Forgetting `local` and accidentally writing to the shared environment is a silent source of bugs that become visible only when a second script of the same owner loads. The framework logs a warning the first time a new shared name is written, which serves as a check that the assignment was intentional.

**Convention: prefer `local`. Use shared globals only when the design explicitly requires cross-script visibility.**

---

## 5. Require Paths

Every script is identified by a require path of the form:

```
owner.path.segment.scriptname
```

- The path is case-insensitive and normalized to lowercase.
- The first segment names the owner. For dev scripts, this is `dev`. For mod scripts, this is the mod's declared owner name (for example `mod_mymod`).
- Subsequent segments map to subdirectories under the owner's script root, separated by dots.

Example: `mod_mymod.systems.combat.dodge` resolves to `<mod_mymod root>/systems/combat/dodge.lua`.

---

## 6. Loading, Unloading, and Restarting

### `require("path")`

Loads a persistent module and returns its table. Subsequent calls return the same cached table without re-running the body. This is the standard way for one Lua script to use the API of another Lua script.

`require` does not work on FAF scripts. Attempting to `require` a script that does not return a table produces a warning, returns `nil`, and clears the cache so the path remains in a clean state.

### `ULuaLibrary.RunScript("path")`

Runs a script's body. The behavior depends on the script's shape:

- **FAF**: executes the body and returns. Each call re-executes.
- **Persistent**: registers the module, runs `OnConstruct`, and starts ticking if requested. Subsequent calls on an already-loaded persistent module are no-ops.

`RunScript` returns a boolean indicating success. It does not return the module table; use `require` for that.

Use `RunScript` when you need to invoke a side-effect script (FAF), or when you want to ensure a persistent module is loaded without needing its return table.

### `ULuaLibrary.UnloadScript("path")`

Unloads a persistent module. `OnDestruct` runs, then the module is removed. Has no effect on FAF scripts (they were never registered).

### `ULuaLibrary.RestartScript("path")`

Unloads then reloads a persistent module. Useful during development for hot-reload-like workflows. Only works on currently-loaded persistent scripts; calling it on anything else logs an error.

### Self-unload

A persistent script can unload itself by calling `Unload()` from within its own code (inside `OnDestruct` is unnecessary; use it from `OnConstruct` or hooks if the script decides it is no longer needed).

### Automatic unload

When a mod is unloaded (for example when the player removes it in the main menu), all scripts of that mod's owner are unloaded in reverse load order. Each script's `OnDestruct` runs. Scripts do not need to handle owner-shutdown explicitly; the framework handles it.

---

## 7. Calling C++ Functions

Every C++ class and function exposed to Lua appears in the `/Reference/` folder as a generated `.lua` file with `---@class` and `---@field` declarations and function stubs. Use these as the authoritative source of available APIs.

A few conventions that are not always obvious from the stubs:

- **World access.** The game has separate maps for the main menu and gameplay. A `World` reference obtained at script load time becomes invalid after a map transition. Always retrieve the world fresh when needed; do not cache it across frames or hooks.
- **Object lifetime.** UObjects passed to Lua are weak by default in many cases. A reference held in a local variable may become invalid if the underlying object is destroyed by gameplay. Re-fetch from the source rather than caching long-lived references.
- **Method dispatch.** C++ methods on UObjects are called with `:` (e.g., `GetPlayerController():GetPawn()`). Static functions and Blueprint library functions are called with `.` (e.g., `ULuaLibrary.RunScript(...)`).

If a function is not in `/Reference/`, it is not available from Lua.

---

## 8. Delegates

UE delegates come in two shapes:

| Kind | Methods | Behavior |
|---|---|---|
| Delegate | `Bind(fn)`, `Unbind()`, `IsBound()`, `Execute(args...)` | One bound callback at a time. Re-binding replaces the previous callback. |
| MulticastDelegate | `Add(fn)`, `Remove(fn)`, `RemoveAll()`, `Broadcast(args...)` | Many callbacks. `Add` returns a handle with a `:Remove()` method for targeted removal. |

### The Colon-vs-Dot Rule

**Delegate callbacks must be defined with `.`, not `:`.**

Lifecycle hooks (`OnConstruct`, `OnTick`, `OnDestruct`) are framework methods called with self, defined with `:`. Delegate callbacks are free functions called by the engine, defined with `.`.

```lua
-- correct
function This.OnHealthChanged(newHealth)
    -- newHealth receives the engine's value
end
SomeDelegate:Bind(This.OnHealthChanged)

-- WRONG: silent argument corruption
function This:OnHealthChanged(newHealth)
    -- newHealth is not what you expect; the implicit 'self'
    -- has consumed the first delegate argument
end
SomeDelegate:Bind(This.OnHealthChanged)
```

Defining a delegate callback with `:` produces a warning at `Bind`/`Add` time and the callback receives wrong arguments at runtime. Always use `.` for delegate callbacks.

### Module State Inside a Delegate Callback

Because delegate callbacks are not methods, they have no automatic access to `This`. If a callback needs the module's state, capture it via the upvalue closure or reference `This` directly:

```lua
function This.OnHealthChanged(newHealth)
    This.LastHealth = newHealth
end
```

This works because `This` is a local variable in the script's scope, and the function captures it as an upvalue.

### Passing a Function as a Delegate Parameter

Some C++ functions take a delegate as an argument (commonly used for "subscribe with a callback" patterns). Pass a Lua function directly:

```lua
GetPlayerController():SubscribeToSomething(This.MyCallback)
```

The same colon-vs-dot rule applies: `MyCallback` must be defined with `.`.

### Cleanup

Delegate bindings registered during `OnConstruct` are automatically cleaned up when the module unloads. Manual cleanup in `OnDestruct` is good practice but not strictly required for delegates registered through the standard methods. Other resources (timers, spawned actors, references held in module fields) do still need explicit cleanup.

---

## 9. Common Pitfalls

- **Forgetting `return This`.** Without it, the script becomes FAF. Lifecycle hooks never run, `require` returns `nil` with a warning, and the symptom is "my OnConstruct is never called".
- **Caching `World` or other transient references.** The reference goes stale across map transitions. Re-fetch on demand.
- **Defining delegate callbacks with `:`.** Silent argument corruption. See Section 8.
- **Using `require` on a FAF script.** Returns `nil`. Use `RunScript` for FAF.
- **Accidental globals.** Forgetting `local` writes into the owner-shared environment. The first occurrence is logged, but the leak persists. See Section 4.
- **Heavy `OnTick`.** Tick runs every frame for every module that has ticking enabled. Disable ticking when not needed (`SetTickEnabled(false)`), or move expensive work to event-driven delegate callbacks.
- **Errors in `OnConstruct`.** The module is rolled back fully (including `OnDestruct`). Make `OnDestruct` defensive: check for `nil` before unwinding state that `OnConstruct` may not have reached.
- **Self-recursion via `RunScript`.** A script calling `RunScript` on itself before its previous invocation finishes is rejected with a warning. Use `RestartScript` if a clean reload is what you want.

---

## 10. Error Messages

Selected messages and their meanings:

| Message | Cause | Resolution |
|---|---|---|
| `delegate:Bind callback uses ':' syntax` | Callback was defined with `:` (implicit `self`). | Change `function T:Cb(...)` to `function T.Cb(...)`. |
| `delegate:Add callback uses ':' syntax` | Same as above, multicast variant. | Same fix. |
| `FAF-shaped script cannot be require'd` | `require` was called on a script that does not return a table. | Use `ULuaLibrary.RunScript("path")` instead, or add `return This` to the target script. |
| `delegate signature unavailable` | The delegate object is not registered with the framework or its source has been destroyed. | Verify the delegate's owning object is alive. Re-fetch the delegate if necessary. |
| `RunScript called recursively` | A script invoked `RunScript` on itself before its previous invocation finished. | Restructure so the call happens after the original invocation returns, or use `RestartScript`. |
| `RestartScript: not a registered persistent script` | `RestartScript` was called on a path that is not currently a loaded persistent module. | Check the path. For FAF scripts, re-invoke via `RunScript`. |
| `Unload() called outside of a registered script context` | `Unload()` was called from a FAF script or from outside any persistent script. | Only call `Unload()` from inside a persistent module. |