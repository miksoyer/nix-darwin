{ pkgs, ...}:
{
  services.jankyborders = {
    enable = true;
    package = pkgs.jankyborders;

    # Sets the border color for the focused window (format: 0xAARRGGBB). 
    # For instance, active_color=“0xff00ff00” creates a green border.
    # For Gradient Border : active_color=“gradient(top_right=0x9992B3F5,bottom_left=0x9992B3F5)”
    active_color = "gradient(top_left=0xff38bdf8,bottom_right=0xff98ff98)";

    # Sets the border color for all windows not in focus (format: 0xAARRGGBB). 
    # For Gradient Border : inactive_color=“gradient(top_right=0x9992B3F5,bottom_left=0x9992B3F5)”
    inactive_color = "gradient(top_left=0xffbfdbfe,bottom_right=0xffc4b5fd)";
    
    order = "above";      # Specifies whether borders should be drawn above or below windows.
    style = "round";      # Specifies the style of the border (either round or square).
    blur_radius = 5.0;    # blur radius applied to the borders or backgrounds with transparency.
    width = 3.0;          # Determines the width of the border
    hidpi = true;           # If set to on, the border will be drawn with retina resolution.

    # If set to true, the (slower) accessibility API is used to resolve the focused window.
    ax_focus = false;

    # It looks very nice in light purple, but the semi transparent effect of the terminal is lost
    #  If you prefer using background images in terminal emulators, you may consider opening it
    # background_color = "0xffc4b5fd";

    blacklist = [
      "iPhone Mirroring"
    ];
  };
}