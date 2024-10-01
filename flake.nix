{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    dotfiles.url = "github:Rasmus-Bertell/dotfiles";
  };

  outputs = { self, nixpkgs, home-manager, dotfiles, ... }@inputs: {
    nixosConfigurations = {
      virvatuli = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./config.nix
          ./hosts/virvatuli/config.nix
          home-manager.nixosModules.default
          dotfiles.home.nix
        ];
      };
    };
  };
}
