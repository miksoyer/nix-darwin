{ ... }:
{
  system.defaults = {
    LaunchServices.LSQuarantine = false; # Whether to enable quarantine for downloaded applications
    menuExtraClock.ShowDate = 1; # Show the full date. 0 = When space allows 1 = Always 2 = Never

    controlcenter = {
      BatteryShowPercentage = true; # Show a battery percentage in menu bar
      AirDrop = false; # Show AirDrop in menu bar.
      Sound = true; # Show a sound control in menu bar
      Bluetooth = true; # Show a bluetooth control in menu bar.
      Display = true; # Show a Screen Brightness control in menu bar.
      FocusModes = false; # Show a Focus control in menu bar.
      NowPlaying = false; # Show a Now Playing control in menu bar.
    };

    dock = {
      wvous-bl-corner = 11; # Launchpad
      wvous-br-corner = 4; # show Desktop
      wvous-tl-corner = 3; # Application Windows
      wvous-tr-corner = 2; # Misson Controller
    };
  };
}
