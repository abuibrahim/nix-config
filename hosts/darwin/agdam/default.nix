{
  pkgs,
  inputs,
  username,
  ...
}:

{
  environment.shells = with pkgs; [ fish ];

  users.knownUsers = [ "${username}" ];
  users.users.${username} = {
    uid = 502;
    name = "${username}";
    home = "/Users/${username}";
  };

  # Let Determinate Systems manage nix
  nix.enable = false;

  # Enable alternative shell support in nix-darwin.
  programs.fish.enable = true;

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";

  system = {
    primaryUser = "${username}";

    keyboard = {
      enableKeyMapping = true;
      swapLeftCtrlAndFn = true;
    };

    defaults = {
      dock = {
        autohide = true;
        orientation = "left";
        show-recents = false;
        showhidden = true;
        static-only = false;
        persistent-apps = [
          "/Applications/Google Chrome.app"
          "/Applications/Ghostty.app"
          "/System/Applications/Mail.app"
          "/System/Applications/Calendar.app"
          "/System/Applications/System Settings.app"
        ];
      };

      finder = {
        ShowPathbar = true;
      };
    };
  };

  # Enable sudo login with Touch ID
  security.pam.services.sudo_local.touchIdAuth = true;

  # Set Git commit hash for darwin-version.
  system.configurationRevision = inputs.self.rev or inputs.self.dirtyRev or null;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 6;
}
