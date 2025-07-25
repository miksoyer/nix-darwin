local gpu_adapters = require('utils.gpu-adapter')
local backdrops = require('utils.backdrops')
local colors = require('colors.custom')

return {
   max_fps = 120,
   front_end = 'WebGpu',
   webgpu_power_preference = 'HighPerformance',
   webgpu_preferred_adapter = gpu_adapters:pick_best(),
   -- webgpu_preferred_adapter = gpu_adapters:pick_manual('Dx12', 'IntegratedGpu'),
   -- webgpu_preferred_adapter = gpu_adapters:pick_manual('Gl', 'Other'),
   underline_thickness = '1.5pt',

   -- cursor
   animation_fps = 120,
   cursor_blink_ease_in = 'EaseIn',
   cursor_blink_ease_out = 'EaseOut',
   default_cursor_style = 'BlinkingBar',
   cursor_blink_rate = 700,

   -- color scheme
   colors = colors,

   -- background
   background = backdrops:initial_options(true), -- set to true if you want wezterm to start on focus mode

   -- scrollbar
   enable_scroll_bar = true,

   -- tab bar
   enable_tab_bar = true,
   hide_tab_bar_if_only_one_tab = false,
   use_fancy_tab_bar = false,
   tab_max_width = 20,
   show_tab_index_in_tab_bar = false,
   switch_to_last_active_tab_when_closing_tab = true,
   tab_bar_style = {
   },

   -- window
   window_background_opacity = 0.7,
   macos_window_background_blur = 25,
   window_decorations = "INTEGRATED_BUTTONS|RESIZE",
   integrated_title_button_alignment = "Right",
   integrated_title_button_color = "Auto",
   initial_rows = 52,
   initial_cols = 152,
   window_padding = {
      left = 16,
      right = 16,
      top = 16,
      bottom = 8,
   },
   adjust_window_size_when_changing_font_size = false,
   window_close_confirmation = 'NeverPrompt',
   window_frame = {
      active_titlebar_bg = '#090909',
      -- font = fonts.font,
      -- font_size = fonts.font_size,
   },
   inactive_pane_hsb = {
      saturation = 0.9,
      brightness = 0.5,
   },

   visual_bell = {
      fade_in_function = 'EaseIn',
      fade_in_duration_ms = 250,
      fade_out_function = 'EaseOut',
      fade_out_duration_ms = 250,
      target = 'CursorColor',
   },
}
