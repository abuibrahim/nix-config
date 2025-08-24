{
  flake.modules.homeManager.shell = {
    programs.eza = {
      enable = true;
      enableFishIntegration = true;
      theme = import ./_catppuccin.nix;
      icons = "auto";
    };
  };
}
