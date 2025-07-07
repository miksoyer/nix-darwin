{ pkgs, ... }:
{
  # Whether to autohide the menu bar. The default is false buf must true for sketchybar
  system.defaults.NSGlobalDomain._HIHideMenuBar = true;
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