{ ... }:
{
  # Whether to enable application firewall.
  # networking.applicationFirewall.enable = true;               
  # Whether to enable stealth mode.
  networking.applicationFirewall.enableStealthMode = false;     
  # Whether to enable built-in software to receive incoming connections.
  networking.applicationFirewall.allowSigned = true;   
  # Whether to enable downloaded signed software to receive incoming connections.         
  networking.applicationFirewall.allowSignedApp = true;
  # Whether to enable blocking all incoming connections.
  networking.applicationFirewall.blockAllIncoming = false;
  # scutil --set ComputerName
  # networking.computerName = "HUAWEI-MateBook-Fold";
  
}