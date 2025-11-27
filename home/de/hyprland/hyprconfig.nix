  { config, pkgs, lib, ... }:
  {



  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;

  settings = {
    # Mod keys
    "$mainMod" = "SUPER";
    "$terminal" = "kitty";
    "$filemanager" = "nautilus";

    exec-once = [
      "hyprpanel"

    ];

    monitor = [
      # use a program to distinguish monitors.
      "HDMI-A-1,1920x1080@120.0,5760x102,1.0,transform,1,bitdepth,8" # portrait monitor
      "DP-2,1920x1080@143.98,1920x685,1.0,bitdepth,8"                # left monitor
      "DP-3,1920x1080@143.98,3840x685,1.0,bitdepth,8"                # main monitor
    ];

    # Keybindings
    bind = [
      "$mainMod, Return, exec, $terminal"        # Open terminal
      "$mainMod, C, killactive"                  # Close focused window
      "$mainMod, M, exit"                        # Exit Hyprland
      "$mainMod, Space, exec, rofi -show drun"   # Rofi launcher 
      "$mainMod, F, fullscreen, 1"               # Fullscreen Window
      "$mainMod, E, exec, $filemanager"          # Open file manager
      "SHIFT, PRINT, exec, bash -c 'hyprshot -m region --raw | satty --filename - --fullscreen'"        # Take a screenshot of a window interactively
      ", PRINT, exec, hyprshot -m region -o clipboard"     # Take a normal screenshot (no editing)
      "$mainMod, PRINT, exec, hyprshot -m window -o clipboard" # Take a screenshot of active window

      ### Vim Bindings for Window Switching ###
      "$mainMod, h, movefocus, l"
      "$mainMod, j, movefocus, d"
      "$mainMod, k, movefocus, u"
      "$mainMod, l, movefocus, r"
      ##########################################


      # move left and right workspaces with vim bindings
      "ALT, h, workspace, r-1"
      "ALT, l, workspace, r+1"

      # send window to left workspace and follow
      "$mainMod, y, movetoworkspacesilent, r-1"
      "$mainMod, y, workspace, r-1"

      # send window to right workspace and follow
      "$mainMod, o, movetoworkspacesilent, r+1"
      "$mainMod, o, workspace, r+1"

    ];
    bindm = [
    "$mainMod, mouse:272, movewindow"
    # optionally:
    "$mainMod, mouse:273, resizewindow"
    ];
    bindle = [
      ", XF86AudioRaiseVolume, exec, vol --up"
      ", XF86AudioLowerVolume, exec, vol --down"
    ];

    bindl = [
      ", XF86AudioPlay, exec, playerctl play-pause" # the stupid key is called play , but it toggles
    ];
       };
    };
}
