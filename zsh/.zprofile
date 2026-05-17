# Remove duplicate PATH entries automatically
typeset -U path PATH

# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Add Obsidian to PATH
PATH="$PATH:/Applications/Obsidian.app/Contents/MacOS"

# Common Environment Variables
EDITOR="nvim"

PROJECTS="$HOME/Desktop"
AREAS="$HOME/Desktop/2. AREAS"
RESOURCES="$HOME/Desktop/3. RESOURCES"
ARCHIVES="$HOME/Desktop/4. ARCHIVES"

DOTFILES="$HOME/dotfiles"
