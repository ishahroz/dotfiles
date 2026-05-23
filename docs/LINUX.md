# Dotfiles Guide for Linux

I am using `Nix` for managing packages / system enivornments, and `Bash` as the shell.

> The following guide was tested on `Ubuntu-24.04`, and the user name was set as `ishahroz`.


| Command | Output |
| -------------- | --------------- |
| `uname -m` | `aarch64` |
| `whoami` | `ishahroz` |
| `echo "$HOME"`  | `/home/ishahroz` |


## Prerequisites

### Install Essentials Packages

1. Open `Terminal` and run the following commands:
   ```bash
   sudo apt install git
   sudo apt install curl
   ```

2. Verify the installation:
   ```bash
   git --version
   curl --version
   ```

### Clone Dotfiles

1. Open `Terminal` and clone this `dotfiles` repository in the home directory (`$HOME`):
   ```bash
   git clone https://github.com/ishahroz/dotfiles.git
   ```

### Install Nix and Enable Flakes

1. Install Nix for the multiuser, using the following command:
	 ```bash
	 sh <(curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install) --daemon
	 ```
2. Restart the Terminal.

3. Verify the Nix installation by running: `nix --version`.

4. Enable experimental features `nix-command` and `flakes`:
   ```bash
   mkdir -p ~/.config/nix
   printf "experimental-features = nix-command flakes\n" > ~/.config/nix/nix.conf
   ```

5. Restart the Nix daemon:
   ```bash
   sudo systemctl restart nix-daemon.service
   ```

6. Verify that the experimental features `nix-command` and `flakes` are enabled:
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
     nix run github:nix-community/home-manager -- switch --flake ~/dotfiles/nix#ishahroz-aarch64-linux
     ```
   - For `x86_64`:
     ```bash
     nix run github:nix-community/home-manager -- switch --flake ~/dotfiles/nix#ishahroz-x86_64-linux
     ```

