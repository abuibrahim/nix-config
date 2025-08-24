{
  flake.modules.homeManager.desktop = {
    programs.ghostty = {
      enable = true;
      enableFishIntegration = true;
      settings = {
        font-family = "JetBrainsMono NF";
        font-size = 12;
        background-opacity = 0.9;
        background-blur-radius = 20;
        background-blur = true;
      };
    };
  };
}
