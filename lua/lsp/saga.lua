vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  update_in_insert = true,
})

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " "}
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

local saga = require 'lspsaga'
saga.setup {
  debug = false,
  use_saga_diagnostic_sign = true,
  -- diagnostic sign
  error_sign = ' ',
  warn_sign = ' ',
  hint_sign = ' ',
  infor_sign = ' ',
  diagnostic_header_icon ='🐞',
  -- code action title icon
  code_action_icon = '',
  code_action_prompt = {
    enable = false,
    sign = true,
    sign_priority = 40,
    virtual_text = true,
  },
  finder_definition_icon = '  ',
  finder_reference_icon = '  ',
  max_preview_lines = 10,
  finder_action_keys = {
    open = 'o', vsplit = 's',split = 'h',quit = 'q',
    scroll_down = '<C-d>',scroll_up = '<C-u>'
  },
  code_action_keys = {
    quit = 'q',exec = '<CR>'
  },
  rename_action_keys = {
    quit = '<leader>rn',exec = '<CR>'
  },
  definition_preview_icon = '  ',
  border_style = "single",
  rename_prompt_prefix = '🚀',
  server_filetype_map = {},
  diagnostic_prefix_format = "%d. ",
  diagnostic_message_format = "%m %c",
  highlight_prefix = false,
}

