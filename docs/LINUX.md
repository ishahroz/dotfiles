# Dotfiles Guide for Linux

**I am using `Nix` for managing packages and `Bash` as the shell.

> The following guide was tested on `Ubuntu-24.04`.

```bash
uname -m

# aarch64
```

## Prerequisites

This guide assumes the user name is set as `ishahroz`. If the user name is different, make sure to update in the relevant files.

```bash
echo $USER

# ishahroz
```

```bash
echo $HOME

# /home/ishahroz
```

## Install Git

1. Open `PowerShell` and run the following command:
   ```bash
   sudo apt install git
   ```

2. Verify the installation by running: `git --version`.

## Dotfiles

1. Open `Terminal` and clone this `dotfiles` repository in the home directory (`$HOME`):
   ```bash
   git clone https://github.com/ishahroz/dotfiles.git

   cd dotfiles
   ```

## Nix

1. Install Nix for the multiuser (for WSL 2 with `systemd` support only), using the following command:
	 ```bash
	 sh <(curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install) --daemon
	 ```
2. Restart the WSL shell again to load the changes.
3. Verify the Nix installation by running: `nix --version`.
4. Verify the Linux username and home directory:
   ```bash
   whoami
   echo "$HOME"

   # Expected:
   # ishahroz
   # /home/ishahroz
   ```
5. Enable the Nix flakes command support:
   ```bash
   mkdir -p ~/.config/nix
   printf "experimental-features = nix-command flakes\n" > ~/.config/nix/nix.conf
   ```
6. Clone the dotfiles inside WSL and apply the Home Manager config:
   ```bash
   git clone https://github.com/ishahroz/dotfiles.git ~/dotfiles
   nix run github:nix-community/home-manager -- switch --flake ~/dotfiles/nix#ishahroz-aarch64-linux
   ```
   Use `ishahroz-x86_64-linux` instead on Intel/AMD WSL.
