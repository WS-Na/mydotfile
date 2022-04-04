-- 基础设置
require("basic")
-- 快捷键映射
require("keybindings")

-- Packer 插件管理
require("plugins")

-- 主题设置
require("colorscheme")

-- 插件配置
-- Nerd-tree
require("plugin-config.nvim-tree")
-- bufferline
require("plugin-config.bufferline")
-- lualine
require("plugin-config.lualine")
-- Telescope
require("plugin-config.telescope")
-- dashboard
require("plugin-config.dashboard")
-- project
require("plugin-config.project")
-- nvim-treesitter
require('plugin-config/nvim-treesitter')
-- zen 模式
require('plugin-config.zen-mode')
-- dash
require("plugin-config.libdash")

-- 代码部分
-- 终端
require("plugin-config.toggleterm")
-- Lsp和lsp-installer
require("plugin-config.surround")
-- 语言服务器
require('lsp/setup')
-- 自动补全
require('lsp/cmp')
-- ui
require("lsp/saga")
-- debug ui
require("lsp.dap-virtual-text")
