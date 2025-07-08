{ pkgs, ... }:
{
  # Document -> https://nikitabobko.github.io/AeroSpace/commands
  services.aerospace = {
    enable = true;
    package = pkgs.aerospace;
    
    settings = {
      # efault layout for the root container. one of “tiles”, “accordion”
      default-root-container-layout = "tiles";
      # Possible values: horizontal|vertical|auto
      # 'auto' means: wide monitor (anything wider than high) gets horizontal orientation,
      #               tall monitor (anything higher than wide) gets vertical orientation
      default-root-container-orientation = "auto";
      # Containers that have only one child are “flattened”.
      enable-normalization-flatten-containers = true;
      # Containers that nest into each other must have opposite orientations.
      enable-normalization-opposite-orientation-for-nested-containers = true;
      # You can effectively turn off macOS "Hide application" (cmd-h) feature by toggling this flag
      # Useful if you don't use this macOS feature, but accidentally hit cmd-h or cmd-alt-h key
      # Also see: https://nikitabobko.github.io/AeroSpace/goodies#disable-hide-app
      automatically-unhide-macos-hidden-apps = true;

      
      after-startup-command = [];           # Add commands that run after AeroSpace startup
      accordion-padding = 50;               # Padding between windows in an accordion container.

      # Commands to run every time workspace changes.
      exec-on-workspace-change = [];
      # [
      #   "/bin/bash"
      #   "-c"
      #   "sketchybar --trigger aerospace_workspace_change FOCUSED=$AEROSPACE_FOCUSED_WORKSPACE"
      # ];
      # Commands to run every time focused window or workspace changes.
      on-focus-changed = [];
      # Commands to run every time focused monitor changes.
      on-focused-monitor-changed = [ "move-mouse monitor-lazy-center" ];

      # Commands to run every time a new window is detected with optional conditions.
      on-window-detected = [
        {
          #check-further-callbacks = false;            # Whether to check further callbacks after this rule (optional).
          "if" = {
            app-id = "com.apple.finder";              # The application ID to match (optional).
            # app-name-regex-substring = "CoolApp";     # Regex substring to match the app name (optional).
            # during-aerospace-startup = false;         # Whether to match during aerospace startup (optional).
            # window-title-regex-substring = "Title";   # Substring to match in the window title (optional).
            # workspace = "cool-workspace";             # The workspace name to match (optional).
          };
          run = ["resize-node" "move-node-to-workspace 4"];
        }
        {
          "if".app-id = "org.wezfurlong.WezTerm";
          run = ["layout floating"];
        }
        {
          "if".app-id = "com.tencent.xinWeChat";
          run = ["layout floating"];
        }
        {
          "if".app-id = "com.tencent.qq";
          run = ["layout floating"];
        }
      ];

      gaps = {
        inner.horizontal = 15;
        inner.vertical = 10;
        outer.left = 10;
        outer.bottom = 15;
        outer.top = 10;
        outer.right = 10;
      };
      
      key-mapping.preset = "qwerty";        # Keymapping preset. Type: one of “qwerty”, “dvorak”
      mode.main.binding = {
        alt-slash = "layout tiles horizontal vertical";
        alt-comma = "layout accordion horizontal vertical";
        alt-h = "focus left";
        alt-j = "focus down";
        alt-k = "focus up";
        alt-l = "focus right";

        alt-minus = "resize smart -50";
        alt-equal = "resize smart +50";
        alt-1 = "workspace 1";
        alt-2 = "workspace 2";
        alt-3 = "workspace 3";
        alt-4 = "workspace 4";
        alt-shift-1 = [ "move-node-to-workspace 1" "workspace 1" ];
        alt-shift-2 = [ "move-node-to-workspace 2" "workspace 2" ];
        alt-shift-3 = [ "move-node-to-workspace 3" "workspace 3" ];
        alt-shift-4 = [ "move-node-to-workspace 4" "workspace 4" ];

        alt-tab = "workspace-back-and-forth";
        alt-shift-tab = "move-workspace-to-monitor --wrap-around next";
        alt-f = "layout floating tiling";
        alt-shift-semicolon = "mode service";
      };

      mode.service.binding = {
        esc = [ "reload-config" "mode main" ];
        r = [ "flatten-workspace-tree" "mode main" ];
        f = [ "layout floating tiling" "mode main"]; # Toggle between floating and tiling layout
        backspace = [ "close-all-windows-but-current" "mode main" ];

        alt-shift-h = [ "join-with left" "mode main" ];
        alt-shift-j = [ "join-with down" "mode main" ];
        alt-shift-k = [ "join-with up" "mode main" ];
        alt-shift-l = [ "join-with right" "mode main" ];

        down = "volume down";
        up = "volume up";
        shift-down = [ "volume set 0" "mode main"];
      };

      # Map workspaces to specific monitors. Left-hand side is the workspace name, and right-hand side is the monitor pattern.
      workspace-to-monitor-force-assignment = {
        # "1" = 1;
        # "2" = "main";
        # "3" = "secondary";
        # "4" = "built-in";
        # "5" = "^built-in retina display$";
        # "6" = [
        #   "secondary"
        #   "dell"
        # ];
      };

      # Do not start AeroSpace at login. (Managed by launchd instead)
      start-at-login = false;
      # Do not use AeroSpace to run commands after login. (Managed by launchd instead)
      after-login-command = [];
    };
  };
}