{ pkgs, ... }:
{
  fonts.packages = with pkgs; [
    cascadia-code
    nerd-fonts.jetbrains-mono
  ];
}
