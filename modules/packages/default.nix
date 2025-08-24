{
  flake.modules.homeManager.base =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        mosh
        ripgrep
        lsd
        fd
        nixd
        nixfmt-rfc-style
        google-chrome
      ];
    };
}
