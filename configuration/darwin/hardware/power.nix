{ ... }:
{
  # power settings
  power.sleep = {
    # Whether the power button can sleep the computer.
    allowSleepByPowerButton = true;
    # Amount of idle time (in minutes) until the computer sleeps.
    computer = 20;
    # Amount of idle time (in minutes) until displays sleep.
    display = 10;
    # Amount of idle time (in minutes) until hard disks sleep.
    harddisk = 30;
  };
}