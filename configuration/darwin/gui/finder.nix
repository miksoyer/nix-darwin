{ ... }:
{
  system.defaults.finder = {
    AppleShowAllExtensions = true;          # Whether to always show file extensions
    AppleShowAllFiles = false;              # Whether to always show hidden files
    CreateDesktop = true;                   # Whether to show icons on the desktop or not. The default is true.
    FXDefaultSearchScope = "SCcf";          # Change the default search scope. “SCcf” = current folder. unset (“This Mac”).
    FXEnableExtensionChangeWarning = false; # Whether to show warnings when change the file extension of files
    FXPreferredViewStyle = "Nlsv";          # “icnv” = Icon view, “Nlsv” = List view, “clmv” = Column View, “Flwv” = Gallery View
    FXRemoveOldTrashItems = true;           # Remove items in the trash after 30 days
    NewWindowTarget = "Home";               # “Computer”, “OS volume”, “Home”, “Desktop”, “Documents”, “Recents”, “iCloud Drive”, “Other”
    QuitMenuItem = true;                    # to allow quitting of the Finder
    ShowPathbar = true;                     # Show path breadcrumbs in finder windows.
    ShowStatusBar = true;                   # Show status bar at bottom of finder windows with item/disk space stats.
    _FXShowPosixPathInTitle = true;         # Whether to show the full POSIX filepath in the window title.
    _FXSortFoldersFirst = true;             # Keep folders on top when sorting by name
    _FXSortFoldersFirstOnDesktop = true;    # Keep folders on top when sorting by name on the desktop
  };
}