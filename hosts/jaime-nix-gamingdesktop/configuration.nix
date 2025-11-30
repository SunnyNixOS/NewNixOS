{ config, pkgs, lib, flakeroot, de, ... }:

let
   deModule =
    if de == "gnome" then flakeroot + "/modules/de/gnomede.nix"
    else if de == "kde" then flakeroot + "/modules/de/kdede.nix"
    else if de == "hyprland" then flakeroot + "/modules/de/hyprlandde.nix"
    else throw "Unknown Desktop Environment: ${de}";
in {
  imports =
    [
      ./hardware-configuration.nix
      ./gpu.nix
      ./filesystems.nix
      ./alias.nix
      "${flakeroot}/users/jaime/jaime.nix"
      "${flakeroot}/programs/main.nix"
      "${flakeroot}/programs/flatpaks.nix"
      "${flakeroot}/programs/retroarch.nix"
      deModule
      "${flakeroot}/modules/stylix/main.nix"
      "${flakeroot}/modules/nvf/main.nix"
    ];

  networking.hostName = "jaime-nix-gamingdesktop";

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # XDG Portal for Wayland
  xdg.portal.enable = true;

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Los_Angeles";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };
  
  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };
  
  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Enable Experimental NixOS Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];  
  system.stateVersion = "25.05"; 

}
