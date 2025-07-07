{ ... }:
{
    system.defaults = {

      # Don't automatically install Mac OS software updates.
      SoftwareUpdate.AutomaticallyInstallMacOSUpdates = false;


      # mouse tracking speed
      ".GlobalPreferences"."com.apple.mouse.scaling" = 1.0;

      
      WindowManager = {
        GloballyEnabled = false;                     # Enable Stage Manager Stage Manager arranges your recent windows into a single strip for reduced clutter and quick access
        HideDesktop = false;
        StageManagerHideWidgets = false;
        StandardHideDesktopIcons = false;
        StandardHideWidgets = false;
        EnableStandardClickToShowDesktop = false;   # false means “Only in Stage Manager” true means “Always”
        AppWindowGroupingBehavior = true;            # Grouping strategy when showing windows from an application
        AutoHide = false;                           # Auto hide stage strip showing recent apps.
        EnableTiledWindowMargins = true;            # Enable window margins when tiling windows.
        EnableTilingByEdgeDrag = true;              # Enable dragging windows to screen edges to tile them
        EnableTilingOptionAccelerator = true;       # Enable holding alt to tile windows. 
        EnableTopTilingByEdgeDrag = true;           # Enable dragging windows to the menu bar to fill the screen. 
      };

      loginwindow.GuestEnabled = false;

      CustomSystemPreferences = {
        "com.apple.Safari" = {
          "com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled" = true;
          };
      };

      NSGlobalDomain = {
        # sound 
        "com.apple.sound.beep.feedback" = 1;                  # Make a feedback sound when the system volume changed. 0 or 1 ,default = 1
        "com.apple.sound.beep.volume" = 1.000;
        AppleInterfaceStyleSwitchesAutomatically = true;      # Whether to automatically switch between light and dark mode
        AppleScrollerPagingBehavior = true;                   # Jump to the spot that’s clicked on the scroll bar
        AppleShowAllExtensions = true;                        # Whether to show all file extensions in Finder
        AppleShowScrollBars = "Always";                       # When to show the scrollbars.(Automatic)
        ApplePressAndHoldEnabled = false;                     # Whether to enable the press-and-hold feature. 
        
        NSAutomaticSpellingCorrectionEnabled = false;         # Whether to enable automatic spelling correction.
        NSNavPanelExpandedStateForSaveMode = true;            # Whether to use expanded save panel by default.
        NSNavPanelExpandedStateForSaveMode2 = true;
        PMPrintingExpandedStateForPrint = true;               # Whether to use the expanded print panel by default
        PMPrintingExpandedStateForPrint2 = true;
        NSDocumentSaveNewDocumentsToCloud = false;            # Whether to save new documents to iCloud by default. 
        "com.apple.mouse.tapBehavior" = 1;                    
        
      };
    };
}