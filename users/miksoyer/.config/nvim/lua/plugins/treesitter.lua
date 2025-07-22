-- 文件路径：lua/plugins/treesitter.lua
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects", -- 智能文本对象选择
    "nvim-treesitter/nvim-treesitter-context",     -- 上方显示当前函数/类
    "windwp/nvim-ts-autotag",                      -- 自动闭合HTML/JSX标签
    "HiPhish/rainbow-delimiters.nvim",             -- 彩虹括号（更现代）
  },
  config = function()
    -- 基本配置
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "lua", "vim", "vimdoc", "bash",
        "python", "javascript", "typescript", "html", "css", "json", "yaml",
        "cpp", "c", "go", "rust", "markdown", "markdown_inline",
      },
      sync_install = false,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = {
        enable = true,
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<CR>",
          node_incremental = "<CR>",
          node_decremental = "<BS>",
          scope_incremental = "<C-s>",
        },
      },
      textobjects = {
        select = {
          enable = true,
          lookahead = true, -- 自动跳到最近的目标
          keymaps = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
            ["ab"] = "@block.outer",
            ["ib"] = "@block.inner",
          },
        },
        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = {
            ["]f"] = "@function.outer",
            ["]c"] = "@class.outer",
          },
          goto_previous_start = {
            ["[f"] = "@function.outer",
            ["[c"] = "@class.outer",
          },
        },
      },
      autotag = {
        enable = true,
      },
    })

    -- rainbow 括号配置（支持多语言括号染色）
    vim.g.rainbow_delimiters = {
      strategy = {
        [''] = require('rainbow-delimiters').strategy.global,
      },
      query = {
        [''] = 'rainbow-delimiters',
      },
      highlight = {
        'RainbowDelimiterRed',
        'RainbowDelimiterYellow',
        'RainbowDelimiterBlue',
        'RainbowDelimiterOrange',
        'RainbowDelimiterGreen',
        'RainbowDelimiterViolet',
        'RainbowDelimiterCyan',
      },
    }

    -- context: 上方显示当前在哪个函数/类中
    require("treesitter-context").setup({
      enable = true,
      max_lines = 3,
      trim_scope = 'outer',
    })
  end,
}