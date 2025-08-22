{ osConfig, ... }:
{
  services.mako.enable = osConfig.programs ? niri;
}
