{
  flake.modules.nixos."hosts/t25" =
    { inputs, ... }:
    {
      imports = [ inputs.disko.nixosModules.disko ];
      disko.devices.disk.main = {
        device = "/dev/nvme0n1";
        type = "disk";
        content = {
          type = "gpt";
          partitions = {
            ESP = {
              size = "512M";
              type = "EF00";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
                mountOptions = [ "umask=0077" ];
              };
            };
            luks = {
              size = "100%";
              content = {
                type = "luks";
                name = "crypted";
                settings.allowDiscards = true;
                settings.crypttabExtraOpts = [
                  "tpm2-device=auto"
                  "tpm2-measure-pcr=yes"
                ];
                content = {
                  type = "btrfs";
                  extraArgs = [
                    "-f"
                    "--csum xxhash"
                  ];
                  subvolumes =
                    let
                      btrfsMountOptions = [
                        "autodefrag"
                        "compress=zstd:1"
                        "noatime"
                      ];
                    in
                    {
                      "/root" = {
                        mountpoint = "/";
                        mountOptions = btrfsMountOptions;
                      };
                      "/home" = {
                        mountpoint = "/home";
                        mountOptions = btrfsMountOptions;
                      };
                      "/nix" = {
                        mountpoint = "/nix";
                        mountOptions = btrfsMountOptions;
                      };
                      "/swap" = {
                        mountpoint = "/.swap";
                        swap.swapfile.size = "16G";
                      };
                    };
                };
              };
            };
          };
        };
      };
    };
}
