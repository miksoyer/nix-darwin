{ pkgs, ... }:
{
  environment.systemPackages = [
    #pkgs.sketchybar
    pkgs.sketchybar-app-font
  ];
  services.sketchybar = {
    enable = true;
    package = pkgs.sketchybar;
    config = ''
#!/bin/sh
source $HOME/.config/sketchybar/sketchybarrc
    '';
  };
}
