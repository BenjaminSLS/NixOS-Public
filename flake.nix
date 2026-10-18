{
  description = "NixOS-Green - Public NixOS System Flake";

  inputs = {
    # The nixos version(s) I am currently using.
    nixpkgsUnstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";

    # The current stable home manager.
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Private information
    private = {
      url = "git+ssh://git@github.com/BenjaminSLS/redmont-private.git";
      flake = false;
    };
  };

  outputs = {self, nixpkgs, nixpkgsUnstable, home-manager, private, ...}@inputs:

  let
    personal = import "${private}/personal.nix";
    hostname = personal.hostname;
    username = personal.username;
    system = "x86_64-linux";
    pkgsUnstable = nixpkgsUnstable.legacyPackages.${system};
    pkgs = nixpkgs.legacyPackages.${system}; 

  in {    
    nixosConfigurations.${hostname} = nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = {
        inherit pkgsUnstable username hostname private personal;
      };
      modules = [
        # System configuration.
        ./system/configuration.nix

        # Home manager configuration.
        home-manager.nixosModules.home-manager {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users = {
              "${username}" = import ./users/super/home.nix;
            };
            extraSpecialArgs = {
              inherit hostname username pkgsUnstable private personal;
            };
            backupFileExtension = "backup";
          };
        }
      ];
    };
  };
}
