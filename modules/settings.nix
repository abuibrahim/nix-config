{ username, ... }:
{
  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    allowed-users = [ "${username}" ];
  };
}

