{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.sketchybar-app-font
  ];
  services.sketchybar = {
    enable = true;
    package = pkgs.sketchybar;
    config = ''
source $HOME/.config/sketchybar/sketchybarrc
    '';
  };
}
