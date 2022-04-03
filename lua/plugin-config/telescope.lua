local status, telescope = pcall(require, "telescope")
if not status then
  vim.notify("没有找到 telescope")
  return
end

telescope.setup({
  defaults = {
    -- 打开弹窗后进入的初始模式，默认为 insert，也可以是 normal
    initial_mode = "insert",
    -- 窗口内快捷键
    mappings = require("keybindings").telescopeList,
    --设置窗口大小
    layout_strategy = 'horizontal',
    layout_config= {
      width = 0.98 ,
      height = 0.8 ,
      preview_cutoff = 1 ,
      prompt_position = 'bottom',
    },


  },
  pickers = {
    -- 内置 pickers 配置
    find_files = {
      -- 查找文件换皮肤，支持的参数有： dropdown, cursor, ivy
      theme = "ivy",
    }
  },
  extensions = {
    -- 扩展插件配置
    -- dash app
    dash = {
      -- config
      require("plugin-config.dash")
    },
  },
})
-- telescope extensions
require("telescope").load_extension("ui-select")
pcall(telescope.load_extension, "env")
