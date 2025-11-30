{ config, pkgs, lib, stylix, theme, ... }:
  {
    programs = {
        kitty = {
            enable = true;
        };
        vesktop.enable = true;
        vscode.enable = true;
        bash.enable = true;
    };

  }
