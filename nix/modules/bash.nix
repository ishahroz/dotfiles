{
  programs.bash = {
    enable = true;
    enableCompletion = true;
    shellAliases = {
      ls = "eza --icons -a";
      ll = "eza --icons -a -l";
      sym = "eza -l -a --icons | grep -- '->'";
      cat = "bat --paging=never";
      where = "type -a";
      lg = "lazygit";
      ld = "lazydocker";
      y = "yazi";
      hma = "home-manager switch --flake ~/dotfiles";
      hmo = "code ~/dotfiles";
      ga = "git add";
      gaa = "git add .";
      gs = "git status";
    };
  };
}
