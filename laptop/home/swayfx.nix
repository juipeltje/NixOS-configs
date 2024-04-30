# NixOS laptop SwayFX configs

{ config, pkgs, ... }:

# SwayFX config variables
let
  mod = "Mod4";
  terminal = "alacritty";
  file_manager = "pcmanfm";
  webbrowser = "firefox";
in 

# Define SwayFX workspace names
let
  ws1 = "1";
  ws2 = "2";
  ws3 = "3";
  ws4 = "4";
  ws5 = "5";
  ws6 = "6";
  ws7 = "7";
  ws8 = "8";
in

{

  wayland.windowManager.sway = {
    config = {
      # Output settings (wallpaper/monitors)
      output = {
        eDP-1 = {
          resolution = "1920x1080@60.001Hz";
          position = "0,0";
        };
      };

      input = {
        "1267:12608:MSFT0001:00_04F3:3140_Touchpad" = {
          tap = "enabled";
        };
      };

      # Keybindings
      keybindings = {
        # laptop volume controls
        "XF86AudioMute" = "exec pulsemixer --toggle-mute";
        "XF86AudioLowerVolume" = "exec pulsemixer --change-volume -5";
        "XF86AudioRaiseVolume" = "exec pulsemixer --change-volume +5";

        # laptop brightness controls
        "XF86MonBrightnessDown" = "exec brightnessctl s 10%-";
        "XF86MonBrightnessUp" = "exec brightnessctl s +10%";
      };

      # bind workspaces to monitors
      workspaceOutputAssign = [
        { output = "eDP-1"; workspace = "${ws1}"; }
        { output = "eDP-1"; workspace = "${ws2}"; }
        { output = "eDP-1"; workspace = "${ws3}"; }
        { output = "eDP-1"; workspace = "${ws4}"; }
        { output = "eDP-1"; workspace = "${ws5}"; }
        { output = "eDP-1"; workspace = "${ws6}"; }
        { output = "eDP-1"; workspace = "${ws7}"; }
        { output = "eDP-1"; workspace = "${ws8}"; }
      ];
  };

  # Autostart script
  xdg.configFile = {
    "sway/autostart.sh" = {
      enable = true;
      executable = true;
      text = ''
        #!/usr/bin/env bash

        autotiling --splitratio 1.61 --limit 2 &
        waybar -c ~/.config/waybar/sway-config -s ~/.config/waybar/sway-style.css &
        mako &
        playerctld daemon &
        lxsession &
        nm-applet &
        alsactl --file ~/.config/asound.state restore &
      '';
    };
  };
}
