{ ... }:
{
  system.defaults.trackpad = {
    ActuationStrength = 1;              # 0 to enable Silent Clicking, 1 to disable. The default is 1.
    Clicking = true;                    # Whether to enable trackpad tap to click. The default is false.
    Dragging = true;                    # Whether to enable tap-to-drag.
    FirstClickThreshold = 0;            # For normal click: 0 for light clicking, 1 for medium, 2 for firm.
    SecondClickThreshold = 0;           # For force touch: 0 for light clicking, 1 for medium, 2 for firm. The default is 1.
    TrackpadRightClick = true;         # Whether to enable trackpad right click. default = false
    TrackpadThreeFingerDrag = true;     # Whether to enable three finger drag.
    TrackpadThreeFingerTapGesture = 0;  # 0 to disable three finger tap, 2 to trigger Look up & data detectors. The default is 2.
  };


  system.defaults.NSGlobalDomain = {
    "com.apple.swipescrolldirection" = true;            # Whether to enable “Natural” scrolling direction. 
    "com.apple.trackpad.enableSecondaryClick" = true;   # trackpad secondary click
    "com.apple.trackpad.forceClick" = true;
    "com.apple.trackpad.scaling" = 2.0;                 # Configures the trackpad tracking speed (0 to 3).
    NSWindowShouldDragOnGesture = true;                   # Enable moving window by holding anywhere on it like on Linux.
  };
}