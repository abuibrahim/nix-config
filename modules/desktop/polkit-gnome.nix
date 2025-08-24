{
  flake.modules.homeManager.desktop = {
    services.polkit-gnome.enable = true;

    systemd.user.services.polkit-gnome = {
      Unit = {
        After = [ "graphical-session.target" ];
        ConditionEnvironment = "!XDG_CURRENT_DESKTOP=GNOME";
      };
    };
  };
}
