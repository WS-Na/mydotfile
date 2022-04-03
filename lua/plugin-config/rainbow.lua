-- 修改颜色样式 留位置
require("plugin-config.nvim-treesitter.configs").setup {
  -- rainbow bracket
  rainbow = {

    colors = {
      "#cc241d",
      "#a89984",
      "#b16286",
      "#d79921",
      "#689d6a",
      "#d65d0e",
      "#458588",
    },

    termcolors = {
      "Red",
      "Green",
      "Yellow",
      "Blue",
      "Magenta",
      "Cyan",
      "White",
    }

  }
}
