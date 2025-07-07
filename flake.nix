{
  description = "nix system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-25.05";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    nix-homebrew.url = "github:zhaofengli/nix-homebrew";
    homebrew-core = { url = "github:homebrew/homebrew-core"; flake = false; };
    homebrew-cask = { url = "github:homebrew/homebrew-cask"; flake = false; };
    homebrew-bundle = { url = "github:homebrew/homebrew-bundle"; flake = false; };
    #formulae = { url = "github:felixkratz/homebrew-formulae"; flake = false; };

    mac-app-util.url = "github:hraban/mac-app-util";  

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };
  outputs = { self, ... }@inputs:
    with inputs;
    let
      # This can also use the "unstable".
      stable_version = "25.05";
      builder = import ./builder { inherit inputs self stable_version; };
    in {
      # macOS
      darwinConfigurations = {
        "HUAWEI-MateBook-Fold" = builder.buildDarwin {
	        machinename = "MacBook-Pro-M4Pro";
	        username = "miksoyer"; # to load he's dotfile
        };

      # mac-mini
      "mac-mini" = builder.buildDarwin {
	        machine = "Mac-mini";
	        username = "allanding";
        };

        # others
        # ......
      };

      # nixOS
      # colina = {  };
    };
}
