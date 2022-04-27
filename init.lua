-- 基础设置
require('basic')
-- autocmd
require('additional')
-- 快捷键映射
require('keybindings')
require('keybindings.lspmapping')

-- Packer 插件管理
require('plugins')

-- 主题设置
require('colorscheme')
-- catppuccin
require('plugin-config.catppuccin')

-- 插件配置
-- Nerd-tree
require('plugin-config.nvim-tree')
-- bufferline
require('plugin-config.bufferline')
-- lualine
require('plugin-config.lualine')
-- Telescope
require('plugin-config.telescope')
-- extionsion for clipboard manager in telescope
require('plugin-config.neoclip')
-- dashboard
require('plugin-config.dashboard')
-- project
require('plugin-config.project')
-- nvim-treesitter
require('plugin-config/nvim-treesitter')
-- zen 模式
require('plugin-config.zen-mode')
-- hop(easymotion)
require('plugin-config.hop')
-- sursorline
require('plugin-config.cursorline')

-- 代码部分
-- 终端
require('plugin-config.toggleterm')
-- Lsp和lsp-installer
require('plugin-config.surround')
-- 语言服务器
require('lsp/setup')
-- 自动补全
require('lsp/cmp')
-- ui
require('lsp/ui')
require('plugin-config.indent-blankline')
-- debug ui
require('lsp.dap-virtual-text')
-- formater
require('lsp.formatter')
require('lsp.null-ls')
-- git diff view
require('lsp.diffview')
-- gitsigns
require('plugin-config.gitsigns')
-- to-do
require('lsp.to-do')
-- autopairs
require('plugin-config.autopairs')
-- outline
require('lsp.symbols-outline')
-- pretty-fold
require('plugin-config.pretty-fold')
