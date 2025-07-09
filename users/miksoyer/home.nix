{
  inputs,
  config,
  pkgs,
  ...
}:
let
  myname = "miksoyer";
in
{
  # You can update Home Manager without changing this value.
  # See the Home Manager release notes for a list of state version changes in each release.
  home.stateVersion = "25.05";
  home.username = "${myname}"; # must should be equal with your delcare in flake.nix
  home.homeDirectory = "/Users/${myname}";


  home.packages = [
    # language server
    pkgs.superhtml
    pkgs.vscode-langservers-extracted
    pkgs.ansible-language-server
    pkgs.yaml-language-server
    pkgs.pyright
    pkgs.pkgs.python313Packages.python-lsp-server
    pkgs.python313Packages.jedi-language-server
    pkgs.ruff
    pkgs.nixfmt-rfc-style
    pkgs.golangci-lint-langserver
    pkgs.gopls
    pkgs.gotools
    pkgs.mkalias
    pkgs.stylua
    pkgs.shfmt
    pkgs.nil
    pkgs.biome
    pkgs.dockerfile-language-server-nodejs
    pkgs.docker-compose-language-service
    pkgs.lua-language-server
    pkgs.typescript
    pkgs.typescript-language-server
    # pkgs.tailwindcss-language-server
    pkgs.taplo

    # code
    pkgs.rustup
    pkgs.go
    pkgs.lua

    # dev tools
    pkgs.postman
    pkgs.jetbrains.clion
    pkgs.jetbrains.rust-rover
    pkgs.jetbrains.webstorm
    pkgs.jetbrains.goland

    # other pkgs
    pkgs.qq
    pkgs.wechat
    pkgs.discord
    pkgs.ollama
    # pkgs.qemu

    
    pkgs.sketchybar-app-font
    # pkgs.istat-menus # $96
  ];

  home.file = {
    ".zshrc".source = "/etc/nix-darwin/users/${myname}/.zshrc";
    ".config/fastfetch" = { source = "/etc/nix-darwin/users/${myname}/.config/fastfetch"; recursive = true; };
    ".config/bat" = { source = "/etc/nix-darwin/users/${myname}/.config/bat/"; recursive = true; };
    ".config/eza" = { source = "/etc/nix-darwin/users/${myname}/.config/eza/"; recursive = true;};
    ".config/starship" = { source = "/etc/nix-darwin/users/${myname}/.config/starship/"; recursive = true; };
    ".config/zsh" = { source = "/etc/nix-darwin/users/${myname}/.config/zsh/"; recursive = true;  };
    ".config/wezterm" = { source = "/etc/nix-darwin/users/${myname}/.config/wezterm/"; recursive = true; };
    ".config/yazi" = { source = "/etc/nix-darwin/users/${myname}/.config/yazi/"; recursive = true; };
    ".config/helix" = { source = "/etc/nix-darwin/users/${myname}/.config/helix/"; recursive = true; };
    ".config/sketchybar" = { source = "/etc/nix-darwin/users/${myname}/.config/sketchybar/"; recursive = true; };
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

}
