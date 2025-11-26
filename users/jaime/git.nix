{ config, pkgs, lib, ... }:
# This module is imported into home manager
{
  # Git configuration to push to Github repo
  programs.git = {
    enable = true;
    userName = "Sunny";
    userEmail = "sun+nxisoftgithub@coinblock25.com";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };
}
