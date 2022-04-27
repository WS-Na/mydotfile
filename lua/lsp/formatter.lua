local status, formatter = pcall(require, 'formatter')
if not status then
    vim.notify('没有找到 formatter')
    return
end

formatter.setup({
    filetype = {
        --        lua = {
        --            function()
        --                return {
        --                    exe = 'stylua',
        --                    args = {
        --                        -- "--config-path "
        --                        --   .. os.getenv("XDG_CONFIG_HOME")
        --                        --   .. "/stylua/stylua.toml",
        --                        '-',
        --                    },
        --                    stdin = true,
        --                }
        --            end,
        --        },
        java = {
            function()
                return {
                    meta = {
                        url = 'https://www.html-tidy.org/',
                        description = [[Tidy corrects and cleans up HTML and XML documents by ]]
                            .. [[fixing markup errors and upgrading legacy code to modern standards.]],
                    },
                    exe = 'java',
                    -- Formatter uses '-' as stdin
                    args = {
                        '-jar',
                        vim.fn.glob('~/.local/share/nvim/lsp_servers/jdtls-support/google-java-format-*.jar'),
                        '-',
                    },
                    stdin = true,
                }
            end,
        },
        --   xml = {
        --       function()
        --           return {
        --               exe = 'xml',
        --               args = {
        --                   'tidy',
        --                   vim.fn.glob('/usr/local/bin/tidy'),
        --                   '-',
        --               },
        --               stdin = true,
        --           }
        --       end,
    },
    --  html = {
    --      -- prettier
    --      function()
    --          return {
    --              exe = 'html',
    --              args = { '--stdin-filepath', vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), '--single-quote' },
    --              stdin = true,
    --          }
    --      end,
    --  },
    --  json = {
    --      function()
    --          return {
    --              exe = 'json',
    --              args = {
    --                  '--stdin-filepath',
    --                  vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
    --                  '--double-quote',
    --              },
    --              stdin = true,
    --          }
    --      end,
    --  },
    -- },
})

-- format on save
vim.api.nvim_exec(
    [[
    augroup FormatAutogroup
    autocmd!
    autocmd BufWritePost *.java, FormatWrite
    augroup END
]],
    true
)
