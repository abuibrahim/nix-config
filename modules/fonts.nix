{ pkgs, ... }:
{
  fonts.packages = with pkgs; [
    cascadia-code
    jetbrains-mono
    material-icons
    ibm-plex
    inter
    font-awesome
    powerline-fonts
    nerd-fonts.blex-mono
  ];
}
