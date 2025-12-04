{ config, pkgs, lib, ... }:
# This module is imported into home manager
{
  # Git configuration to push to Github repo
  programs.git = {
    enable = true;
    settings = {
      user.name = "Sunny";
      user.email = "sun+nxisoftgithub@coinblock25.com";
      init.defaultBranch = "main";
    };
  };
}
