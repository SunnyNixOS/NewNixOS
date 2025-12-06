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
      "xrandr --output DP-3 --primary"
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
      "ALT, y, movetoworkspacesilent, r-1"
      "ALT, y, workspace, r-1"

      # send window to right workspace and follow
      "ALT, o, movetoworkspacesilent, r+1"
      "ALT, o, workspace, r+1"

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

    windowrulev2 = [
      "float, class:com.gabm.satty"
      "center, class:com.gabm.satty"
      "size 900 900, class:com.gabm.satty"
      ];

    source = ''
          ~/.config/hypr/monitors.conf
          '';
       };
    };
}
