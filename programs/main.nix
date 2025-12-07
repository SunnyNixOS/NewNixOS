{ config, lib, pkgs, ... }:
# This module is imported into configuration.nix main file
{
  # Look up the NixOS Package Search Repository to add packages down below to add them on the system
  environment.systemPackages = with pkgs; [
     git
     upower
     wl-clipboard
     steam
     xivlauncher
     obsidian
     obs-studio
     audacity
     bitwarden-desktop
     gearlever
     prismlauncher
     mullvad-vpn
     gimp3
     dconf-editor
     anki
     gnome-tweaks
     whitesur-gtk-theme
     gnucash
     rclone
     flameshot
     streamcontroller
     qbittorrent
     brave
     protonup-qt
     lutris
     r2modman
     mangohud
     vulkan-tools
     neovim-unwrapped
     nixd
     vivaldi
     vivaldi-ffmpeg-codecs
     unzip
     p7zip
     parsec-bin
     clang-tools
     davinci-resolve-studio
     steam-run
  ];
  # Enable your installed stuff here
  services.mullvad-vpn.enable = true;
  programs.steam.enable = true;
  
  programs.gamescope = {
    enable = true;
    capSysNice = true;

  };
  # Write Chromium rules
  programs.chromium = {
    enable = true;
  # Automatically Install Extensions on all Chromium Browsers
    extensions = [
      "nngceckbapebfimnlniiiahkandclblb" # Bitwarden
      "cfhdojbkjhnklbpkdaibdccddilifddb" # Adblock Plus
      "gphhapmejobijbbhgpjhcjognlahblep" # GNOME Shell Integration
    ];
   };
}
