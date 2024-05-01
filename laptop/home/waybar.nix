# NixOS laptop Waybar configs

{ config, pkgs, ... }:

{

  # Hyprland waybar configs
  xdg.configFile = {
    "waybar/hyprland-config" = {
      enable = true;
      source = ./waybar/hyprland-config;
    };

    "waybar/hyprland-nordic-config" = {
      enable = true;
      source = ./waybar/hyprland-nordic-config;
    };

    # Hyprland waybar styles
    "waybar/hyprland-style-gruvbox.css" = {
      enable = true;
      source = ./waybar/hyprland-style-gruvbox.css;
    };

    "waybar/hyprland-style-nordic.css" = {
      enable = true;
      source = ./waybar/hyprland-style-nordic.css;
    };

    "waybar/hyprland-style.css" = {
      enable = true;
      source = ./waybar/hyprland-style.css;
    };

    # Sway waybar configs
    "waybar/sway-config" = {
      enable = true;
      source = ./waybar/sway-config;
    };

    "waybar/sway-nordic-config" = {
      enable = true;
      source = ./waybar/sway-nordic-config;
    };

    # Sway waybar styles
    "waybar/sway-style-gruvbox.css" = {
      enable = true;
      source = ./waybar/sway-style-gruvbox.css;
    };

    "waybar/sway-style-nordic.css" = {
      enable = true;
      source = ./waybar/sway-style-nordic.css;
    };

    "waybar/sway-style.css" = {
      enable = true;
      source = ./waybar/sway-style.css;
    };

    # Waybar scripts for widgets
    # CPU temperature
    "waybar/cpu-temp.sh" = {
      enable = true;
      executable = true;
      text = ''
        #!/usr/bin/env bash

        sensors k10temp-pci-00c3 | awk '/Tctl/ {print $2}' | sed 's/+/ /'
      '';
    };

    # GPU temperature
    "waybar/gpu-temp.sh" = {
      enable = true;
      executable = true;
      text = ''
        #!/usr/bin/env bash

        sensors | awk '/edge/ {print $2}' | sed 's/+/ /'
      '';
    };

    # Memory usage
    "waybar/memory.sh" = {
      enable = true;
      executable = true;
      text = ''
        #!/usr/bin/env bash

        free --mega | awk '/Mem/ {print$3" "$2}' | sed 's/ /\//' | sed 's/$/ MB/'
      '';
    };
  };
}
