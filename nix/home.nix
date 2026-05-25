{ config, pkgs, ... }:

let
  devPackages = import ./packages/dev.nix { inherit pkgs; };
  cloudPackages = import ./packages/cloud.nix { inherit pkgs; };
  terminalPackages = import ./packages/terminal.nix { inherit pkgs; };
  essentialPackages = import ./packages/essentials.nix { inherit pkgs; };
in
{
  imports = [
    ./config/git.nix
    ./config/bash.nix
    ./config/neovim.nix
    ./config/starship.nix
    ./config/zoxide.nix
    ./config/yazi.nix
  ];

  home.stateVersion = "25.11"; # Please read the comment before changing.

  home.packages =
    devPackages
    ++ cloudPackages
    ++ terminalPackages
    ++ essentialPackages;

  home.file = {
  };

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  programs.home-manager.enable = true;
}
