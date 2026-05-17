local aerospacePath = "/opt/homebrew/bin/aerospace"

-- To execute AeroSpace commands
local function aerospace(args)
	-- Can't use hs.task.new because AeroSpace commands does not return anything
	-- and the task gets blocked / waiting forever.
	-- We will be using hs.execute instead.
	-- There is a some expected delay in focusing AeroSpace window / workspaces.
	-- Check this PR: https://github.com/nikitabobko/AeroSpace/issues/131
	-- According to this PR https://github.com/Hammerspoon/hammerspoon/issues/2570, passing second argument as false is better.
	hs.execute(aerospacePath .. " " .. table.concat(args, " "), false)
end

-- Creating AeroSpace modal
local Aerospace = hs.hotkey.modal.new({}, nil)

-- AeroSpace modal entered
function Aerospace:entered()
	Aerospace.enabled = true
	local f = hs.screen.mainScreen():fullFrame()
	local canvasFrame = {
		x = f._x,
		y = f._y,
		w = f._w,
		h = f._h,
	}
	Aerospace.indicator = hs.canvas
		.new(canvasFrame)
		:appendElements({
			type = "rectangle",
			action = "stroke",
			strokeWidth = 3.0,
			strokeColor = { hex = "#F74F9E", alpha = 1.0 },
			roundedRectRadii = { xRadius = 10.0, yRadius = 10.0 },
			frame = canvasFrame,
		})
		:show()
end

-- AeroSpace modal exited
function Aerospace:exited()
	Aerospace.enabled = false
	Aerospace.indicator:delete()
end

-- AeroSpace modal key bindings
Aerospace:bind({ "control" }, "c", function() -- Exit AeroSpace
	Aerospace:exit()
end)
	:bind({}, "escape", function() -- Exit AeroSpace
		Aerospace:exit()
	end)
	:bind({}, "r", function() -- Reload Hammerspoon config
		aerospace({ "reload-config" })
		Aerospace:exit()
	end)
	:bind({}, "/", function() -- Layout: Tiles (horizontal, vertical)
		aerospace({ "layout", "tiles", "horizontal", "vertical" })
	end)
	:bind({}, ",", function() -- Layout: Accordion (horizontal, vertical)
		aerospace({ "layout", "accordion", "horizontal", "vertical" })
	end)
	:bind({}, "h", function() -- Focus: Left
		aerospace({ "focus", "left" })
	end)
	:bind({}, "j", function() -- Focus: Down
		aerospace({ "focus", "down" })
	end)
	:bind({}, "k", function() -- Focus: Up
		aerospace({ "focus", "up" })
	end)
	:bind({}, "l", function() -- Focus: Right
		aerospace({ "focus", "right" })
	end)
	:bind({ "shift" }, "h", function() -- Move: Left
		aerospace({ "move", "left" })
	end)
	:bind({ "shift" }, "j", function() -- Move: Down
		aerospace({ "move", "down" })
	end)
	:bind({ "shift" }, "k", function() -- Move: Up
		aerospace({ "move", "up" })
	end)
	:bind({ "shift" }, "l", function() -- Move: Right
		aerospace({ "move", "right" })
	end)
	:bind({}, "[", function() -- Resize: Smart (decrease)
		aerospace({ "resize", "smart", "-50" })
	end)
	:bind({}, "]", function() -- Resize: Smart (increase)
		aerospace({ "resize", "smart", "+50" })
	end)
	:bind({}, "1", function() -- Workspace: 1
		aerospace({ "workspace", "1" })
	end)
	:bind({}, "2", function() -- Workspace: 2
		aerospace({ "workspace", "2" })
	end)
	:bind({}, "3", function() -- Workspace: 3
		aerospace({ "workspace", "3" })
	end)
	:bind({}, "4", function() -- Workspace: 4
		aerospace({ "workspace", "4" })
	end)
	:bind({}, "9", function() -- Workspace: 9-Calendar
		aerospace({ "workspace", "9-Calendar" })
	end)
	:bind({}, "0", function() -- Workspace: 0-Other
		aerospace({ "workspace", "0-Other" })
	end)
	:bind({}, "b", function() -- Workspace: Browser
		aerospace({ "workspace", "Browser" })
	end)
	:bind({}, "c", function() -- Workspace: Communication
		aerospace({ "workspace", "Communication" })
	end)
	:bind({}, "e", function() -- Workspace: Editor
		aerospace({ "workspace", "Editor" })
	end)
	:bind({}, "i", function() -- Workspace: IntelliJ IDEA
		aerospace({ "workspace", "IntelliJ" })
	end)
	:bind({}, "n", function() -- Workspace: Notes
		aerospace({ "workspace", "Notes" })
	end)
	:bind({}, "p", function() -- Workspace: PyCharm
		aerospace({ "workspace", "PyCharm" })
	end)
	:bind({}, "t", function() -- Workspace: Terminal
		aerospace({ "workspace", "Terminal" })
	end)
	:bind({ "shift" }, "1", function() -- Move: Node to Workspace: 1
		aerospace({ "move-node-to-workspace", "1" })
	end)
	:bind({ "shift" }, "2", function() -- Move: Node to Workspace: 2
		aerospace({ "move-node-to-workspace", "2" })
	end)
	:bind({ "shift" }, "3", function() -- Move: Node to Workspace: 3
		aerospace({ "move-node-to-workspace", "3" })
	end)
	:bind({ "shift" }, "4", function() -- Move: Node to Workspace: 4
		aerospace({ "move-node-to-workspace", "4" })
	end)
	:bind({ "shift" }, "9", function() -- Move: Node to Workspace: 9-Planner
		aerospace({ "move-node-to-workspace", "9-Planner" })
	end)
	:bind({ "shift" }, "0", function() -- Move: Node to Workspace: 0-Other
		aerospace({ "move-node-to-workspace", "0-Other" })
	end)
	:bind({ "shift" }, "b", function() -- Move: Node to Workspace: Browser
		aerospace({ "move-node-to-workspace", "Browser" })
	end)
	:bind({ "shift" }, "c", function() -- Move: Node to Workspace: Communication
		aerospace({ "move-node-to-workspace", "Communication" })
	end)
	:bind({ "shift" }, "e", function() -- Move: Node to Workspace: Editor
		aerospace({ "move-node-to-workspace", "Editor" })
	end)
	:bind({ "shift" }, "i", function() -- Move: Node to Workspace: IntelliJ IDEA
		aerospace({ "move-node-to-workspace", "IntelliJ" })
	end)
	:bind({ "shift" }, "m", function() -- Move: Node to Workspace: Mail
		aerospace({ "move-node-to-workspace", "Mail" })
	end)
	:bind({ "shift" }, "n", function() -- Move: Node to Workspace: Notes
		aerospace({ "move-node-to-workspace", "Notes" })
	end)
	:bind({ "shift" }, "p", function() -- Move: Node to Workspace: PyCharm
		aerospace({ "move-node-to-workspace", "PyCharm" })
	end)
	:bind({ "shift" }, "t", function() -- Move: Node to Workspace: Terminal
		aerospace({ "move-node-to-workspace", "Terminal" })
	end)

return Aerospace
