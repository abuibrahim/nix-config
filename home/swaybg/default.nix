{ pkgs, ... }:
let
  background = ./background.png;
in
{
  systemd.user.services = {
    swaybg = {
      Unit = {
        Description = "Wallpaper Service";
        After = [ "graphical-session.target" ];
        PartOf = [ "graphical-session.target" ];
        ConditionEnvironment = [
          "WAYLAND_DISPLAY"
          "!XDG_CURRENT_DESKTOP=GNOME"
        ];
      };
      Service = {
        Type = "simple";
        ExecStart = "${pkgs.swaybg}/bin/swaybg -m fill -i ${background}";
        Restart = "always";
      };
      Install = {
        WantedBy = [ "graphical-session.target" ];
      };
    };
  };
}
