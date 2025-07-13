{ pkgs, ... }:
{
  services.sketchybar = {
    enable = true;
    package = pkgs.sketchybar;
    config = ''
source $HOME/.config/sketchybar/sketchybarrc
    '';
  };
}
