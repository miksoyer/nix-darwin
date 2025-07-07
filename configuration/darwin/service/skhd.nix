{ pkgs, ... }:
{
  services.skhd = {
    enable = true;
    packages = pkgs.skhd;

    skhdConfig = "
      
    ";
  };
}