{ pkgs, ... }:
{
  fonts = {
    fontconfig = {
      enable = pkgs.stdenv.isLinux;
      defaultFonts.monospace = [ "JetBrains Mono" ];
    };
  };

  dconf = {
    enable = pkgs.stdenv.isLinux;
    settings = {
      "org/gnome/desktop/interface" = {
        monospace-font-name = "JetBrains Mono 11";
      };
    };
  };
}
