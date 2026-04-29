---Set behavior when user focus changes inside this scroll box
---@class EScrollWhenFocusChanges
---@field public NoScroll EScrollWhenFocusChanges [0] Don't automatically scroll, navigation or child widget will handle this
---@field public InstantScroll EScrollWhenFocusChanges [1] Instantly scroll using NavigationDestination rule
---@field public AnimatedScroll EScrollWhenFocusChanges [2] Use animation to scroll using NavigationDestination rule
EScrollWhenFocusChanges = {}
