  { config, pkgs, ... }:
  {

  xdg.portal = {
    extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
  };

  programs.hyprland = {
    enable = true;
    withUWSM = true; # recommended for most users
    xwayland.enable = true; # Xwayland can be disabled.

  };
  services = {
    displayManager.sddm.enable = true;
    displayManager.sddm.wayland.enable = true;
    xserver.enable = false; # Disables X11 completely
};

  hardware.bluetooth = {
  enable = true;
  powerOnBoot = true;
  settings = {
    General = {
      # Shows battery charge of connected devices on supported
      # Bluetooth adapters. Defaults to 'false'.
      Experimental = true;
      # When enabled other devices can connect faster to us, however
      # the tradeoff is increased power consumption. Defaults to
      # 'false'.
      FastConnectable = true;
    };
    Policy = {
      # Enable all controllers when they are found. This includes
      # adapters present on start as well as adapters that are plugged
      # in later on. Defaults to 'true'.
      AutoEnable = true;
    };
  };
};

# fixing bluetooth disconnects
hardware.xpadneo.enable = true;
boot.kernelParams = [
  "bluetooth.disable_ertm=1"
  "usbcore.autosuspend=-1"
];


environment.systemPackages = with pkgs;
  [
    playerctl
    brightnessctl
    jq
    nwg-displays
    hyprshot
    nemo
    satty
    rofi-wayland
    blueman
    hyprsunset
    hyprpaper
  ];
  }
