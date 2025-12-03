{ config, pkgs, lib, stylix, theme, ... }:
{
  stylix.autoEnable = true;
  stylix.targets.neovim.enable = false;


  programs.vesktop = {
    enable = true;
    vencord.themes = {
      "catppuccin-mocha.css" = ''
        @import url("https://catppuccin.github.io/discord/dist/catppuccin-mocha.theme.css");
      '';
    };

    vencord.settings = {
      enabledThemes = [ "catppuccin-mocha.css" ];
    };
  };
}

