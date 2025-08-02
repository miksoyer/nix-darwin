-- 文件路径: ~/.config/nvim/lua/config/neovide.lua

if not vim.g.neovide then
  return
end

-- 字体设置
vim.o.guifont = "Maple Mono NF CN:h14"

-- GUI 缩放比例
vim.g.neovide_scale_factor = 1.0

-- 半透明效果（0~1）
vim.g.neovide_opacity = 0.9

-- 毛玻璃模糊（配合透明使用）
vim.g.neovide_floating_blur_amount_x = 2.0
vim.g.neovide_floating_blur_amount_y = 2.0

-- 光标动画样式
vim.g.neovide_cursor_vfx_mode = "railgun"  -- 可选：pixiedust, torpedo, wireframe, ripple 等
vim.g.neovide_cursor_animation_length = 0.05

-- 启动记住窗口大小
vim.g.neovide_remember_window_size = true

-- 是否禁用输入法记忆（中文输入法问题）
vim.g.neovide_input_ime = true