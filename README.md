# dotfiles

## GNU Stow

I manage my dotfiles and macOS configurations using [GNU Stow](https://www.gnu.org/software/stow/); which is a symlink farm manager. The actual files will live in this repo and the symlinks will be created.

[`.stow-local-ignore`](./.stow-local-ignore) will be used to ignore creating symlinks for files resiign in this repo when we run `stow .`.

There is concept of package in GNU Stow. Where we can consolidate files related to single application. For example `.aerospace.toml` should be saved in `~/.aerospaace.toml` by default but we save files inside `aerospace` folder. `aerospace` becomes a package and we can create symlink for indv packages using `stow <package_name>`. Int this case, `stow aerospace`.

Stow is smart enough to know what package is and how to create symlinks for those package. `config` folder is a very good way to undestand this concept. We have `config/.config`. Symlinks for all the child folders in `config/.config/*` will be crated and copied like `~/.config/*`.

## Homebrew

I mainly use [Homebrew](https://brew.sh/) for installing most of the system applications. #TODO:

- I use [Homebrew](https://brew.sh/) and [`Brewfile`](./Brewfile) to manage my packages.
- Make sure to install Homebrew first.

## Karabiner-Elements

- I use [Karabiner-Elements](https://github.com/pqrs-org/Karabiner-Elements) for keyboard key remapping.
- My configurations can be found in [`dot_config/private_karabiner/private_karabiner.json`](./dot_config/private_karabiner/private_karabiner.json).
- You can find more complex modification rules [here](https://ke-complex-modifications.pqrs.org/).

## Raycast

- I use [Raycast](https://www.raycast.com/) for shortcuts and quick actions.
- Configurations can be found in [`Raycast.rayconfig`](./raycast/Raycast.rayconfig).
- To import the configuration, open Raycast and run command `Import Settings & Data`.
- To export the configuration, open Raycast and run command `Export Settings & Data`.

## macOS Default Settings

- I use [`setup.sh`](./setup.sh) to set up macOS default settings.

## Claude Code

- I use [ccstatusline](https://github.com/sirmalloc/ccstatusline) to configure the CC status line and save the settings at [`dot_config/ccstatusline/settings.json`](./dot_config/ccstatusline/settings.json).
- This settings file then gets loaded up by the CC [`settings.json`](./.claude/settings.json).

# TODO:

- document how to setup new macos fresh macos setup
- use nix darwn to manage all the configurations
- document window nixos wsl configuratiosn as well (mostly to enable me to work on Windows laptops)
- port macOS settings / configurations for linux as well
