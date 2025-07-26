{ pkgs, ... }:
{
  programs.ghostty = {
    enable = pkgs.stdenv.isLinux;
    enableFishIntegration = true;
    settings = {
      font-family = "JetBrains Mono";
      font-size = 11;
      gtk-tabs-location = "hidden";
      background-opacity = 0.9;
      background-blur-radius = 20;
      background-blur = true;
    };
  };
}
