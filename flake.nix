{
  description = "Abdurrahman's Nix configurations";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    darwin = {
      url = "github:nix-darwin/nix-darwin/nix-darwin-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    disko = {
      url = "github:nix-community/disko/latest";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    lanzaboote = {
      url = "github:nix-community/lanzaboote/v0.4.2";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim/nixos-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    catppuccin = {
      url = "github:catppuccin/nix/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      darwin,
      ...
    }@inputs:
    let
      username = "abdurrahman";
      nixosHosts = with builtins; attrNames (readDir ./hosts/nixos);
      darwinHosts = with builtins; attrNames (readDir ./hosts/darwin);
    in
    {
      nixosConfigurations = nixpkgs.lib.genAttrs nixosHosts (
        hostname:
        nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs username hostname; };
          modules = [
            ./hosts/nixos/${hostname}
            inputs.home-manager.nixosModules.default
            {
              home-manager = {
                useGlobalPkgs = false;
                useUserPackages = true;
                extraSpecialArgs = { inherit inputs username hostname; };
                users.${username} = {
                  imports = [ ./home ];
                  home = {
                    inherit username;
                    stateVersion = "25.05";
                    homeDirectory = "/home/${username}";
                  };
                };
              };
            }
          ];
        }
      );

      darwinConfigurations = nixpkgs.lib.genAttrs darwinHosts (
        hostname:
        darwin.lib.darwinSystem {
          system = "aarch64-darwin";
          specialArgs = { inherit inputs username hostname; };
          modules = [
            ./hosts/darwin/${hostname}
            inputs.home-manager.darwinModules.default
            {
              home-manager = {
                useGlobalPkgs = false;
                useUserPackages = true;
                extraSpecialArgs = { inherit inputs username hostname; };
                users.${username} = {
                  imports = [ ./home ];
                  home = {
                    inherit username;
                    stateVersion = "25.05";
                    homeDirectory = "/Users/${username}";
                  };
                };
              };
            }
          ];
        }
      );
    };
}
