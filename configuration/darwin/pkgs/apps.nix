{ pkgs, nixpkgs_stable, structure, ... }:
{
  environment = {
    systemPackages = [
      # GUI software
      pkgs.wezterm
      pkgs.obsidian
      #pkgs.vscode # /nix/store is readonly, install in brew
      pkgs.google-chrome
      pkgs.iina
      pkgs.chatgpt
      pkgs.flameshot
      


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
      pkgs.yq-go
      pkgs.wget
      pkgs.curl
      pkgs.blueutil
      pkgs.ffmpeg
      pkgs.poppler
      # nix
      pkgs.devenv
      pkgs.direnv


      # stable
      #nixpkgs_stable.legacyPackages.${structure}.ghostty
    ];

  };
}