local modal = hs.hotkey.modal.new({}, nil)

-- ## Called when the modal:enter() is called
function modal:entered()
	modal.enabled = true -- Flag to indicate the modal is enabled

	-- ## Create a canvas to indicate the modal is enabled (full screen rectangle (including menu bar and dock))
	local f = hs.screen.mainScreen():fullFrame()
	local canvasFrame = {
		x = f._x,
		y = f._y,
		w = f._w,
		h = f._h,
	}
	modal.indicator = hs.canvas
		.new(canvasFrame)
		:appendElements({
			type = "rectangle",
			action = "stroke",
			strokeWidth = 3.0,
			strokeColor = { hex = "#ffff00", alpha = 1.0 },
			roundedRectRadii = { xRadius = 10.0, yRadius = 10.0 },
			frame = canvasFrame,
		})
		:show()
end

-- ## Called when the modal:exit() is called
function modal:exited()
	modal.enabled = false
	modal.indicator:delete()
end

-- ## Bindings
modal
	:bind({ "control" }, "c", function() -- Exit the modal when control + c is pressed
		modal:exit()
	end)
	:bind({}, "escape", function() -- Exit the modal when escape is pressed
		modal:exit()
	end)
	:bind({}, "r", function() -- Reload the config when r is pressed
		hs.reload()
	end)
	:bind({ "shift" }, "r", function() -- Open Hammerspoon when shift + r is pressed
		hs.application.launchOrFocusByBundleID("org.hammerspoon.Hammerspoon")
		modal:exit()
	end)

return modal
