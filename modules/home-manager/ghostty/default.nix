{ pkgs, ... }:
{
  programs.ghostty = {
    enable = pkgs.stdenv.isLinux;
    enableFishIntegration = true;
    settings = {
      font-family = "JetBrains Mono";
      font-size = 12;
      gtk-titlebar = false;
      background-opacity = 0.9;
      background-blur-radius = 20;
      background-blur = true;
    };
  };
}
