-- https://github.com/neovim/nvim-lspconfig/wiki/Autocompletion
-- https://github.com/hrsh7th/nvim-cmp
-- https://github.com/onsails/lspkind-nvim
--local lspkind = require("lspkind")
local cmp = require('cmp')
-- autopairs
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done({ map_char = { tex = '' } }))

cmp.setup({
    -- 指定 snippet 引擎
    snippet = {
        expand = function(args)
            -- For `vsnip` users.
            vim.fn['vsnip#anonymous'](args.body)

            -- For `luasnip` users.
            -- require('luasnip').lsp_expand(args.body)

            -- For `ultisnips` users.
            -- vim.fn["UltiSnips#Anon"](args.body)

            -- For `snippy` users.
            -- require'snippy'.expand_snippet(args.body)
            --
            -- add a lisp filetype (wrap my-function), FYI: Hardcoded = { "clojure", "clojurescript", "fennel", "janet" }
            cmp_autopairs.lisp[#cmp_autopairs.lisp + 1] = 'racket'
        end,
    },
    -- 来源
    sources = cmp.config.sources({
        -- For vsnip users.
        { name = 'vsnip' },
        { name = 'nvim_lsp' },
        { name = 'nvim_lsp_signatrue_help' },
        { name = 'buffer' },
        -- For luasnip users.
        -- { name = 'luasnip' },
        --For ultisnips users.
        -- { name = 'ultisnips' },
        -- -- For snippy users.
        -- { name = 'snippy' },
    }, { { name = 'path' } }),

    -- 快捷键
    mapping = require('keybindings').cmp(cmp),
    -- 使用lspkind-nvim显示类型图标
    formatting = require('lsp.ui').formatting,
    --formatting = {
    --  format = lspkind.cmp_format({
    --    with_text = true, -- do not show text alongside icons
    --    maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
    --    before = function (entry, vim_item)
    --      -- Source 显示提示来源
    --      vim_item.menu = "["..string.upper(entry.source.name).."]"
    --      return vim_item
    --    end
    --  })
    --},
})

-- Use buffer source for `/`.
cmp.setup.cmdline('/', {
    sources = {
        { name = 'buffer' },
    },
})

-- Use cmdline & path source for ':'.
cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
        { name = 'path' },
    }, {
        { name = 'cmdline' },
    }),
})
