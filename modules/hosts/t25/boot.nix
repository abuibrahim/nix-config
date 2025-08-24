{ inputs, ... }:
{
  flake.modules.nixos."hosts/t25" =
    { pkgs, lib, ... }:
    {
      imports = [ inputs.lanzaboote.nixosModules.lanzaboote ];
      boot = {
        loader = {
          efi.canTouchEfiVariables = true;
          # Make lanzaboote install systemd-boot
          systemd-boot.enable = lib.mkForce false;
          timeout = 0;
        };

        lanzaboote = {
          enable = true;
          pkiBundle = "/var/lib/sbctl";
        };

        initrd = {
          systemd.enable = true;
          availableKernelModules = [
            "xhci_pci"
            "nvme"
            "usbhid"
            "usb_storage"
            "uas"
            "sd_mod"
          ];
        };

        plymouth.enable = true;
        kernelParams = [ "quiet" ];
        kernelModules = [ "kvm-intel" ];
      };

      environment.systemPackages = [ pkgs.sbctl ];
    };
}
