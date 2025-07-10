{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.sketchybar
    pkgs.sketchybar-app-font
  ];
  services.sketchybar = {
    enable = false;
    package = pkgs.sketchybar;
    config = ''
source $HOME/.config/sketchybar/sketchybarrc
    '';
  };
}