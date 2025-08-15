{ osConfig, ... }:
{
  services.polkit-gnome.enable = osConfig.programs.niri.enable;

  # See https://github.com/nix-community/home-manager/commit/f5b12be834874f7661db4ced969a621ab2d57971#diff-c6188e6a9a40c324781da5eb03b3eef6ef7d1d4afa2eb74551dc1b1d364db2b2
  systemd.user.services.polkit-gnome = {
    Unit = {
      After = [ "graphical-session.target" ];
      ConditionEnvironment = "!XDG_CURRENT_DESKTOP=GNOME";
    };
  };
}
