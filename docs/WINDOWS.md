# Dotfiles Setup Guide for Windows + WSL

The following guide was tested on `Windows 11 Pro`, and `Ubuntu-24.04` was the WSL distro.

Personally, I love to use:
  - `Scoop` for managing packages and `Powershell` for scripting on **Windows side of things**
  - `Nix` for managing packages and `Bash` for scripting on **WSL (Linux) side of things**

## Windows Setup

### WSL and Ubuntu

1. Open `PowerShell` in **administrator** mode by right-clicking and selecting `Run as administrator`.

2. Run the following command to install WSL without installing a distribution:
   ```powershell
   wsl --install --no-distribution
   ```

3. Install `Ubuntu-24.04` as the Linux distribution:

   ```powershell
   wsl --install -d Ubuntu-24.04
   ```

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
   ```

2. Verify the installation by running: `git --version`.

### Terminal

1. Make sure [`Windows Terminal`](https://github.com/microsoft/terminal) is installed on your Windows OS.

2. Open Windows Terminal settings and set the following values:
   - On the `Startup` page, set:
     - Default Profile -> `Ubuntu-24.04`
     - Default Terminal application -> `Windows Terminal`
     - Launch parameters -> `Launch mode = Maximized`

3. Click on "Open JSON File" in the bottom left corner:
   - Copy [`gruvbox_dark.json`](./ms-terminal/gruvbox_dark.json) and paste in the `schemes` array.
   - Click on "Save".
   - Go to your profile settings (e.g: `Ubuntu-24.04`) and set color scheme to "Gruvbox Dark".
   - Set cursor shape to "Bar", font size to "18" and font face to "ZedMono Nerd Font" (after clicking on "Show all fonts").
4. Click on "Save" and restart the Terminal.

### Packages / Dotfiles Setup

1. Open `Powershell` and clone this `dotfiles` repository in the user directory (`$HOME`):
   ```powershell
   git clone https://github.com/ishahroz/dotfiles.git

   cd dotfiles
   ```

2. Run the [`windows-setup.ps1`](../scripts/windows-setup.ps1) script:
   ```powershell
   .\scripts\windows-setup.ps1
   ```

## WSL Setup

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

4. Restart the WSL shell again to load the changes.
5. Verify the Nix installation by running: `nix --version`.
