{ pkgs, lib, config, ... }:
{

    environment.shellAliases = {
        reb = "sudo nixos-rebuild switch --flake /home/jaime/.dotfiles#jaime-nix-gaminglaptop";
        dot = "cd /home/jaime/.dotfiles";
    };

}
