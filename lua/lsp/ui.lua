vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    update_in_insert = true,
})

local signs = { Error = ' ', Warn = ' ', Hint = ' ', Info = ' ' }
for type, icon in pairs(signs) do
    local hl = 'DiagnosticSign' .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
---------------------------------------------------------
-- lspkind
local lspkind = require('lspkind')
lspkind.init({
    -- default: true
    -- with_text = true,
    -- defines how annotations are shown
    -- default: symbol
    -- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
    mode = 'symbol_text',
    -- default symbol map
    -- can be either 'default' (requires nerd-fonts font) or
    -- 'codicons' for codicon preset (requires vscode-codicons font)
    --
    -- default: 'default'
    preset = 'codicons',
    -- override preset symbols
    --
    -- default: {}
    symbol_map = {
        Text = '',
        Method = '',
        Function = '',
        Constructor = '',
        Field = 'ﰠ',
        Variable = '',
        Class = 'ﴯ',
        Interface = '',
        Module = '',
        Property = 'ﰠ',
        Unit = '塞',
        Value = '',
        Enum = '',
        Keyword = '',
        Snippet = '',
        Color = '',
        File = '',
        Reference = '',
        Folder = '',
        EnumMember = '',
        Constant = '',
        Struct = 'פּ',
        Event = '',
        Operator = '',
        TypeParameter = '',
    },
})

local M = {}
-- 为 cmp.lua 提供参数格式
M.formatting = {
    format = lspkind.cmp_format({
        mode = 'symbol_text',
        --mode = 'symbol', -- show only symbol annotations

        maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
        -- The function below will be called before any actual modifications from lspkind
        -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
        before = function(entry, vim_item)
            -- Source 显示提示来源
            vim_item.menu = '[' .. string.upper(entry.source.name) .. ']'
            return vim_item
        end,
    }),
}

--------------------------------------------------------
local saga = require('lspsaga')
local map = vim.api.nvim_buf_set_keymap
saga.setup({
    debug = false,
    use_saga_diagnostic_sign = true,
    -- diagnostic sign
    error_sign = ' ',
    warn_sign = ' ',
    hint_sign = ' ',
    infor_sign = ' ',
    diagnostic_header_icon = '🌈🐝🌸',
    -- code action title icon
    code_action_icon = '🪢💋',
    code_action_prompt = {
        enable = false,
        sign = true,
        sign_priority = 40,
        virtual_text = true,
    },
    finder_definition_icon = '😘  ',
    finder_reference_icon = '🥰  ',
    max_preview_lines = 10,
    finder_action_keys = {
        open = 'o',
        vsplit = 's',
        split = 'h',
        quit = 'q',
        scroll_down = '<C-d>',
        scroll_up = '<C-u>',
    },
    code_action_keys = {
        quit = 'q',
        exec = '<CR>',
    },
    rename_action_keys = {
        quit = '<leader>rn',
        exec = '<CR>',
    },
    definition_preview_icon = '🍱🥑🌽',
    --
    border_style = 'single',
    rename_prompt_prefix = '🚀',
    server_filetype_map = {},
    diagnostic_prefix_format = '%d. ',
    diagnostic_message_format = '%m %c',
    highlight_prefix = false,
    map(0, 'n', '<C-u>', "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1, '<c-u>')<cr>", {}),
    map(0, 'n', '<C-d>', "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1, '<c-d>')<cr>", {}),
})

return M
