{ ... }:
{
  # Keyboard
  system.keyboard = {
    enableKeyMapping = true;
    remapCapsLockToEscape = false;
  };
  system.defaults = {
    # 0 = Disabled 2 = Enabled on Sonoma or later 3 = Enabled on older macOS versions
    NSGlobalDomain.AppleKeyboardUIMode = 2;   # Configures the keyboard control behavior. 
  };


  # Chooses what happens when you press the Fn key on the keyboard. A restart is required for this setting to take effect.
  # null or one of “Do Nothing”, “Change Input Source”, “Show Emoji & Symbols”, “Start Dictation”
  system.defaults.hitoolbox.AppleFnUsageType = null;   


  system.defaults.NSGlobalDomain = {
    InitialKeyRepeat = 15;                                # This sets how long you must hold down the key before it starts repeating.
    KeyRepeat = 3;                                        # This sets how fast it repeats once it starts.
    # Whether to enable smart period substitution.
    NSAutomaticPeriodSubstitutionEnabled = false;
  };
}