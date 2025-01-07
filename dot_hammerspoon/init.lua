require "slowq"  -- Slow quit apps

local hyper = {"cmd", "alt", "ctrl", "shift"}

hs.loadSpoon("RecursiveBinder")

local singleKey = spoon.RecursiveBinder.singleKey

local keyMap = {
--   [singleKey('b', 'browser')] = function() hs.application.launchOrFocus("Firefox") end,
--   [singleKey('t', 'terminal')] = function() hs.application.launchOrFocus("Terminal") end,
  [singleKey('\\', 'raycast')] = {
    [singleKey('g', 'github')] = function() hs.urlevent.openURL("https://github.com") end,
    [singleKey('y', 'youtube')] = function() hs.urlevent.openURL("https://youtube.com") end
  }
}

hs.hotkey.bind(hyper, 'r', spoon.RecursiveBinder.recursiveBind(keyMap))

-- -- Define the Hyper key as 'Capslock' (the Hyper key I set in Karabiner Elements)
-- local hyper = {"cmd", "alt", "ctrl", "shift"}

-- -- Define the key mappings
-- keyMappings = {
--     A = "Activity Monitor",
--     B = "Dbeaver",
--     C = "Cursor",
--     D = "Docker",
--     E = "",
--     F = "Finder",
--     G = "Google Chrome",
--     H = "Hammerspoon",
--     I = "IntelliJ IDEA",
--     J = "",
--     K = "",
--     L = "",
--     M = "Spotify",
--     N = "Notion Calendar",
--     O = "",
--     P = "PyCharm",
--     Q = "", -- Quit the current application (see below)
--     R = "", -- Reload Hammerspoon (see below)
--     S = "Slack",
--     T = "iTerm",
--     U = "",
--     V = "Visual Studio Code",
--     W = "WhatsApp",
--     X = "",
--     Y = "",
--     Z = "",
--     ["\\"] = "Google Chat",
-- }

-- -- Bind the Hyper key to the keyMappings
-- for key, app in pairs(keyMappings) do
--     if app ~= "" then
--         hs.hotkey.bind(hyper, key, function()
--             hs.application.launchOrFocus(app)
--         end)
--     end
-- end

-- -- To reload Hammerspoon configuration
-- hs.hotkey.bind(hyper, "R", function()
--     hs.reload()
-- end)
