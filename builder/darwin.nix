{ inputs, self, nixpkgs_stable, ... }:
let
  inherit (inputs) nix-darwin mac-app-util home-manager nix-homebrew ;
in
{ machinename, username, ... }:
  let
    # import the machine configuration
    machine = 
      let
        machinepath = ./../machines/mac/${machinename}.nix;
      in
      if builtins.pathExists machinepath then
        import machinepath { inherit inputs nixpkgs_stable username; }
      else
        throw "Machine configuration file '${toString machinepath}' does not exist!";
  in
    nix-darwin.lib.darwinSystem {
      specialArgs = { 
        inherit inputs self nixpkgs_stable username nix-homebrew; 
        structure = "${machine.structure}"; 
        };
    
      # generate the specfic darwin configuration
      modules = [
        # Fixes a few common problems
        # - Launching .app programs from Spotlight
        # - Pinning a .app in the Dock, even across Nix updates
        mac-app-util.darwinModules.default

        # common configuration
        ./../machines/common/darwin-conf.nix

        # host's configuration
        machine.configuration

        # user's configuration
        home-manager.darwinModules.home-manager {
          networking.hostName = "${machine.hostname}";
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.verbose = true;
          home-manager.backupFileExtension = "bak";
          users.users.${username}= {
              name = "${username}";
              home = "/Users/${username}";
          };
          home-manager.extraSpecialArgs = { inherit inputs; };
          #home-manager.sharedModules = [ inputs.nixvim.homeManagerModules.nixvim ];
          home-manager.users.${username} = { 
            imports = [ 
              inputs.mac-app-util.homeManagerModules.default
              ./../users/${username}/home.nix
            ];
          };
        }

        # homebrew
        nix-homebrew.darwinModules.nix-homebrew
        {
          nix-homebrew = {
            # Install Homebrew under the default prefix, set homebrew.onActivation. to auto update brew apps
            enable = true;
            # Apple Silicon Only: Also install Homebrew under the default Intel prefix for Rosetta 2
            # enableRosetta = true;
            # User owning the Homebrew prefix
            user = "${username}";
            # Automatically migrate existing Homebrew installations
            autoMigrate = true;
            # Optional: Declarative tap management
            taps = with inputs; {
              "homebrew/homebrew-core" = homebrew-core;
              "homebrew/homebrew-cask" = homebrew-cask;
              "homebrew/homebrew-bundle" = homebrew-bundle;
              "felixKratz/homebrew-formulae" = formulae ;
            };
            # Optional: Enable fully-declarative tap management
            #
            # With mutableTaps disabled, taps can no longer be added imperatively with `brew tap`.
            mutableTaps = true;
          };
        }

      ];
}
