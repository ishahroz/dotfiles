# ==========================================
# Scoop Packages Setup
# ==========================================

Write-Host "Checking Scoop installation..." -ForegroundColor Cyan

if (-not (Get-Command scoop -ErrorAction SilentlyContinue)) {
    Write-Host ""
    Write-Host "ERROR: Scoop is not installed." -ForegroundColor Red
    exit 1
}

Write-Host "Scoop is installed." -ForegroundColor Green

Write-Host ""
Write-Host "Adding Scoop buckets..." -ForegroundColor Cyan

scoop bucket add extras

Write-Host ""
Write-Host "Installing packages..." -ForegroundColor Cyan

scoop install extras/emacs
scoop install extras/vscode
scoop install extras/notepadplusplus

Write-Host ""
Write-Host "Done installing Scoop packages." -ForegroundColor Green
