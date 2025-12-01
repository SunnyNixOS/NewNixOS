{ config, lib, pkgs, ... }:
# This module is imported into configuration.nix main file
{
  # Look up the NixOS Package Search Repository to add packages down below to add them on the system
  environment.systemPackages = with pkgs; [
  
     ollama-cuda
  ];

}
