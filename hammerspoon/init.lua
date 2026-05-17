-- ################################################################
-- ####################### Setting up logging #######################
-- ################################################################

hs.logger.defaultLogLevel = "error"
hs.hotkey.setLogLevel(1) -- 1 = error, 0 = nothing

-- ################################################################
-- ####################### Loading Lua modules #######################
-- ################################################################

local _slowq = require("slowq")
local _aerospace = require("aerospace")
local _config = require("config")
-- local _chrome = require("chrome")

-- ################################################################
-- ####################### Loading Spoons #######################
-- ################################################################

hs.loadSpoon("Hyper")
-- hs.loadSpoon("RecursiveBinder")

-- ################################################################
-- ####################### Setting up SlowQ #######################
-- ################################################################

_slowq.setup(6)

-- ################################################################
-- ####################### Setting up Hyper #######################
-- ################################################################

Hyper = spoon.Hyper

Hyper:bindHotKeys({ hyperKey = { {}, "f19" } })

-- Application Bundle ID, Global Binding, Local Bindings (Bind Pass Through)
local _hyperBindings = {
	{ "com.raycast.macos", nil, { "space", "b", ",", "." } }, -- Raycast
	{ "com.mitchellh.ghostty", "t", nil }, -- Ghostty (Terminal)
	{ "com.google.Chrome", "g", nil }, -- Google Chrome
	{ "net.whatsapp.WhatsApp", "w", nil }, -- WhatsApp
	{ "com.apple.Notes", "[", nil }, -- Notes
	{ "com.apple.iCal", "]", nil }, -- Apple Calendar
	{ "org.mozilla.floorp", "/", nil }, -- Secondary Browser (Floorp)
	{ "com.microsoft.VSCode", "v", nil }, -- VS Code
	{ "com.tinyspeck.slackmacgap", "s", nil }, -- Slack
	{ "md.obsidian", "o", nil }, -- Obsidian
	-- { "notion.id", "n", nil }, -- Notion
	{ "com.culturedcode.ThingsMac", "\\", nil }, -- Things
	{ "com.apple.mail", "m", nil }, -- Apple Mail
	-- { "com.jetbrains.pycharm", "p", nil }, -- PyCharm
	-- { "com.jetbrains.intellij", "i", nil }, -- IntelliJ IDEA
	-- { "com.openai.codex", "c", nil }, -- Codex
	{ "com.hnc.Discord", "d", nil }, -- Discord
	{ "com.apple.finder", "f", nil }, -- Finder (Apple)
	{ "org.gnu.Emacs", "e", nil }, -- Emacs
}

hs.fnutils.each(_hyperBindings, function(bindingTable)
	local bundleID, globalBind, localBinds = table.unpack(bindingTable)
	if globalBind then
		Hyper:bind({}, globalBind, function()
			hs.application.launchOrFocusByBundleID(bundleID)
		end)
	end
	if localBinds then
		hs.fnutils.each(localBinds, function(key)
			Hyper:bindPassThrough(key, bundleID)
		end)
	end
end)

-- ################################################################
-- ################## Setting up Home Button ######################
-- ################################################################

hs.hotkey.bind({}, "home", function()
	hs.eventtap.keyStroke({ "cmd", "alt", "ctrl", "shift" }, "space", 0) -- Home Button will send all keystrokes (which we use for hyperkey) + space to trigger Raycast
end)

-- ################################################################
-- ################## Setting up End Button #@#####################
-- ################################################################

hs.hotkey.bind({}, "end", function()
	hs.eventtap.keyStroke({ "ctrl" }, "space", 0) -- End Button will send Keystrokes `ctrl` + `space` which will open Things 3 Dialog
end)

-- ################################################################
-- ############# Setting up Page Up + Page Down Buttons #@#########
-- ################################################################

hs.hotkey.bind({}, "pageup", function()
	hs.eventtap.keyStroke({ "cmd", "alt" }, "right", 0) -- Page Up will send Alt / Cmd + Ctrl (Option) + Right keystrokes
end)

hs.hotkey.bind({}, "pagedown", function()
	hs.eventtap.keyStroke({ "cmd", "alt" }, "left", 0) -- Page Down will send Alt / Cmd + Ctrl (Option) + Left keystrokes
end)

-- ################################################################
-- ####################### Setting up Chrome ######################
-- ################################################################

local chromePath = "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"

local function focusWindowWithTitle(substring)
	local chrome = hs.application.get("Google Chrome")
	if not chrome then
		return false
	end

	for _, win in ipairs(chrome:allWindows()) do
		local title = win:title() or ""
		if title:find(substring, 1, true) then
			win:focus()
			return true
		end
	end

	return false
end

-- local function bindChromeProfile(key, profileDir, titleSubstring)
-- 	Hyper:bind({}, key, function()
-- 		if not focusWindowWithTitle(titleSubstring) then
-- 			hs.task.new(chromePath, nil, { "--profile-directory=" .. profileDir }):start()
-- 		end
-- 	end)
-- end

-- Rather create a local only mapping for Chrome Profiles and read that instead of hardcoding
-- bindChromeProfile("1", "Default", "Google Chrome - Shahroz (Personal)") -- Default is Shahroz Personal (might have to update if fresh start of system)

-- local jumpOrOpen = function(url)
--     if _chrome.jump(url) then
--         return true
--     else
--         hs.urlevent.openURL("https://" .. url)
--     end
-- end

-- Hyper:bind({}, 'c', nil, function()
--     jumpOrOpen("chatgpt.com")
-- end)

-- ################################################################
-- ####################### Setting up AeroSpace #######################
-- ################################################################

Hyper:bind({}, "y", function()
	if _aerospace.enabled then
		_aerospace:exit()
	else
		_aerospace:enter()
	end
end)

-- ################################################################
-- ############## Setting up Hammerspoon Config ###################
-- ################################################################

Hyper:bind({}, "h", function()
	if _config.enabled then
		_config:exit()
	else
		_config:enter()
	end
end)

-- ################################################################
-- ############## Copying Screenshot to Clipboard #################
-- ################################################################

-- hs.hotkey.bind({"cmd", "shift"}, "4", function()
--   local fileName = os.getenv("HOME") .. "/Desktop/Screenshots/" .. os.date("%Y-%m-%d_%T") .. ".png"
--   hs.task.new("/usr/sbin/screencapture", nil, {"-i", fileName }):start():waitUntilExit()
--   image = hs.image.imageFromPath(fileName)
--   hs.pasteboard.writeObjects(image)
-- end)

-- ################################################################
-- ####################### Setting up RecursiveBinder #############
-- ################################################################

-- local singleKey = spoon.RecursiveBinder.singleKey

-- local keyMap = {
--     [singleKey('g', 'Google Chrome')] = function() hs.application.launchOrFocusByBundleID("com.google.Chrome") end,
--     [singleKey('t', 'iTerm')] = function() hs.application.launchOrFocusByBundleID("com.googlecode.iterm2") end,
--     --   [singleKey('\\', 'raycast')] = {
--     --     [singleKey('g', 'github')] = function() hs.urlevent.openURL("https://github.com") end,
--     --     [singleKey('y', 'youtube')] = function() hs.urlevent.openURL("https://youtube.com") end
--     --   }
-- }

-- hs.hotkey.bind({ 'f19' }, 'a', spoon.RecursiveBinder.recursiveBind(keyMap))
