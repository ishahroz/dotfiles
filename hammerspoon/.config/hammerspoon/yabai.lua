-- This file is just for the records and not being used by Hammerspoon.
-- Stopped using `yabai`. Kindly refer to `aerospace.lua` for the Aerospace commands and mappings.

local yabaiPath = "/opt/homebrew/bin/yabai"

-- To run Yabai as background task
local function yabai(args, completion)
	local yabai_output = ""
	local yabai_error = ""
	local yabai_task = hs.task.new(yabaiPath, function(err, stdout, stderr) end, function(task, stdout, stderr)
		if stdout ~= nil then
			yabai_output = yabai_output .. stdout
		end
		if stderr ~= nil then
			yabai_error = yabai_error .. stderr
		end
		return true
	end, args)
	if type(completion) == "function" then
		yabai_task:setCallback(function()
			completion(yabai_output, yabai_error)
		end)
	end
	yabai_task:start()
end

-- Window bindings via yabai above
local Yabai = hs.hotkey.modal.new({}, nil)

function Yabai:entered()
	Yabai.enabled = true
	-- Get the full frame (including the Menu Bar + Dock) of the main screen (currently focused)
	-- Read more here: https://www.hammerspoon.org/docs/hs.screen.html#mainScreen
	-- and here: https://www.hammerspoon.org/docs/hs.screen.html#fullFrame
	local f = hs.screen.mainScreen():fullFrame()
	local canvasFrame = {
		x = f._x,
		y = f._y,
		w = f._w,
		h = f._h,
	}
	Yabai.indicator = hs.canvas
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

function Yabai:exited()
	Yabai.enabled = false
	Yabai.indicator:delete()
end

Yabai:bind({ "control" }, "c", function()
	Yabai:exit()
end)
	:bind({}, "escape", function()
		Yabai:exit()
	end)
	:bind({}, "h", function()
		yabai({ "-m", "window", "--focus", "west" })
	end)
	:bind({}, "j", function()
		yabai({ "-m", "window", "--focus", "south" })
	end)
	:bind({}, "k", function()
		yabai({ "-m", "window", "--focus", "north" })
	end)
	:bind({}, "l", function()
		yabai({ "-m", "window", "--focus", "east" })
	end)
	:bind({ "shift" }, "h", function()
		yabai({ "-m", "window", "--swap", "west" })
	end)
	:bind({ "shift" }, "j", function()
		yabai({ "-m", "window", "--swap", "south" })
	end)
	:bind({ "shift" }, "k", function()
		yabai({ "-m", "window", "--swap", "north" })
	end)
	:bind({ "shift" }, "l", function()
		yabai({ "-m", "window", "--swap", "east" })
	end)
	:bind({ "control" }, "h", function()
		yabai({ "-m", "window", "--warp", "west" })
	end)
	:bind({ "control" }, "j", function()
		yabai({ "-m", "window", "--warp", "south" })
	end)
	:bind({ "control" }, "k", function()
		yabai({ "-m", "window", "--warp", "north" })
	end)
	:bind({ "control" }, "l", function()
		yabai({ "-m", "window", "--warp", "east" })
	end)
	:bind({}, "x", function()
		yabai({ "-m", "window", "--toggle", "split" })
	end)
	:bind({}, "z", function()
		yabai({ "-m", "window", "--toggle", "zoom-parent" })
	end)
	:bind({}, "f", function()
		yabai({ "-m", "window", "--toggle", "float" })
	end)
	:bind({}, "u", function()
		yabai({ "-m", "window", "--ratio", "abs:0.3" })
	end)
	:bind({}, "i", function()
		yabai({ "-m", "window", "--ratio", "abs:0.5" })
	end)
	:bind({}, "o", function()
		yabai({ "-m", "window", "--ratio", "abs:0.7" })
	end)
	:bind({}, "p", function()
		yabai({ "-m", "window", "--ratio", "abs:0.8" })
	end)
	:bind({}, "space", function()
		if Hyper.layout and Hyper.layout == "bsp" then
			Hyper.layout = "stack"
			yabai({ "-m", "space", "--layout", "stack" })
		else
			Hyper.layout = "bsp"
			yabai({ "-m", "space", "--layout", "bsp" })
		end
	end)
	:bind({}, "m", function()
		yabai({ "-m", "window", "--toggle", "zoom-fullscreen" })
	end)
	:bind({}, "tab", function()
		yabai({ "-m", "window", "--display", "recent", "--focus" })
	end)

return Yabai
