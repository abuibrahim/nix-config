{ pkgs, ... }:
{
  home.packages =
    with pkgs;
    [
      mosh
      ripgrep
      lsd
      fzf
      fd
      nixd
      nixfmt-rfc-style
    ]
    ++ lib.optionals stdenv.isLinux [
      google-chrome
    ];
}
