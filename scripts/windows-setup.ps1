# ==========================================
# Variables
# ==========================================

$HomePath = $HOME

$EmacsPath      = Join-Path $HomePath ".emacs.d"
$DoomConfigPath = Join-Path $HomePath ".doom.d"
$DoomSource     = Join-Path ".\doom" ".doom.d"
$DoomBin        = Join-Path $EmacsPath "bin"
$DoomCmd = Join-Path $DoomBin "doom.ps1"

$DoomRepoUrl = "https://github.com/doomemacs/doomemacs.git"

# ==========================================
# Preflight
# ==========================================

Write-Host "Checking HOME path..." -ForegroundColor Cyan

if (-not $HOME) {
    Write-Host ""
    Write-Host "ERROR: HOME environment variable is not set." -ForegroundColor Red
    exit 1
}

if (-not (Test-Path $HomePath)) {
    Write-Host ""
    Write-Host "ERROR: HOME path is invalid: $HomePath" -ForegroundColor Red
    exit 1
}

Write-Host "HOME path detected: $HomePath" -ForegroundColor Green
Write-Host ""

Write-Host "Checking Git installation..." -ForegroundColor Cyan

if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    Write-Host ""
    Write-Host "ERROR: Git is not installed or not available in PATH." -ForegroundColor Red
    exit 1
}

Write-Host "Git is installed." -ForegroundColor Green
Write-Host ""

Write-Host "Checking Scoop installation..." -ForegroundColor Cyan

if (-not (Get-Command scoop -ErrorAction SilentlyContinue)) {
    Write-Host ""
    Write-Host "ERROR: Scoop is not installed." -ForegroundColor Red
    exit 1
}

Write-Host "Scoop is installed." -ForegroundColor Green
Write-Host ""

# ==========================================
# Scoop Packages Setup
# ==========================================

Write-Host "Adding Scoop buckets..." -ForegroundColor Cyan

scoop bucket add main
scoop bucket add extras
scoop bucket add nerd-fonts

Write-Host ""
Write-Host "Installing packages..." -ForegroundColor Cyan

scoop install main/7zip
scoop install main/aws
scoop install main/azure-cli
scoop install main/docker
scoop install main/fzf
scoop install main/openssh
scoop install main/ripgrep

scoop install extras/bruno
scoop install extras/emacs
scoop install extras/vscode
scoop install extras/notepadplusplus

scoop install nerd-fonts/ZedMono-NF

Write-Host ""
Write-Host "Scoop packages installed." -ForegroundColor Green

# ==========================================
# Doom Emacs Setup
# ==========================================

Write-Host ""
Write-Host "Cloning Doom Emacs..." -ForegroundColor Cyan

if (-not (Test-Path $EmacsPath)) {
    git clone $DoomRepoUrl $EmacsPath
}
else {
    Write-Host ".emacs.d already exists. Skipping clone." -ForegroundColor Yellow
}

Write-Host ""
Write-Host "Running Doom install..." -ForegroundColor Cyan

& $DoomCmd install --no-env

Write-Host ""
Write-Host "Copying Doom Emacs config..." -ForegroundColor Cyan

if (-not (Test-Path $DoomSource)) {
    Write-Host ""
    Write-Host "ERROR: Doom config source folder not found: $DoomSource" -ForegroundColor Red
    exit 1
}

if (-not (Test-Path $DoomConfigPath)) {
    New-Item -ItemType Directory -Path $DoomConfigPath | Out-Null
}

Copy-Item (Join-Path $DoomSource "*") $DoomConfigPath -Recurse -Force

Write-Host "Doom Emacs config copied successfully." -ForegroundColor Green

Write-Host ""
Write-Host "Running Doom sync..." -ForegroundColor Cyan

& $DoomCmd sync

Write-Host ""
Write-Host "Adding Doom to User PATH..." -ForegroundColor Cyan

try {
    $UserPath = [Environment]::GetEnvironmentVariable(
        "Path",
        "User"
    )

    if ($UserPath -notlike "*$DoomBin*") {
        [Environment]::SetEnvironmentVariable(
            "Path",
            "$UserPath;$DoomBin",
            "User"
        )

        $env:Path += ";$DoomBin"

        Write-Host "Successfully added Doom to User PATH." `
            -ForegroundColor Green

        Write-Host "You can now use: doom sync" `
            -ForegroundColor Cyan
    }
    else {
        Write-Host "Doom already exists in User PATH." `
            -ForegroundColor Yellow
    }
}
catch {
    Write-Host "Failed to add Doom to User PATH." `
        -ForegroundColor Red

    Write-Host "This may be because the machine restricts environment variable changes without administrator privileges." `
        -ForegroundColor Yellow

    Write-Host ""
    Write-Host "You can still run Doom manually using:" `
        -ForegroundColor Cyan

    Write-Host "$DoomCmd sync"
}

Write-Host ""
Write-Host "Windows dev environment setup complete." -ForegroundColor Green
