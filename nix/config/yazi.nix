{ ... }:

{
  programs.yazi = {
    enable = true;
    enableBashIntegration = true;
    shellWrapperName = "yy";
  };

  xdg.configFile."yazi/yazi.toml".source = ../../yazi/.config/yazi/yazi.toml;
}
