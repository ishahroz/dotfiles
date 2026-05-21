# ==========================================
# Windows Dev Environment Setup
# ==========================================

Write-Host "Checking Scoop installation..." -ForegroundColor Cyan

if (-not (Get-Command scoop -ErrorAction SilentlyContinue)) {
    Write-Host ""
    Write-Host "ERROR: Scoop is not installed." -ForegroundColor Red
    exit 1
}

Write-Host "Scoop is installed." -ForegroundColor Green

# ==========================================
# Scoop Packages Setup
# ==========================================

Write-Host ""
Write-Host "Adding Scoop buckets..." -ForegroundColor Cyan

scoop bucket add main
scoop bucket add extras
scoop bucket add nerd-fonts

Write-Host ""
Write-Host "Installing packages..." -ForegroundColor Cyan

scoop install main/7zip                     # 7-Zip
scoop install main/aws                      # AWS CLI
scoop install main/azure-cli                # Azure CLI
scoop install main/docker                   # Docker
scoop install main/fzf                      # fzf (Fuzzy Finder)
scoop install main/openssh                  # OpenSSH
scoop install main/ripgrep                  # ripgrep

scoop install extras/bruno                  # Bruno
scoop install extras/emacs                  # Emacs
scoop install extras/vscode                 # VSCode
scoop install extras/notepadplusplus        # Notepad++

scoop install nerd-fonts/ZedMono-NF

Write-Host ""
Write-Host "Scoop packages installed." -ForegroundColor Green

# ==========================================
# Doom Emacs Config Setup
# ==========================================

Write-Host ""
Write-Host "Copying Doom Emacs config..." -ForegroundColor Cyan

$doomSource = ".\doom\.doom.d"
$doomTarget = "$HOME\.doom.d"

if (-not (Test-Path $doomSource)) {
    Write-Host "ERROR: Doom config source folder not found: $doomSource" -ForegroundColor Red
    exit 1
}

if (-not (Test-Path $doomTarget)) {
    New-Item -ItemType Directory -Path $doomTarget | Out-Null
}

Copy-Item "$doomSource\*" $doomTarget -Recurse -Force

Write-Host "Doom Emacs config copied successfully." -ForegroundColor Green

Write-Host ""
Write-Host "Windows dev environment setup complete." -ForegroundColor Green
