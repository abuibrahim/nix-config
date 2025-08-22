{ pkgs, ... }:
{
  programs.emacs = {
    enable = true;
    package = pkgs.emacs-pgtk;
    extraConfig = builtins.readFile ./init.el;
    extraPackages =
      epkgs: with epkgs; [
        magit
        smartparens
        editorconfig
        nix-mode
        markdown-mode
        cmake-mode
        auto-dark
        catppuccin-theme
        ligature
        rust-mode
        lua-mode
        treesit-grammars.with-all-grammars
      ];
  };

  services = {
    emacs = {
      enable = true;
      client.enable = true;
      defaultEditor = true;
    };
  };
}
