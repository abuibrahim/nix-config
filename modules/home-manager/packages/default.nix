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
      cascadia-code
    ]
    ++ lib.optionals stdenv.isLinux [
      google-chrome
    ];
}
