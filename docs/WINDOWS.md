# Dotfiles Guide for Windows + WSL

I am using:
  - `Scoop` for managing packages and `Powershell` as the shell for **Windows side of things**
  - `Nix` for managing packages / system enivornments and `Bash` as the shell for **WSL 2 (Linux) side of things**

> The following guide was tested on `Windows 11 Pro (64 Bit)` and `Ubuntu-24.04` as the WSL 2 distro. The user name was set as `ishahroz` for both Windows and WSL 2.

```powershell
$env:PROCESSOR_ARCHITECTURE

# ARM64
```

```powershell
winver

# Windows 11 Pro
# Version 24H2
# OS Build 26100.4349
# Architecture: ARM64
# System Type: ARM64-based PC
```

```bash
uname -m

# aarch64
```

## Windows Setup

### User Accounts

This guide and repo assume `ishahroz` as the account username for both Windows and WSL 2:

| Environment | Username | Home directory |
| --- | --- | --- |
| Windows | `ishahroz` | `C:\Users\ishahroz` |
| WSL Ubuntu | `ishahroz` | `/home/ishahroz` |


> If the user name is different, make sure to update in the relevant files.

### WSL 2 and Ubuntu

1. Open `PowerShell` in **administrator** mode by right-clicking and selecting `Run as administrator`.

2. Run the following command to install WSL without installing a distribution:
   ```powershell
   wsl --install --no-distribution
   ```

3. Restart the system.

4. Install `Ubuntu-24.04` as the Linux distribution:

   ```powershell
   wsl --install -d Ubuntu-24.04
   ```

5. When Ubuntu starts for the first time, create the Linux user as `ishahroz`.

### Scoop

[`Scoop`](https://scoop.sh/) is a command-line installer for Windows.

1. Open `PowerShell` and run the following command:
   ```powershell
   Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
   ```

2. Run the following command to invoke the Scoop installer:
   ```powershell
   irm get.scoop.sh | iex
   ```
   If you get an error like this, `Running the installer as administrator is disabled by default...`, run the following command instead:

   ```powershell
   iex "& {$(irm get.scoop.sh)} -RunAsAdmin"
   ```

3. Verify the installation by running: `scoop --version`.

### Git using Scoop

1. Open `PowerShell` and run the following command:
   ```powershell
   scoop bucket add main
   scoop install main/git

   scoop bucket add nerd-fonts
   scoop install nerd-fonts/ZedMono-NF
   ```

2. Verify the installation by running: `git --version`.

### Terminal

1. Make sure [`Windows Terminal`](https://github.com/microsoft/terminal) is installed on your Windows OS.

2. Open Windows Terminal settings and set the following values:
   - On the `Startup` page, set:
     - Default Profile -> `Ubuntu-24.04`
     - Default Terminal application -> `Windows Terminal`
     - Launch parameters -> `Launch mode = Maximized`
     - Click on "Save".

3. Click on "Open JSON File" in the bottom left corner:
   - Copy [`gruvbox_dark.json`](../ms-terminal/gruvbox_dark.json) and paste in the `schemes` array.
   - Click on "Save".
   - Go to your profile settings (e.g: `Ubuntu-24.04`) and set color scheme to "Gruvbox Dark" on the `Appearnace` page.
   - Set cursor shape to "Bar".
   - Set font size to "18".
   - Set font face to "ZedMono Nerd Font" (after clicking on "Show all fonts").
   - Set window padding to "0".
4. Click on "Save" and restart the Terminal.

### Dotfiles and One-Time Setup Script

1. Open `Powershell` and clone this `dotfiles` repository in the user directory (`$HOME`):
   ```powershell
   $env:USERNAME
   $HOME

   # Expected:
   # ishahroz
   # C:\Users\ishahroz

   git clone https://github.com/ishahroz/dotfiles.git

   cd dotfiles
   ```

2. **‼️ CRITICAL: Make sure you understand the [`windows-setup.ps1`](../scripts/windows-setup.ps1) script before running it** (*it mostly installs packages and sets up Doom Emacs*). Run the script using the following command:
   ```powershell
   .\scripts\windows-setup.ps1
   ```

> Note: If the setup script fails for some reason, it is better to run the steps that failed, manually.

3. Restart the system.

### Emacs

1. Follow step 5 and 6 in [Setup](../doom/README.md#Setup) section.
2. Follow [Troubleshooting](../doom/README.md#Troubleshooting) section for common issues like font not found, etc.

## WSL Setup

### Clone Dotfiles

1. Open `Terminal` and clone this `dotfiles` repository in the home directory (`$HOME`):
   ```bash
   git clone https://github.com/ishahroz/dotfiles.git
   ```

### Install Nix and Enable Flakes

**Steps 1-2 are only applicable for WSL 2 because Systemd support is only available in WSL 2. Skip to Step 3 for WSL 1.**

1. In Powershell, ensure you are running WSL version `0.67.6` or higher. Confirm it by running `wsl --version`.
2. In WSL, make sure the following lines are added in `/etc/wsl.conf` (*you might need to run your editor with sudo privileges, e.g. `sudo nano /etc/wsl.conf`*):
	 ```bash
	 [boot]
	 systemd=true
	 ```
   - Close all the WSL distro Windows and run `wsl --shutdown` from PowerShell to restart your WSL instances.
   - Run the WSL distro again, you should have `systemd` running. You can confirm this by running:

	   ```bash
	   systemctl status
	   ```

3. Install Nix for the multiuser (for WSL 2 with `systemd` support only), using the following command:
	 ```bash
	 sh <(curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install) --daemon
	 ```
   **OR**

   Install Nix for the single-user (in case of WSL 1 with no `systemd` support), using the following command:

   ```bash
   sh <(curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install) --no-daemon
   ```

4. Restart the Terminal.

5. Verify the Nix installation by running: `nix --version`.

6. Enable experimental features `nix-command` and `flakes`:
   ```bash
   mkdir -p ~/.config/nix
   printf "experimental-features = nix-command flakes\n" > ~/.config/nix/nix.conf
   ```

7. Restart the Nix daemon (in WSL 2 case):
   ```bash
   sudo systemctl restart nix-daemon.service
   ```

8. Verify that the experimental features `nix-command` and `flakes` are enabled:
   ```bash
   nix config show | grep flakes
   nix config show | grep nix-command
   ```

### Setup

1. Confirm the Linux username and home directory:
   ```bash
   whoami
   echo "$HOME"

   # Expected:
   # ishahroz
   # /home/ishahroz
   ```

> If the user name is different, make sure to update in the relevant files.

2. Check the hardware architecture:
   ```bash
   uname -m
   ```

3. Apply the Home Manager config:
   - For `aarch64`:
     ```bash
     nix run home-manager/master -- switch --flake ~/dotfiles/nix#ishahroz-aarch64-linux
     ```
   - For `x86_64`:
     ```bash
     nix run home-manager/master -- switch --flake ~/dotfiles/nix#ishahroz-x86_64-linux
     ```

4. If you get any error where Home Manager refuses to overwrite existing files and asks for the backup first, just add `-b backup` flag:
   ```bash
   nix run home-manager/master -- switch -b backup --flake ~/dotfiles/nix#ishahroz-aarch64-linux
   ```
