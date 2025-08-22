{ osConfig, ... }:
{
  programs.fuzzel.enable = osConfig.programs ? niri;
}
