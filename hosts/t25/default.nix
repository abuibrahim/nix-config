{
  lib,
  pkgs,
  inputs,
  username,
  hostname,
  ...
}:

{
  imports = [
    inputs.lanzaboote.nixosModules.lanzaboote
    inputs.disko.nixosModules.disko
    ./disko.nix
    ./hardware.nix
    ../../modules
  ];

  # Use the systemd-boot EFI boot loader.
  boot = {
    initrd.systemd.enable = true;
    initrd.verbose = false;
    loader.systemd-boot.enable = lib.mkForce false;
    loader.efi.canTouchEfiVariables = true;
    lanzaboote = {
      enable = true;
      pkiBundle = "/var/lib/sbctl";
    };
    plymouth.enable = true;
    kernelParams = [ "quiet" ];
    loader.timeout = 0;
  };

  hardware.graphics.enable = true;
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;
    prime = {
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:2:0:0";
    };
  };

  networking.hostName = "${hostname}";

  # Set your time zone.
  time.timeZone = "America/Los_Angeles";

  # Enable Nvidia drivers
  services.xserver.videoDrivers = [ "nvidia" ];

  # Enable GNOME Desktop Environment
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome = {
    enable = true;
    extraGSettingsOverrides = ''
      [org.gnome.mutter]
      experimental-features=['scale-monitor-framebuffer', 'xwayland-native-scaling']
    '';
  };
  services.gnome.core-apps.enable = false;
  environment.gnome.excludePackages = with pkgs; [
    gnome-tour
  ];

  # Enable SSH
  services.openssh.enable = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;
  services.avahi.nssmdns4 = true;

  programs.fish.enable = true;

  environment.systemPackages = with pkgs; [
    sbctl loupe nautilus gnome-calendar file-roller
  ];

  users.users.${username} = {
    description = "Abdurrahman Hussain";
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    shell = pkgs.fish;
  };

  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "25.05";
}
