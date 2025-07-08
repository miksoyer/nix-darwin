{ pkgs, ... }:
{
  # Sets the level of font smoothing, Type: null or one of 0, 1, 2
  # system.defaults.NSGlobalDomain.AppleFontSmoothing = 2;

  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
    nerd-fonts.fira-mono
    nerd-fonts.hack
    nerd-fonts.jetbrains-mono
    maple-mono.NF-CN-unhinted         # Maple Mono NF CN (Ligature unhinted)
    maple-mono.Normal-NF-CN-unhinted  # normal version
    # "font-meslo-lg-nerd-font"
  ];
}