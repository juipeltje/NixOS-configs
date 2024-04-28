# NixOS laptop home-manager config

{ config, pkgs, ... }:

{
  # Packages to install in the user environment
  home-manager.users.joppe = { pkgs, ... }: {
    home.packages = [ ];
    imports = [
      ./../../common/home/alacritty.nix
      ./bash.nix
      ./../../common/home/dunst.nix
      ./../../common/home/git.nix
      #./hypr.nix
      #./i3.nix
      ./../../common/home/mako.nix
      ./../../common/home/mpv.nix
      #./polybar.nix
      #./qtile.nix
      ./../../common/home/rofi.nix
      #./swayfx.nix
      ./../../common/home/theming.nix
      #./waybar.nix
      ./../../common/home/wofi.nix
      ./../../common/home/xinitrc.nix
      ./../../common/home/yazi.nix
    ];

    # The state version is required and should stay at the version you
    # originally installed.
    home.stateVersion = "23.11";
  };
}
