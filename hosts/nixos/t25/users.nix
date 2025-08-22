{ pkgs, username, ... }:
{
  users.users.${username} = {
    description = "Abdurrahman Hussain";
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    shell = pkgs.fish;
  };
}
