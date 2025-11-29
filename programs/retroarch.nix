{ pkgs, ... }:

let
  retroarchWithCores = (
    pkgs.retroarch.withCores (
      cores: with cores; [
        dolphin
        mgba
        melonds
        mupen64plus
        citra
      ]
    )
  );
in
{
  environment.systemPackages = [ retroarchWithCores ];
}