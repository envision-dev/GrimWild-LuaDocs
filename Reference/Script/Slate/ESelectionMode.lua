---@class ESelectionMode
---@field public None ESelectionMode [0] Nothing can be selected and there is no hover cue for selection.  You can still handle mouse button events though.
---@field public Single ESelectionMode [1] A single item can be selected at once, or no item may be selected.
---@field public SingleToggle ESelectionMode [2] A single item can be selected at once, or no item may be selected.  You can click the item to toggle selection on and off.
---@field public Multi ESelectionMode [3] Multiple items can be selected at the same time.
ESelectionMode = {}
