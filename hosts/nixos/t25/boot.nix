{
  lib,
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    inputs.lanzaboote.nixosModules.lanzaboote
  ];

  boot = {
    initrd.systemd.enable = true;
    initrd.verbose = false;
    loader.efi.canTouchEfiVariables = true;
    plymouth.enable = true;
    kernelParams = [ "quiet" ];
    loader.timeout = 0;
    lanzaboote = {
      enable = true;
      pkiBundle = "/var/lib/sbctl";
    };
    # Make lanzaboote install systemd-boot
    loader.systemd-boot.enable = lib.mkForce false;
  };

  environment.systemPackages = [ pkgs.sbctl ];
}
