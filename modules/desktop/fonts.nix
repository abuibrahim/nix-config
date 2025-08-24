{
  flake.modules = {
    nixos.desktop =
      { pkgs, ... }:
      {
        fonts.packages = with pkgs; [
          nerd-fonts.jetbrains-mono
        ];

        fonts.fontconfig = {
          defaultFonts = {
            monospace = [ "JetBrainsMono NF" ];
          };
        };
      };

    homeManager.desktop = {
      fonts.fontconfig.enable = true;
    };
  };
}
