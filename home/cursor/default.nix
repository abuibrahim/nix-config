{ pkgs, lib, ... }:
{
  home.pointerCursor = lib.mkIf pkgs.stdenv.isLinux {
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 48;
    gtk.enable = true;
  };
}
