{ config, pkgs, ... }:

{
  home.packages = [ pkgs.neovim ];

  home.file.".config/nvim" = {
    source = config.lib.file.mkOutOfStoreSymlink
      "${config.home.homeDirectory}/dotfiles/nvim/.config/nvim";
    recursive = true;
  };
}
