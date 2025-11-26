{ config, pkgs, lib, flakeroot, ... }:
# this is the central home manager file that configures the hyprland desktop on the home manager level.
let 
  hypr = "${flakeroot}/home/de/hyprland";
  fonts = "${flakeroot}/home/fonts";
in {
  imports =
    [
    "${hypr}/hyprconfig.nix"   # main hyprland config
    "${hypr}/hyprpanel.nix"    # top bar config
    "${hypr}/hyprsunset.nix"   # blue light filter
    "${hypr}/rofi.nix"         # application launcher
    "${fonts}/nerdfonts.nix"   # nerdfonts packages
    ];

 }
