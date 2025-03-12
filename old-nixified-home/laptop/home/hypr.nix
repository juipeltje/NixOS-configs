# NixOS Laptop-specific Hyprland configs

{ config, pkgs, ... }:

{

  wayland.windowManager.hyprland = {
    settings = {
      # Monitor settings
      monitor = [
        "eDP-1,1920x1080@60,0x0,1"
      ];

      # Input settings
      input = {
        touchpad = {
          tap-to-click = true;
        };
      };

      # Miscellaneous settings
      misc = {
        # VRR: 0 = off, 1 = on, 2 = fullscreen only
        vrr = 0;
      };

      # Keybindings
      bind = [
        # laptop volume controls
        ", XF86AudioMute, exec, pulsemixer --toggle-mute"
        ", XF86AudioLowerVolume, exec, pulsemixer --change-volume -5"
        ", XF86AudioRaiseVolume, exec, pulsemixer --change-volume +5"

        # laptop brightness controls
        ", XF86MonBrightnessDown, exec, brightnessctl s 10%-"
        ", XF86MonBrightnessUp, exec, brightnessctl s +10%"
      ];

      # bind workspaces to monitors
      workspace = [
        "1, monitor:eDP-1"
        "2, monitor:eDP-1"
        "3, monitor:eDP-1"
        "4, monitor:eDP-1"
        "5, monitor:eDP-1"
        "6, monitor:eDP-1"
        "7, monitor:eDP-1"
        "8, monitor:eDP-1"
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
        mako &
        playerctld daemon &
        lxsession &
        nm-applet &
        alsactl --file ~/.config/asound.state restore &
      '';
    };

    # Hyprpaper
    "hypr/hyprpaper.conf" = {
      enable = true;
      text = ''
        preload = /home/joppe/Pictures/wallpapers/games/gravity-rush-2.png
        wallpaper = eDP-1,/home/joppe/Pictures/wallpapers/games/gravity-rush-2.png
      '';
    };
  };
}
