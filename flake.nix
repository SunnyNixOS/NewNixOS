{
  description = "Sunny's new NixOS flake for gaming";

  inputs = {

    # this is the main version of your system
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    
    # all these flake modules should follow your nixpkgs version
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";


      # inputs. follows didn't work so im commenting this line out
      #inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:nix-community/stylix/release-25.11";

      # look at home manager for comment
      #inputs.nixpkgs.follows = "nixpkgs";
    };

    nvf = { 
      #no 25.11 release at time of writing
      url = "github:NotAShelf/nvf/v0.8";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    # does not follow nixpkgs; check github for "tags" releases
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=v0.6.0";

    };


  outputs = { self, nixpkgs, home-manager, nix-flatpak, stylix, nvf, ... }:
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
            nvf.nixosModules.default
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
