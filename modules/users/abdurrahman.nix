{ config, ... }:
{
  flake = {
    meta.users = {
      abdurrahman = {
        email = "2321000+abuibrahim@users.noreply.github.com";
        name = "Abdurrahman Hussain";
        username = "abdurrahman";
      };
    };

    modules.nixos.abdurrahman =
      { pkgs, ... }:
      {
        programs.fish.enable = true;

        users.users.abdurrahman = {
          description = config.flake.meta.users.abdurrahman.name;
          isNormalUser = true;
          createHome = true;
          extraGroups = [
            "audio"
            "input"
            "networkManager"
            "sound"
            "tty"
            "wheel"
          ];
          shell = pkgs.fish;
          initialPassword = "id";
        };

        nix.settings.trusted-users = [ config.flake.meta.users.abdurrahman.username ];
      };
  };
}
