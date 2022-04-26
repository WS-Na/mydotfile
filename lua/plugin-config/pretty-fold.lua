require('pretty-fold').setup({
    custom_function_arg = 'Hello from inside custom function!',
    keep_indentation = false,
    fill_char = '•',
    sections = {
        left = {
            '━ ',
            function()
                return string.rep('*', vim.v.foldlevel)
            end,
            ' ━┫',
            'content',
            '┣',
        },
        right = {
            '┫ ',
            'number_of_folded_lines',
            ': ',
            'percentage',
            ' ┣━━',
        },
    },
})
require('pretty-fold').ft_setup('jdtls', {
    process_comment_signs = false,
    comment_signs = {
        '//', -- C++ Doxygen comments
    },
    stop_words = {
        -- ╟─ "*" ──╭───────╮── "@brief" ──╭───────╮──╢
        --          ╰─ WSP ─╯              ╰─ WSP ─╯
        '%*%s*@brief%s*',
    },
})
require('pretty-fold.preview').setup({
    key = 'h', -- 'h', 'l' or nil (if you would like to set your own keybinding)

    -- 'none', "single", "double", "rounded", "solid", 'shadow' or table
    -- For explanation see: :help nvim_open_win()
    border = { ' ', '', ' ', ' ', ' ', ' ', ' ', ' ' },
})
