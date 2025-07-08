{ ... }:
{
  system.defaults.WindowManager = {
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
}