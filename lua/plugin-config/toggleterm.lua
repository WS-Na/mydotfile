local status, toggleterm = pcall(require, 'toggleterm')

if not status then
    vim.notify('没有找到 toggleterm')
    return
end

-- 从vim中发送内容到终端中
-- :ToggleTermSendCurrentLine <T_ID>
-- :ToggleTermSendVisualLines <T_ID>
-- :ToggleTermSendVisualSelection <T_ID>

toggleterm.setup({
    -- size can be a number or function which is passed the current terminal
    size = 10,
    function(term)
        if term.direction == 'horizontal' then
            return 15
        elseif term.direction == 'vertical' then
            return vim.o.columns * 0.4
        end
    end,
    open_mapping = [[-t]],
    hide_numbers = true,
    shade_filetypes = {},
    shade_terminals = true,
    hidden = true,
    shading_factor = 1, -- 1 : dark | 3 : light
    start_in_insert = true,
    insert_mappings = true,
    terminal_mappings = true,
    persist_size = true,
    -- 设置终端出现样式
    direction = 'float', --'vertical' | 'horizontal' | 'window' | 'float',
    close_on_exit = false,
    shell = vim.o.shell,
    -- float样式设计
    float_opts = {
        -- The border key is *almost* the same as 'nvim_open_win'
        -- see :h nvim_open_win for details on borders however
        -- the 'curved' border is a custom border type
        -- not natively supported but implemented in this plugin.
        -- border = 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
        border = 'single',
        -- width = 6,
        -- height = 6,
        winblend = 3,
        highlights = {
            border = 'Normal',
            background = 'Normal',
        },
    },
})

-- local Terminal = require("toggleterm.terminal").Terminal
-- local node = Terminal:new({ cmd = "node", hidden = true })
-- function _NODE_TOGGLE()
--   node:toggle()
-- end
-- use lazygit
local Terminal = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({
    cmd = 'lazygit',
    hidden = true,
    dir = 'git_dir',
    direction = 'float',
    on_open = function(term)
        vim.cmd('startinsert!')
        vim.api.nvim_buf_set_keymap(term.bufnr, 'n', 'q', '<cmd>close<CR>', { noremap = true, silent = true })
    end,
})
function _lazygit_toggle()
    lazygit:toggle()
end

vim.api.nvim_set_keymap('n', ',t', '<cmd>lua _lazygit_toggle()<CR>', { noremap = true, silent = true })
