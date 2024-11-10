# README

Welcome to my Chezmoi configuration repository. This repository contains my personal dotfiles and configuration managed by [Chezmoi](https://www.chezmoi.io/).

## Chezmoi

To apply these configurations to your system, follow these steps:

1. Install Chezmoi:

   ```sh
   sh -c "$(curl -fsLS get.chezmoi.io)"
   ```

2. Initialize Chezmoi with this repository:

   ```sh
   chezmoi init <your-repo-url>
   ```

3. Apply the configurations:

   ```sh
   chezmoi apply
   ```

## Brewfile

- I use [Homebrew](https://brew.sh/) and [`Brewfile`](./Brewfile) to manage my packages.
- Make sure to install Homebrew first.

## Karabiner-Elements

- I use [Karabiner-Elements](https://github.com/pqrs-org/Karabiner-Elements) for keyboard key remapping.
- My configurations can be found in [`dot_config/private_karabiner/private_karabiner.json`](./dot_config/private_karabiner/private_karabiner.json).
- You can find more complex modification rules [here](https://ke-complex-modifications.pqrs.org/).

## skhd

- I use [skhd](https://github.com/koekeishiya/skhd) for keyboard shortcuts.
- Configurations can be found in [`dot_skhdrc`](./dot_skhdrc).
- Read more about valid keywords [here](https://github.com/koekeishiya/skhd/issues/1).
