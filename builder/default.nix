{ inputs, self, stable_version, ... }:
let
  nixpkgs_stable =
    if stable_version == "unstable" then inputs.nixpkgs
    else if stable_version == "25.05" then inputs.nixpkgs-stable
    else throw "Unsupported nixpkgs version: ${stable_version}, please declare in flake.nix:inputs";
in
{
  buildDarwin = import ./darwin.nix { inherit inputs self nixpkgs_stable; };
  buildLinux = import ./linux.nix { inherit inputs self nixpkgs_stable; };
  buildWindows = import ./windows.nix { inherit inputs self nixpkgs_stable; };
}
