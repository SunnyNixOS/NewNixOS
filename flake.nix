{
  description = "Sunny's new NixOS flake for gaming";

  inputs = {
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=v0.6.0";
    stylix.url = "github:danth/stylix/release-25.05";
  };

  outputs = { self, nixpkgs, home-manager, nix-flatpak, stylix, ... }:
    let
      system = "x86_64-linux";
      flakeroot = self;
      de = "hyprland";
      theme = "catppuccin-mocha";
    in {
      nixosConfigurations = {
        jaime-nix-gamingdesktop = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = {
            inherit flakeroot;
            inherit de;
            inherit theme;
          };
          modules = [
            ./hosts/jaime-nix-gamingdesktop/configuration.nix 
            nix-flatpak.nixosModules.nix-flatpak
            home-manager.nixosModules.home-manager
            stylix.nixosModules.stylix
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                backupFileExtension = "backup";
                users = {
                  jaime = ./users/jaime/home.nix;
                };
                extraSpecialArgs = {
                  inherit flakeroot;
                  inherit de;
                  inherit theme;
                };
              };
            }
          ];
        };
      };
    };
}
