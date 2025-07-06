{ ... }:
{
    system.defaults = {
      # mouse tracking speed
      ".GlobalPreferences"."com.apple.mouse.scaling" = 1.0;

      # This is neccessary for yabai
      WindowManager.EnableStandardClickToShowDesktop = false;   # false means “Only in Stage Manager” true means “Always”

      loginwindow.GuestEnabled = false;

      CustomSystemPreferences = {
        "com.apple.Safari" = {
          "com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled" = true;
          };
      };

      NSGlobalDomain = {
        AppleInterfaceStyleSwitchesAutomatically = true;      # Whether to automatically switch between light and dark mode
        AppleScrollerPagingBehavior = true;                   # Jump to the spot that’s clicked on the scroll bar
        AppleShowAllExtensions = true;                        # Whether to show all file extensions in Finder
        AppleShowScrollBars = "Always";                       # When to show the scrollbars.(Automatic)
        ApplePressAndHoldEnabled = false;                     # Whether to enable the press-and-hold feature. 
        InitialKeyRepeat = 15;                                # This sets how long you must hold down the key before it starts repeating.
        KeyRepeat = 3;                                        # This sets how fast it repeats once it starts.
        NSAutomaticSpellingCorrectionEnabled = false;         # Whether to enable automatic spelling correction.
        NSNavPanelExpandedStateForSaveMode = true;            # Whether to use expanded save panel by default.
        NSNavPanelExpandedStateForSaveMode2 = true;
        PMPrintingExpandedStateForPrint = true;               # Whether to use the expanded print panel by default
        PMPrintingExpandedStateForPrint2 = true;
        NSDocumentSaveNewDocumentsToCloud = false;            # Whether to save new documents to iCloud by default. 
        "com.apple.mouse.tapBehavior" = 1;                    
        NSWindowShouldDragOnGesture = true;                   # Enable moving window by holding anywhere on it like on Linux.
        "com.apple.trackpad.enableSecondaryClick" = true;     # trackpad secondary click
        "com.apple.trackpad.forceClick" = true;
        "com.apple.trackpad.scaling" = 2.0;
      };
    };
}