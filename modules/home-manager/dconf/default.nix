{ pkgs, ... }:
{
  dconf = {
    enable = pkgs.stdenv.isLinux;
    settings = {
      "org/gnome/desktop/interface" = {
        monospace-font-name = "JetBrains Mono 11";
      };
      "org/gnome/desktop/wm/preferences" = {
        focus-mode = "sloppy";
        auto-raise = true;
      };
    };
  };
}
