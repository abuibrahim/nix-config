{ osConfig, lib, ... }:
let
  inherit (lib.modules) mkIf;
in
{
  xdg.configFile."niri/config.kdl" = mkIf (osConfig.programs ? niri) {
    source = ./config.kdl;
  };
}
