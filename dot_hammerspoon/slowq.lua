--[[
    Source: https://github.com/dbmrq/Dotfiles/blob/master/Hammerspoon/.hammerspoon/slowq.lua

    Requires you to keep holding Command + Q for a while before closing an app,
    so you won't do it accidentally.

    Replaces apps like CommandQ and SlowQuitApps.
--]]

alertStyle = {
    strokeWidth  = 3,                                           -- border
    strokeColor = { red = 1, alpha = 1 },                       -- border color
    fillColor   = { white = 0, alpha = 1 },                     -- background color
    textColor = hs.drawing.color["white"],                      -- text color
    textSize  = 20,                                             -- text size
    radius = 10,                                                -- border radius
}


local delay = 6                                                 -- delay in seconds
local killedIt = false
local timer
local alert

function pressQ()
    killedIt = false
    timer = hs.timer.doEvery(0.5, tick)
    timer:fire()
end

function holdQ()
    if delay <= 0 and not killedIt then
        killedIt = true
        timer:stop()
        hs.alert.closeSpecific(alert)
        hs.application.frontmostApplication():kill()
    end
end

function releaseQ()
    killedIt = false
    timer:stop()
    delay = 6
    hs.alert.closeSpecific(alert)
end

function tick()
    hs.alert.closeSpecific(alert)
    alert = hs.alert("Quitting in " .. delay-1 .. " seconds", alertStyle, nil, 1)
    delay = delay - 1
end

hs.hotkey.bind('cmd', 'Q', pressQ, releaseQ, holdQ)
