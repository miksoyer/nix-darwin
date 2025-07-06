{ inputs, config, pkgs, ... }:
let 
  myname = "makabaka";
in
{
  # You can update Home Manager without changing this value. 
  # See the Home Manager release notes for a list of state version changes in each release.
  home.stateVersion = "25.05";
  #home.username = "${myname}"; # must should be equal with your delcare in flake.nix
  #home.homeDirectory = "/Users/miksoyer";

  #home-manager.users.jdoe = ./home.nix;

  home.packages = [
  ];
  
  home.file = {
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}