# Doom Emacs

This is the stow package for [Doom Emacs](https://github.com/doomemacs/doomemacs).

## Apperance

Theme: `doom-tokyo-night`
Font Family: `ZedMono Nerd Font`
Font Size: `18`

Refer to [config.el](./.doom.d/config.el).

## Setup

1. Download and Install `ZedMono Nerd Font` from this [link](https://www.nerdfonts.com/font-downloads).
2. Either use [`GNU Stow`](https://www.gnu.org/software/stow/) for creating symlinks `stow doom` **OR** just copy `.doom.d` folder to your doom config location.
3. Sync the changes: `doom sync`

## Troubleshooting

### Font not found?

You might face the issue that `ZedMono Nerd Font` was not found on the Windows system (even after installing the font). For that, just update:

```emacs-lisp
(setq doom-font (font-spec :family "ZedMono NF" :size 18))
```

### `doom` command not found?

Because it was not added in the `$PATH`, either add in the path or run directly. Typical `doom` executable location is `~/.emacs.d/bin/doom`.
