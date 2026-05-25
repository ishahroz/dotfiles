{
  programs.bash = {
    enable = true;
    enableCompletion = true;

    shellAliases = {
      cl = "clear";
      l = "eza --icons -a";
      ls = "eza --icons -a";
      ll = "eza --icons -a -l";
      sym = "eza -l -a --icons | grep -- '->'";
      cat = "bat --paging=never";
      where = "type -a";

      lg = "lazygit";
      ld = "lazydocker";

      y = "yazi";

      hmo = "nvim ~/dotfiles";
      dot = "nvim ~/dotfiles";

      ga = "git add";
      gaa = "git add .";
      gs = "git status";

      nv = "nvim";
      n = "nvim";
    };

    initExtra = ''
      hma() {
        local system

        case "$(uname -m)" in
          x86_64)
            system="x86_64-linux"
            ;;
          aarch64|arm64)
            system="aarch64-linux"
            ;;
          *)
            echo "Unsupported Linux architecture: $(uname -m)" >&2
            return 1
            ;;
        esac

        home-manager switch --flake "$HOME/dotfiles/nix#ishahroz-$system"
      }
    '';
  };
}
