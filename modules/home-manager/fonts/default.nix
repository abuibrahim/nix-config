{ pkgs, ... }:
{
  fonts = {
    fontconfig = {
      enable = pkgs.stdenv.isLinux;
      defaultFonts.monospace = [ "JetBrainsMono NF" ];
    };
  };
}
