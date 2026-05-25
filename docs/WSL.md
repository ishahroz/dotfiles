# Dotfiles Guide for WSL

## Prerequisites

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

## Setup

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
