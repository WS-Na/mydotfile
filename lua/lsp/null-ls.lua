local status, null_ls = pcall(require, 'null-ls')
if not status then
    vim.notify('没有找到 null-ls')
    return
end

local h = require('null-ls.helpers')
local methods = require('null-ls.methods')
local FORMATTING = methods.internal.FORMATTING
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

null_ls.setup({
    debug = false,
    sources = {
        -- Formatting ---------------------
        formatting.shfmt,
        -- StyLua
        formatting.stylua,
        -- frontend
        formatting.prettier.with({ -- 比默认少了 markdown
            filetypes = {
                'javascript',
                'javascriptreact',
                'typescript',
                'typescriptreact',
                'vue',
                'css',
                'scss',
                'less',
                'html',
                'json',
                'yaml',
                'graphql',
            },
            extra_filetypes = { 'njk' },
            prefer_local = 'node_modules/.bin',
        }),
        formatting.tidy.with({
            name = 'xmllint',
            meta = {
                url = 'http://xmlsoft.org/xmllint.html',
                description = "Despite the name, xmllint can be used to format XML files as well as lint them, and that's the mode this builtin is using.",
            },
            method = FORMATTING,
            filetypes = { 'xml' },
            generator_opts = {
                command = 'xmllint',
                args = { '--format', '-' },
                to_stdin = true,
            },
            factory = h.formatter_factory,
        }),
        --formatting.google_java_format.with({
        --    name = 'google_java_format',
        --    meta = {
        --        url = 'https://github.com/google/google-java-format',
        --        description = 'Reformats Java source code according to Google Java Style.',
        --    },
        --    method = FORMATTING,
        --    filetypes = { 'java' },
        --    generator_opts = {
        --        command = 'google-java-format',
        --        args = {
        --            '-',
        --        },
        --        to_stdin = true,
        --    },
        --    factory = h.formatter_factory,
        --}),

        -----------------------------------------------------
        ---- Diagnostics  ---------------------
        diagnostics.eslint.with({
            prefer_local = 'node_modules/.bin',
        }),
        -- code actions ---------------------
        code_actions.gitsigns,
        code_actions.eslint.with({
            prefer_local = 'node_modules/.bin',
        }),
    },
    -- #{m}: message
    -- #{s}: source name (defaults to null-ls if not specified)
    -- #{c}: code (if available)
    diagnostics_format = '[#{s}] #{m}',
    on_attach = function(client)
        -- 自定义 :Format 命令
        vim.cmd([[ command! Format execute 'lua vim.lsp.buf.formatting()']])
    end,
})
