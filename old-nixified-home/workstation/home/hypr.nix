# NixOS workstation-specific Hyprland configs

{ config, pkgs, ... }:

{

  wayland.windowManager.hyprland = {
    settings = {
      # Monitor settings
      monitor = [
        "DP-1,3440x1440@165,0x1080,1"
        "DP-2,2560x1080@75,0x0,1"
      ];

      # Miscellaneous settings
      misc = {
        # VRR: 0 = off, 1 = on, 2 = fullscreen only
        vrr = 2;
      };
      
      # Workspace rules/bind workspaces to monitors
      workspace = [
        "1, monitor:DP-2"
        "2, monitor:DP-1"
        "3, monitor:DP-1"
        "4, monitor:DP-1"
        "5, monitor:DP-1"
        "6, monitor:DP-1"
        "7, monitor:DP-1"
        "8, monitor:DP-1"
      ];
    };
  };

  # Autostart script
  xdg.configFile = {
    "hypr/autostart.sh" = {
      enable = true;
      executable = true;
      text = ''
        #!/usr/bin/env bash

        hyprpaper &
        waybar -c ~/.config/waybar/hyprland-config -s ~/.config/waybar/hyprland-style.css &
        hyprctl setcursor phinger-cursors-light 24 &
        mako &
        playerctld daemon &
        lxsession &
        liquidctl initialize all &
        sleep 2
        liquidctl --match kraken set pump speed 100 &
        ~/repos/configs/Scripts/yoda --match commander control sync with "(40,40),(50,45),(55,50),(60,60),(65,70),(70,80),(80,90),(85,100)" on k10temp.tctl &
        nm-applet &
        openrgb &
        xrandr --output DP-1 --primary &
        alsactl --file ~/.config/asound.state restore &
      '';
    };

    # Hyprpaper
    "hypr/hyprpaper.conf" = {
      enable = true;
      text = ''
        preload = /home/joppe/Pictures/Wallpapers/hyprland/wall2.png
        wallpaper = DP-1,/home/joppe/Pictures/Wallpapers/hyprland/wall2.png
        wallpaper = DP-2,/home/joppe/Pictures/Wallpapers/hyprland/wall2.png
      '';
    };
  };
}
