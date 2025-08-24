{
  flake.modules.nixos = {
    programs.bottom = {
      enable = true;
      settings = {
        theme = "catppuccin-mocha";
      };
    };
  };
}
