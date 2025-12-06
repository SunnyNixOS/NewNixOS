{ config, pkgs, lib, flakeroot, de, ... }:

let
  deModule =
    if de == "gnome" then flakeroot + "/users/jaime/de/gnome.nix"
    else if de == "kde" then flakeroot + "/users/jaime/de/kde.nix"
    else if de == "hyprland" then flakeroot + "/users/jaime/de/hyprland.nix"
    else throw "Unknown Desktop Environment: ${de}";
in {
  imports =
    [
    deModule
    ./git.nix
    ./defaults.nix
    "${flakeroot}/home/wrappers/gnucash.nix"
    "${flakeroot}/programs/home.nix"
    "${flakeroot}/modules/stylix/home.nix"
    "${flakeroot}/modules/yazi/yazi-home.nix"
    ];
  
  programs.home-manager.enable = true;

  home = {
    username = "jaime";
    homeDirectory = "/home/jaime";
    stateVersion = "25.05"; # Please do research before changing
  };
}
