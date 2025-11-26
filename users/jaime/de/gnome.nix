{ config, pkgs, lib, flakeroot, ... }:
# this is the central home manager file that configures the gnome desktop on the home manager level.
let
  gnome = "${flakeroot}/home/de/gnome";
in {
  imports =
    [
    "${flakeroot}/gnome.nix"
    ];

 }
