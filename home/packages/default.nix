{ pkgs, ... }:
{
  home.packages =
    with pkgs;
    [
      mosh
      ripgrep
      lsd
      fd
      nixd
      nixfmt-rfc-style
    ]
    ++ lib.optionals stdenv.isLinux [
      google-chrome
    ];
}
