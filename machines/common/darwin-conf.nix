{ inputs, self, nixpkgs_stable, username, structure, pkgs, ... }:
let
  inherit (inputs) nixpkgs nixpkgs-stable;
in
{
  nixpkgs = {
    # to install the unfree pkgs
    config.allowUnfree = true;
    # The platform the configuration will be used on.
    hostPlatform = "${structure}"; 
  };
  
  # Set up for nix
  nix = {
    # Nix automatically detects files in the store that have identical contents, and replaces them with hard links to a single copy
    # auto-optimise-store = true; # ervry time
    optimise = {
      # Automatically run the nix store optimiser at a specific time.
      automatic = true;
      # default options
      interval = [ # every sunday 04:15 will exec
        {
	        Hour = 4;
	        Minute = 15;
	        Weekday = 7;
        }
      ];
    };

    # Necessary for using flakes on this system.
    settings = {
      experimental-features = "nix-command flakes";
      trusted-users = [
        "root"
	      "${username}"
	      "@admin"
      ];
      # A list of names of users that are allowed to connect to the Nix daemon
      allowed-users = [
        "root"
	      "${username}"
	      "@admin"
      ];
      extra-sandbox-paths = [
        # Directories from the host filesystem to be included in the sandbox.
        # "/dev" 
      ];
    };

    gc = {
      # The calendar interval at which the garbage collector will run
      automatic = true;
      # The calendar interval at which the garbage collector will run
      interval = [
        {
          Hour = 3;
          Minute = 15;
          Weekday = 7;
        }
      ];
      # Options given to nix-collect-garbage when the garbage collector is run automatically.
      # options = "--max-freed $((64 * 1024**3))";
    };
  };

  # Set up system
  system = {
    # Set Git commit hash for darwin-version.
    configurationRevision = self.rev or self.dirtyRev or null;

    # Used for backwards compatibility, please read the changelog before changing.
    # $ darwin-rebuild changelog
    stateVersion = 6;

    # setting for  -->  homebrew.user
    primaryUser = "${username}";

    startup.chime = false;        # Whether to enable the startup chime.

    
  };

  # program
  programs = {
    # SHELL
    bash.completion.enable = true;
    zsh = {
      enable = true;
      enableAutosuggestions = true;
      enableCompletion = true;
      enableFastSyntaxHighlighting = true;
      enableFzfCompletion = true;
      enableFzfGit = true;
      enableFzfHistory = true;
      enableGlobalCompInit = true;
      variables = {
          # like export xxx = xxx;
      };
    };

    # Enable nix-index and its command-not-found helper.
    nix-index.enable = true;
    };
}
