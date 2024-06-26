# NixOS workstation config

{ config, pkgs, ... }:

{
  imports =
    [ 
      # Bootloader settings
      ./../../common/system/bootloader.nix
      # Drive settings
      ./drives.nix
      # Environment variables
      ./../../common/system/environment.nix
      # Gaming
      ./../../common/system/gaming.nix
      # greeter settings
      ./greeter.nix
      # Include the results of the hardware scan.
      ./hardware-configuration.nix
      # Hostname
      ./hostname.nix
      # Locale settings
      ./../../common/system/locale.nix
      # Network settings
      ./../../common/system/network.nix
      # OpenRGB settings
      ./openrgb.nix
      # Packages
      ./../../common/system/packages.nix
      # Workstation-specific packages
      ./packages.nix
      # Single gpu passthrough settings
      ./single-gpu-passthrough.nix
      # Sound settings
      ./../../common/system/sound.nix
      # Swap settings
      ./swap.nix
      # User settings
      ./../../common/system/users.nix
      # Virtualisation settings
      ./virtualisation.nix
      # Wayland settings
      ./../../common/system/wayland.nix
      # X11 settings
      ./../../common/system/x11.nix
      # Workstation-specific X11 settings
      ./x11.nix
      # Import home-manager settings
      ./../home/home.nix
    ];

  # Enable flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

}
