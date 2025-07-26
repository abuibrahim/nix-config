{ pkgs, ... }:
{
  fonts = {
    fontconfig = {
      enable = pkgs.stdenv.isLinux;
      defaultFonts.monospace = [ "Cascadia Code NF" ];
    };
  };

  dconf = {
    enable = pkgs.stdenv.isLinux;
    settings = {
      "org/gnome/desktop/interface" = {
        monospace-font-name = "Cascadia Code NF 10";
        scaling-factor = 1.2;
      };
    };
  };
}
