{
  flake.modules.homeManager.desktop =
    { pkgs, ... }:
    {
      programs.swaylock = {
        enable = true;
        package = pkgs.swaylock-effects;
        settings = {
          screenshots = true;
          clock = true;
          indicator = true;
          indicator-caps-lock = true;
          indicator-radius = 100;
          indicator-thickness = 10;
          effect-blur = "10x5";
          effect-vignette = "0.5:0.5";
          grace = 2;
          fade-in = 0.2;
        };
      };
    };
}
