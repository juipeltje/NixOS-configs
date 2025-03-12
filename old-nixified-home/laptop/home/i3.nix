# NixOS laptop i3 configs

{ config, pkgs, ... }:

# i3 config variables
let
  mod = "Mod4";
  terminal = "alacritty";
  file_manager = "pcmanfm";
  webbrowser = "firefox";
in

# Define i3 workspace names
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

  xsession.windowManager.i3 = {
    config = {
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
    };
  };

  # Autostart script
  xdg.configFile = {
    "i3/autostart.sh" = {
      enable = true;
      executable = true;
      text = ''
        #!/usr/bin/env bash

        autotiling --splitratio 1.61 --limit 2 &
        ~/.fehbg &
        dunst &
        playerctld daemon &
        lxsession &
        xset s off -dpms &
        nm-applet &
      '';
    };
  };
}
