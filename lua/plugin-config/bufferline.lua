local status, bufferline = pcall(require, 'bufferline')
if not status then
    vim.notify('没有找到 bufferline')
    return
end

-- bufferline 配置
-- https://github.com/akinsho/bufferline.nvim#configuration
bufferline.setup({
    options = {
        -- 关闭 Tab 的命令，这里使用 moll/vim-bbye 的 :Bdelete 命令
        close_command = 'Bdelete! %d',
        right_mouse_command = 'Bdelete! %d',
        -- 侧边栏配置
        -- 左侧让出 nvim-tree 的位置，显示文字 File Explorer
        offsets = {
            {
                filetype = 'NvimTree',
                text = 'File Explorer',
                highlight = 'Directory',
                text_align = 'left',
            },
        },
        numbers = function(opts)
            return string.format('%s⋆', opts.raise(opts.ordinal))
        end,
        modified_icon = '🥹',
        --没搞懂
        show_tab_indicators = false,
        --禁止buffer colse icons
        buffer_close_icon = 'ℌ',
        show_buffer_close_icons = true,
        --禁止最后面的符号
        show_close_icon = false,
        -- 使用 nvim 内置 LSP  后续课程会配置
        diagnostics = 'nvim_lsp',
        --buffer style
        separator_style = 'thick',
        -- 可选，显示 LSP 报错图标
        ---@diagnostic disable-next-line: unused-local
        diagnostics_indicator = function(count, evel, diagnostics_dict, context)
            local s = ' '
            for e, n in pairs(diagnostics_dict) do
                local sym = e == 'error' and '🤡 ' or (e == 'warning' and '⛅️ ' or '💦')
                -- 🥳🥶👹👺🤡😈👿👹👺🤡🙅🙆🐋🐬🐳🌍🌏✨🌟🔥🌈💥🌙🎯🚨🔥🩹💔📣💬💭🥰🎃💩
                -- 🧶🧵🪡🪢🐙🐡🦅🌷🍄🐚🍁🥀🌺🌸⛅️🌊🧉🍭🪁🎫🎭🚑🚒🌋💈🎊💢💠
                s = s .. n .. sym
            end
            return s
        end,
    },
})
