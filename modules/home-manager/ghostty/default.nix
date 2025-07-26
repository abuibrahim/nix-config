{ pkgs, ... }:
{
  programs.ghostty = {
    enable = pkgs.stdenv.isLinux;
    enableFishIntegration = true;
    settings = {
      theme = "light:catppuccin-latte,dark:catppuccin-mocha";
      font-family = "Cascadia Code NF";
      font-size = 10;
      adjust-cell-height = "20%";
      background-opacity = 0.9;
      gtk-titlebar = true;
      gtk-tabs-location = "hidden";
    };
  };
}
