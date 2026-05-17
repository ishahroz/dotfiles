#!/bin/zsh

# Setup script for macOS

############################ MACOS DEFAULTS ############################

############# Hammerspoon ##############    

# Changing default Hammerspoon config location
# Check this PR for more details: https://github.com/Hammerspoon/hammerspoon/issues/1734#issuecomment-379854489
defaults write org.hammerspoon.Hammerspoon MJConfigFile "$HOME/.config/hammerspoon/init.lua"


############# Key Repeat ##############

# The default key repeat rate is too slow when moving the cursor using keyboard.
# - `KeyRepeat` - default minimum is `2` (`30 ms`)
# - `InitialKeyRepeat` - default minimum is `15` (`225 ms`)
# Note: Check this website to play more with the values: https://mac-key-repeat.zaymon.dev.

# Increasing key repeat rate
defaults write -g KeyRepeat -int 1
defaults write -g InitialKeyRepeat -int 15


############# Sound ##############

# Disable sound on startup
# TODO: Enable the Sudo first
# sudo nvram StartupMute=%01


############# UI ##############

# Enable 'Group Windows by Application' option (it has to be if using Aerospace otherwise things dont work fine when you zoom out using 3 fingers up)
defaults write com.apple.dock expose-group-apps -bool true && killall Dock


# Set double-click on title bar to "fill"
defaults write -g AppleActionOnDoubleClick 'Fill' && killall Finder
