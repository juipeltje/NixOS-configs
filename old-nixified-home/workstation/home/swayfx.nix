# NixOS workstation SwayFX configs

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
        DP-1 = {
          resolution = "3440x1440@164.999Hz";
          position = "0,1080";
          adaptive_sync = "off";
        };

        DP-2 = {
          resolution = "2560x1080@74.991Hz";
          position = "0,0";
        };
      };

      # Keybindings
      keybindings = {
        # enable/disable adaptive sync with keybinds
        "${mod}+Control+a" = "exec sway output DP-1 adaptive_sync on";
        "${mod}+Control+v" = "exec sway output DP-1 adaptive_sync off";
      };

      # bind workspaces to monitors
      workspaceOutputAssign = [
        { output = "DP-1"; workspace = "${ws1}"; }
        { output = "DP-1"; workspace = "${ws2}"; }
        { output = "DP-1"; workspace = "${ws3}"; }
        { output = "DP-1"; workspace = "${ws4}"; }
        { output = "DP-1"; workspace = "${ws5}"; }
        { output = "DP-1"; workspace = "${ws6}"; }
        { output = "DP-1"; workspace = "${ws7}"; }
        { output = "DP-2"; workspace = "${ws8}"; }
      ];
    };
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
  };
}
