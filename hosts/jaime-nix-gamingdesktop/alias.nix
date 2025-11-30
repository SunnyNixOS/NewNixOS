{ pkgs, lib, config, ... }:
{

    environment.shellAliases = {
        reb = "sudo nixos-rebuild switch --flake /home/jaime/.dotfiles#jaime-nix-gamingdesktop";
        dot = "cd /home/jaime/.dotfiles";
    };

}