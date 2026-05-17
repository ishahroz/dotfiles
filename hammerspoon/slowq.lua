local module = {}

local alertStyle = {
	strokeWidth = 3, -- border
	strokeColor = { red = 1, alpha = 1 }, -- border color
	fillColor = { white = 0, alpha = 1 }, -- background color
	textColor = hs.drawing.color["white"], -- text color
	textSize = 20, -- text size
	radius = 10, -- border radius
}

local delay
local initialDelay
local killedIt = false
local timer
local alert

local function tick()
	hs.alert.closeSpecific(alert)
	alert = hs.alert("Quitting in " .. delay - 1 .. " seconds", alertStyle, nil, 1)
	delay = delay - 1
end

local function pressQ()
	killedIt = false
	timer = hs.timer.doEvery(0.5, tick)
	timer:fire()
end

local function holdQ()
	if delay <= 0 and not killedIt then
		killedIt = true
		timer:stop()
		hs.alert.closeSpecific(alert)
		hs.application.frontmostApplication():kill()
	end
end

local function releaseQ()
	killedIt = false
	timer:stop()
	delay = initialDelay -- Reset to initial delay value
	hs.alert.closeSpecific(alert)
end

function module.setup(delaySeconds)
	initialDelay = delaySeconds or 6 -- Default to 6 if no value provided
	delay = initialDelay
	hs.hotkey.bind("cmd", "Q", pressQ, releaseQ, holdQ)
end

return module
