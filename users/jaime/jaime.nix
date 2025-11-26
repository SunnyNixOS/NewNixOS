{ config, pkgs, lib, ... }:
{
  # This file declares that jaime exists and is a user in configuration.nix
  users.users.jaime = {
    isNormalUser = true;
    description = "Jaime";
    extraGroups = [ "networkmanager" "wheel" ];
  };
}

