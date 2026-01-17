{
  description = "Home Manager configuration of jcc";

  inputs = {
    # Stable Nixpkgs release (25.11)
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";

    # Unstable Nixpkgs for latest packages
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    # Home Manager
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      
      # Configure unstable pkgs to match the previous imperative setup
      unstable = import nixpkgs-unstable {
        inherit system;
        config.allowUnfree = true;
      };
    in {
      homeConfigurations."jcc" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        # Specify your home configuration modules here
        modules = [
          ./home.nix
        ];

        # Pass 'unstable' to home.nix
        extraSpecialArgs = {
          inherit unstable;
        };
      };
    };
}
