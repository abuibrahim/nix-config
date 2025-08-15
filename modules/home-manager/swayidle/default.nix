{
  osConfig,
  pkgs,
  lib,
  ...
}:
{
  services.swayidle = {
    enable = osConfig.programs ? niri;
    timeouts = [
      {
        timeout = 300; # 5 minutes
        command = "${pkgs.swaylock-effects}/bin/swaylock -f";
        resumeCommand = ""; # No action on resume
      }
    ];
    events = [
      {
        event = "before-sleep";
        command = "${pkgs.swaylock-effects}/bin/swaylock -f";
      }
    ];
  };

  systemd.user.services.swayidle.Unit.ConditionEnvironment = lib.mkForce [
    "WAYLAND_DISPLAY"
    "!XDG_CURRENT_DESKTOP=GNOME"
  ];
}
