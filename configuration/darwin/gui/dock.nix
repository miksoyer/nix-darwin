{ ... }:
{
  system.defaults.dock = {
    persistent-apps = [
      "/System/Applications/Launchpad.app"
      "/System/Applications/System Settings.app"
      "/System/Applications/App Store.app"
      "/Applications/QQMusic.app"
      "/Users/miksoyer/Applications/Home Manager Apps/WeChat.app"
      "/Users/miksoyer/Applications/Home Manager Apps/QQ.app"
      "/Applications/Nix Apps/Obsidian.app"
      "/Applications/Nix Apps/Google Chrome.app"
      "/Applications/Nix Apps/WezTerm.app"
      "/Applications/Nix Apps/Visual Studio Code.app"
      "/Users/miksoyer/Applications/Home Manager Apps/Clion.app"

    ];
    orientation = "bottom";                               # "left", "right", "bottom"
    static-only = false;                                   # Show apps only open

    enable-spring-load-actions-on-all-items = true;       # Enable spring loading for all Dock items
    appswitcher-all-displays = true;                      # show dock in every montors
    autohide = true;
    autohide-delay = 0.06;                                # Sets the speed of the autohide delay(0.24)
    autohide-time-modifier = 2.0;                         # Sets the speed of the animation when hiding/showing the Dock.(1.0)
    expose-animation-duration = 1.0;
    largesize = 80;                                       # Magnified icon size on hover. The default is 16.[16,128]
    tilesize = 50;
    magnification = true;                                 # Magnify icon on hover
    mineffect = "genie";                                   # one of (default)“genie”, “suck”, “scale”
    minimize-to-application = true;                       # open it, open it, open it!
    mouse-over-hilite-stack = true;
    scroll-to-open = true;                                # Scroll up on a Dock icon to show all Space’s opened windows for an app, or open stack
    show-recents = true;
    show-process-indicators = true;                       # Show indicator lights for open applications in the Dock
    

    # This is necessary for Yabai
    mru-spaces = false;                                   # automatically rearrange spaces based on most recent use
    showhidden = true;                                    # Whether to make icons of hidden applications tranclucent.
    slow-motion-allowed = true;                           # Allow for slow-motion minimize effect while holding Shift key.

    # corner-setting is in controlcenter.nix
  };
}