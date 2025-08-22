{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  fonts = {
    fontconfig = {
      enable = pkgs.stdenv.isLinux;
      defaultFonts.monospace = [ "JetBrainsMono NF" ];
    };
  };
}
