{ pkgs, ... }:
{
  environment.systemPackages = [
    #pkgs.sketchybar
    pkgs.sketchybar-app-font
  ];
  services.sketchybar = {
    enable = true;
    enable = false;
    package = pkgs.sketchybar;
    config = ''
source $HOME/.config/sketchybar/sketchybarrc
    '';
  };
}
