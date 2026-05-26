packages := "aerospace ccstatusline claude doom espanso ghostty git hammerspoon karabiner nvim opencode sesh tmux yazi zsh"
stow_ignore := "--ignore='\\.DS_Store'"

[private]
default:
    @just --list

# Ensure Homebrew is available.
[private]
_brew-check:
    @command -v brew >/dev/null || { echo "Homebrew is not installed or not on PATH."; exit 1; }

# Ensure GNU Stow is available.
[private]
_stow-check:
    @command -v stow >/dev/null || { echo "GNU Stow is not installed or not on PATH."; exit 1; }

# Update and upgrade Homebrew.
[group('brew')]
brew-update: _brew-check
    @echo "Updating Brew"
    @brew update
    @echo "Upgrading Brew"
    @brew upgrade

# Sync Brewfile.
[group('brew')]
brew: brew-update
    @echo "Syncing Brewfile..."
    @rm -f ./Brewfile
    @echo "Removed existing Brewfile."
    @brew bundle dump --file=./Brewfile --force
    @echo "Generated new Brewfile."

# Install packages from Brewfile.
[group('brew')]
brew-install: _brew-check
    @brew bundle install --file=./Brewfile

# Preview stow links.
[group('stow')]
stow: _stow-check
    stow -nv {{stow_ignore}} {{packages}}

# Apply stow links.
[group('stow')]
stow-apply: _stow-check
    stow {{stow_ignore}} {{packages}}
