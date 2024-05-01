# NixOS workstation i3 configs

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

# Define i3 monitor names
let
  DP-0 = "DisplayPort-0";
  DP-1 = "DisplayPort-1";
in

{

  xsession.windowManager.i3 = {
    config = {
      # bind workspaces to monitors
      workspaceOutputAssign = [
        { output = "${DP-1}"; workspace = "${ws1}"; }
        { output = "${DP-0}"; workspace = "${ws2}"; }
        { output = "${DP-0}"; workspace = "${ws3}"; }
        { output = "${DP-0}"; workspace = "${ws4}"; }
        { output = "${DP-0}"; workspace = "${ws5}"; }
        { output = "${DP-0}"; workspace = "${ws6}"; }
        { output = "${DP-0}"; workspace = "${ws7}"; }
        { output = "${DP-0}"; workspace = "${ws8}"; } 
      ];
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
        sleep 1
        xrandr --output DisplayPort-0 --primary --mode 3440x1440 --rate 165.00 --output DisplayPort-1 --mode 2560x1080 --rate 74.99 --above DisplayPort-0 &
        ~/.fehbg &
        dunst &
        playerctld daemon &
        lxsession &
        liquidctl initialize all &
        sleep 2
        liquidctl --match kraken set pump speed 100 &
        ~/repos/configs/Scripts/yoda --match commander control sync with "(40,40),(50,45),(55,50),(60,60),(65,70),(70,80),(80,90),(85,100)" on k10temp.tctl &
        xset s off -dpms &
        nm-applet &
        openrgb &
      '';
    };
  };
}
