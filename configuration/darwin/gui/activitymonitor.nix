{ ... }:
{
  system.defaults.ActivityMonitor = {
    # 0: Application Icon, 2: Network Usage, 3: Disk Activity, 5: CPU Usage, 6: CPU History , Default is null.
    IconType = 5;
    # Open the main window when opening Activity Monitor.
    OpenMainWindow = false;
    # 100: All Processes        101: All Processes, Hierarchally,
    # 102: My Processes         103: System Processes
    # 104: Other User Processes 105: Active Processes
    # 106: Inactive Processes   107: Windowed Processes
    ShowCategory = 100;
    # Which column to sort the main activity page (such as “CPUUsage”)
    SortColumn = "MemoryUsage";
    
  };
}