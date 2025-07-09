{ ... }:
{
  
  structure = "aarch64-darwin";
  hostname = "HUAWEI-MateBook-Fold";

  configuration = { ... } : {
    imports = [
      ./../../configuration/darwin/hardware/power.nix
      ./../../configuration/darwin/hardware/trackpad.nix
      ./../../configuration/darwin/hardware/keyboard.nix
      ./../../configuration/darwin/hardware/mouse.nix

      ./../../configuration/darwin/system/preferences.nix
      ./../../configuration/darwin/pkgs/apps.nix
      ./../../configuration/darwin/pkgs/font.nix
      ./../../configuration/darwin/system/env.nix

      ./../../configuration/darwin/gui/activitymonitor.nix
      ./../../configuration/darwin/gui/controlcenter.nix
      ./../../configuration/darwin/gui/dock.nix
      ./../../configuration/darwin/gui/finder.nix
      ./../../configuration/darwin/gui/windowmanager.nix

      ./../../configuration/darwin/pkgs/homebrew.nix
      ./../../configuration/darwin/system/hook.nix

      ./../../configuration/darwin/service/aerospace.nix
      ./../../configuration/darwin/service/jankyborders.nix
      ./../../configuration/darwin/service/sketchybar.nix


      # This Machine's special configuration
      {
        # set up for touch ID
        security.pam.services.sudo_local = {
        # This fixes Touch ID for sudo not working inside tmux and screen.
        reattach = true;
        # Whether to enable Touch ID with sudo.
        touchIdAuth = true;
        };
        # Text to be shown on the login window. Default is “\\U03bb”.
        system.defaults.loginwindow.LoginwindowText = "Hello nixer~ 😭👌";
      }
    ];
  };
}