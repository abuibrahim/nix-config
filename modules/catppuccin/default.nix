{ inputs, ... }:
{
  flake.modules = {
    nixos.base = {
      imports = [ inputs.catppuccin.nixosModules.catppuccin ];
      catppuccin = {
        enable = true;
        flavor = "mocha";
        accent = "lavender";
      };
    };

    homeManager.base = {
      imports = [ inputs.catppuccin.homeModules.catppuccin ];
      catppuccin = {
        enable = true;
        flavor = "mocha";
        accent = "lavender";
      };
    };
  };
}
