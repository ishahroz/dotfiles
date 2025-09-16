# dotfiles

## GNU Stow

I manage my dotfiles and macOS configurations using [GNU Stow](https://www.gnu.org/software/stow/); which is a symlink farm manager. The actual files will live in this repo and the symlinks will be created.

[`.stow-local-ignore`](./.stow-local-ignore) will be used to ignore creating symlinks for files residing in this repo when we run `stow .`.

There is a concept of packages in GNU Stow. Where we can consolidate files related to a single application. For example [`.aerospace.toml`](./aerospace/.aerospace.toml) should be saved in `~/.aerospace.toml` by default but we save files inside the `aerospace` folder. `aerospace` becomes a package and we can create symlinks for individual packages using `stow <package_name>`. In this case, `stow aerospace`.

Stow is smart enough to know what a package is and how to create symlinks for those packages. The [`config`](./config/) folder is a very good way to understand this concept. We have `config/.config`. Symlinks for all the child folders in `config/.config/*` will be created and copied like `~/.config/*`.

To create symlinks for all the packages and files, we can just run `stow .` (I have not tested this myself, maybe will try when I next do a fresh install of macOS or new machine).

## Homebrew

I mainly use [Homebrew](https://brew.sh/) for installing most of the system applications and utilities.

- [`Brewfile`](./Brewfile) tracks all the applications and utilities I have installed on my system.
- We can sync and update Brewfile using

```zsh
make sync-brew
```

## Karabiner-Elements

- I use [Karabiner-Elements](https://github.com/pqrs-org/Karabiner-Elements) for keyboard key remapping.
- My configurations can be found in [`config/.config/karabiner/karabiner.json`](./config/.config/karabiner/karabiner.json).
- You can find more complex modification rules [here](https://ke-complex-modifications.pqrs.org/).

## Raycast

- I use [Raycast](https://www.raycast.com/) for shortcuts and quick actions.
- Configurations can be found in [`Raycast.rayconfig`](./raycast/Raycast.rayconfig).
- To import the configuration, open Raycast and run the command `Import Settings & Data`.
- To export the configuration, open Raycast and run the command `Export Settings & Data`.

## macOS Default Settings

- I use [`scripts/setup.sh`](./scripts/setup.sh) to set up macOS default settings.

## Claude Code

- I use [ccstatusline](https://github.com/sirmalloc/ccstatusline) to configure the CC status line and save the settings at [`dot_config/ccstatusline/settings.json`](./dot_config/ccstatusline/settings.json).
- This settings file then gets loaded up by the CC [`settings.json`](./.claude/settings.json).

# TODO:

- document how to setup new macOS fresh macOS setup
- use nix darwin to manage all the configurations
- document Windows nixos wsl configurations as well (mostly to enable me to work on Windows laptops)
- port macOS settings / configurations for linux as well
