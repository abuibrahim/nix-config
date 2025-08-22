{ pkgs, ... }:
{
  dconf = {
    enable = pkgs.stdenv.isLinux;
    settings = {
      "org/gnome/desktop/interface" = {
        monospace-font-name = "JetBrainsMono NF 12";
      };
      "org/gnome/desktop/wm/preferences" = {
        focus-mode = "sloppy";
        auto-raise = true;
      };
    };
  };
}
