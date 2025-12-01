{pkgs, lib, config, ... }:
{
  virtualisation.docker.enable = true;
  users.users.jaime.extraGroups = [ "docker" ];

}
