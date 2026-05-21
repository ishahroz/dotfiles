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

scoop bucket add extras
scoop bucket add nerd-fonts

Write-Host ""
Write-Host "Installing packages..." -ForegroundColor Cyan

scoop install extras/emacs
scoop install extras/vscode
scoop install extras/notepadplusplus
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
