{ config, pkgs, lib, stylix, theme, ... }:
  {

    stylix = lib.mkMerge [
    (lib.mkIf (theme == "catppuccin-mocha") {
      enable = true;
      base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
      polarity = "dark";
    })
   ];

  }

