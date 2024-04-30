# NixOS laptop Qtile configs

{ config, pkgs, ... }:

{

  xdg.configFile = {
    "qtile/config.py" = {
      enable = true;
      source = ./qtile/config.py;
    };

    "qtile/autostart.sh" = {
      enable = true;
      executable = true;
      text = ''
        #!/usr/bin/env bash

        ~/.fehbg &
        #picom &
        dunst &
        playerctld daemon &
        lxsession &
        xset s off -dpms &
        nm-applet &
      '';
    };
  };
}
