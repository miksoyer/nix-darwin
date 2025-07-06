{ pkgs, nixpkgs_stable, structure, ... }:
{
  environment = {
    systemPackages = [
      # GUI software
      pkgs.wezterm
      pkgs.obsidian
      pkgs.vscode
      pkgs.google-chrome
      pkgs.iina
      pkgs.flameshot
      pkgs.aerospace

      # CLI tools
      pkgs.neovim
      pkgs.helix
      pkgs.fastfetch
      pkgs.starship
      pkgs.yazi
      pkgs.git
      pkgs.lazygit
      pkgs.jujutsu
      pkgs.lazyjj
      pkgs.fzf
      pkgs.zoxide
      pkgs.fd
      pkgs.ripgrep
      pkgs.bat
      pkgs.eza
      pkgs.tlrc
      pkgs.jq
      pkgs.wget
      pkgs.ffmpeg
      pkgs.poppler
      # nix
      pkgs.devenv
      pkgs.direnv


      # stable
      # nixpkgs_stable.legacyPackages.${structure}.aerospace
    ];

  };
}