{ pkgs, lib, config, ... }:
{

    environment.shellAliases = {
        reb = "sudo nixos-rebuild switch --flake /home/jaime/.dotfiles#jaime-nix-gamingdesktop";
        dot = "cd /home/jaime/.dotfiles";
        cheat = "nvim /home/jaime/.dotfiles/manual/cheat";
    };

}
