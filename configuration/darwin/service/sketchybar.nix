{ pkgs, ... }:
{
  services.sketchybar = {
    enable = true;
    package = pkgs.sketchybar;
    
    config = ''
      sketchybar --bar height=24
      sketchybar --update
      echo "sketchybar configuration loaded.."
    '';
    # Extra packages to add to PATH.
    extraPackages = [
      
    ];
  };
}