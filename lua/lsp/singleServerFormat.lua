local util = require('vim.lsp.util')
local lspconfig = require('lspconfig')
local formatting_callback = function(client, bufnr)
    vim.keymap.set('n', '<space>f', function()
        local params = util.make_formatting_params({})
        client.request('textDocument/formatting', params, nil, bufnr)
    end, { buffer = bufnr })
end

lspconfig.lemminx.setup({
    on_attach = function(client, bufnr)
        formatting_callback(client, bufnr)
        common_on_attach(client, bufnr)
    end,
})
