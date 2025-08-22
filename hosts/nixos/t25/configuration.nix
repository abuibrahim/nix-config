{ hostname, ... }:
{
  networking.hostName = "${hostname}";

  time.timeZone = "America/Los_Angeles";

  # Enable SSH
  services.openssh.enable = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;
  services.avahi.nssmdns4 = true;

  programs.fish.enable = true;

  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "25.05";
}
