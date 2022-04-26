-- https://github.com/windwp/nvim-autopairs
local status, autopairs = pcall(require, 'nvim-autopairs')
local Rule = require('nvim-autopairs.rule')
if not status then
    vim.notify('没有找到 nvim-autopairs')
    return
end

autopairs.setup({
    check_ts = true,
    ts_config = {
        lua = { 'string' }, -- it will not add a pair on that treesitter node
        javascript = { 'template_string' },
        -- java = false, -- don't check treesitter on java
    },
    fast_wrap = {
        map = '<C-x>',
        chars = { '{', '[', '(', '"', "'" },
        pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], '%s+', ''),
        end_key = '$',
        keys = 'qwertyuiopzxcvbnmasdfghjkl',
        check_comma = true,
        highlight = 'Search',
        highlight_grey = 'Comment',
        enable_check_bracket_line = false,
    },
})
local ts_conds = require('nvim-autopairs.ts-conds')

-- press % => %% only while inside a comment or string
autopairs.add_rules({
    Rule('%', '%', 'lua'):with_pair(ts_conds.is_ts_node({ 'string', 'comment' })),
    Rule('$', '$', 'lua'):with_pair(ts_conds.is_not_ts_node({ 'function' })),
})
-- If you want insert `(` after select function or method item
-- local cmp_autopairs = require('nvim-autopairs.completion.cmp')
-- local cmp = require('cmp')
-- cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done({ map_char = { tex = '' } }))
