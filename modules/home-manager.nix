{
  pkgs,
  inputs,
  username,
  hmModules,
  ...
}:
{
  imports = [ hmModules.home-manager ];

  home-manager = {
    useGlobalPkgs = false;
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs; };
    users.${username} = {
      imports = [ ./home-manager ];
      home = {
        inherit username;
        stateVersion = "25.05";
        homeDirectory = if pkgs.stdenv.isLinux then "/home/${username}" else "/Users/${username}";
      };
    };
  };
}
