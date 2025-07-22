-- 基础界面设置
vim.opt.number = true              -- 显示绝对行号
vim.opt.relativenumber = true     -- 显示相对行号（更适合移动）
vim.opt.cursorline = true         -- 高亮当前行，更清晰
vim.opt.wrap = true               -- 自动换行
vim.opt.showcmd = true            -- 显示正在输入的命令
vim.opt.scrolloff = 4             -- 光标上下保留行数

-- 命令行补全
vim.opt.wildmenu = true           -- 显示补全菜单
vim.opt.wildmode = { "longest", "list", "full" }

-- 搜索相关
vim.opt.ignorecase = true         -- 忽略大小写
vim.opt.smartcase = true          -- 智能大小写（有大写就区分）

-- 缩进与 Tab 设置（建议统一）
vim.opt.tabstop = 2               -- 1 Tab = 2 空格
vim.opt.shiftwidth = 2            -- 自动缩进使用 2 空格
vim.opt.softtabstop = 2           -- 回退删除也算 2 空格
vim.opt.expandtab = true          -- 用空格代替 tab（推荐）

-- 自动缩进
vim.opt.smartindent = true
vim.opt.autoindent = true

-- 剪贴板与鼠标
vim.opt.clipboard = "unnamedplus" -- 使用系统剪贴板
vim.opt.mouse = "a"               -- 启用鼠标支持

-- 性能相关
vim.opt.updatetime = 200          -- 插件响应/光标停留延迟
vim.opt.timeoutlen = 500          -- 映射按键超时（默认 1000ms）

-- 文件相关
vim.opt.fileencoding = "utf-8"    -- 当前文件编码
vim.opt.fileencodings = "utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1"
vim.opt.encoding = "utf-8"        -- 内部使用编码

-- swap/undo 历史
vim.opt.swapfile = false          -- 建议禁用 swap（不会频繁写磁盘）
vim.opt.undofile = true           -- 保留 undo 历史文件


-- 启用颜色
vim.opt.termguicolors = true

-- iskeyword 设置：使 word 操作识别更多符号
vim.opt.iskeyword:append("-")     -- 把 `-` 当成词的一部分
