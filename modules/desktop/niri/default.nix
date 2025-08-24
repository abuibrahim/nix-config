{
  flake.modules = {
    nixos.desktop = {
      programs.niri.enable = true;
      environment.sessionVariables.NIXOS_OZONE_WL = "1";
    };

    homeManager.dekstop = {
      xdg.configFile."niri/config.kdl".source = ./config.kdl;
    };
  };
}
