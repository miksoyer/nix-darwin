{ ... }:
{
  homebrew = {
    # getting started
    enable = true;
    
    brews = [
      # "sketchybar"
      # "borders"
      # "font-sf-pro"
      # "sf-symbols"
    ];
    taps = [
      #"FelixKratz/formulae" #sketchybar borders
      # { name = "FelixKratz/formulae"; }
    ];

    # always upgrade casks listed in homebrew.casks regardless of whether it’s unversioned or it updates itself.
    # greedyCasks = true;
    casks = [
      "qqlive"
      "qqmusic"
      "raycast"
    ];
    masApps = {
      # "Amphetamine" = 937984704;
    };

    # List of Docker images to install using whalebrew.
    # When this option is used, "whalebrew" is automatically added to homebrew.brews.
    # whalebrews = [ ];
    
    # Options for configuring the behavior of the brew bundle command that nix-darwin runs dur
    onActivation = {
      # Whether to enable Homebrew to auto-update itself and all formulae during nix-darwin system activation
      autoUpdate = true; 

      cleanup = "zap";      # one of “none”, “uninstall”, “zap”
      extraFlags = [
        "--verbose"
      ];
      # enable Homebrew to upgrade outdated formulae and Mac App Store apps during nix-darwin system activation
      upgrade = true;
    };

    global = {
      # enable Homebrew to auto-update itself and all formulae when you manually invoke commands
      autoUpdate = true;
      brewfile = true;  # enable Homebrew to automatically use the Brewfile that in the Nix store(readonly)
    };
  };
}