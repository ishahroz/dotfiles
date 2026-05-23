# Dotfiles Guide for Linux

I am using `Nix` for managing packages / system enivornments and `Bash` as the shell.

> The following guide was tested on `Ubuntu-24.04`, and the user name was set as `ishahroz`.


| Command | Output |
| -------------- | --------------- |
| `uname -m` | aarch64 |
| whoami | ishahroz |
| echo "$HOME"  | /home/ishahroz |


## Prerequisites

### Install Essentials Packages

1. Open `Terminal` and run the following commands:
   ```bash
   sudo apt install git
   sudo apt install curl
   ```

2. Verify the installation by running: `git --version`.

### Clone Dotfiles

1. Open `Terminal` and clone this `dotfiles` repository in the home directory (`$HOME`):
   ```bash
   git clone https://github.com/ishahroz/dotfiles.git
   ```

### Install Nix

1. Install Nix for the multiuser, using the following command:
	 ```bash
	 sh <(curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install) --daemon
	 ```
2. Restart the Terminal.

3. Verify the Nix installation by running: `nix --version`.

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

2. Confirm the hardware architecture:
   ```bash
   uname -m
   ```

3. Enable the Nix flakes command support:
   ```bash
   mkdir -p ~/.config/nix
   printf "experimental-features = nix-command flakes\n" > ~/.config/nix/nix.conf
   ```

4. Clone the dotfiles inside WSL and apply the Home Manager config:
   ```bash
   git clone https://github.com/ishahroz/dotfiles.git ~/dotfiles
   nix run github:nix-community/home-manager -- switch --flake ~/dotfiles/nix#ishahroz-aarch64-linux
   ```
   Use `ishahroz-x86_64-linux` instead on Intel/AMD WSL.
