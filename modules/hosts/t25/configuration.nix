{
  flake.modules.nixos."hosts/t25" = {
    # Enable SSH
    services.openssh.enable = true;

    # Enable CUPS to print documents.
    services.printing.enable = true;
    services.avahi.nssmdns4 = true;

    nixpkgs.config.allowUnfree = true;
    system.stateVersion = "25.05";
  };
}
