{ ... }:
{
  homebrew = {
    # getting started
    enable = true;
    
    brews = [
      # "sketchybar"
      # "borders"
      # "font-sf-pro"
      "node"
      "llvm"
      "lld"
      "mold"
    ];
    taps = [
      #"FelixKratz/formulae" #sketchybar borders
      # { name = "FelixKratz/formulae"; }
    ];

    # always upgrade casks listed in homebrew.casks regardless of whether it’s unversioned or it updates itself.
    # greedyCasks = true;
    casks = [
      # system software
      "wezterm"
      "obsidian"
      "visual-studio-code"
      "google-chrome"
      "iina"
      "chatgpt"
      "dockdoor"
      "keycastr"
      "font-sf-pro"
      "sf-symbols"
      "parallels"
      "mumuplayer"
      # "hammerspoon"


      # personal software
      "qq"
      "wechat"
      "discord"
      "qqlive"
      "qqmusic"
      "lx-music"
      "raycast"
      "tencent-meeting"
      
      # dev tools
      "clion"
      "rustrover"
      "goland"
      "webstorm"
    ];
    masApps = {
      # "Amphetamine" = 937984704;
     # "State" = 1472818562;
     "我的壁纸" = 1552826194;
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
