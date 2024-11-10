# README

Welcome to my Chezmoi configuration repository. This repository contains my personal dotfiles and configuration managed by [Chezmoi](https://www.chezmoi.io/).

## Chezmoi Setup

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

## Brewfile Setup

If you use Homebrew to manage your packages, you can install the packages listed in the Brewfile included in this repository. Follow these steps:

1. Ensure Homebrew is installed on your system. If it is not, you can install it with the following command:

   ```sh
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   ```

2. Install the packages from the Brewfile:
   ```sh
   brew bundle --file=/path/to/your/Brewfile
   ```

Replace `/path/to/your/Brewfile` with the actual path to the Brewfile in this repository.

## Karabiner-Elements Setup

- I use [Karabiner-Elements](https://github.com/pqrs-org/Karabiner-Elements) for keyboard key remapping.
- My configurations can be found in `dot_config/private_karabiner/private_karabiner.json`.
- You can find more complex modification rules [here](https://ke-complex-modifications.pqrs.org/).
