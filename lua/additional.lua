local myAutoGroup = vim.api.nvim_create_augroup('myAutoGroup', {
    clear = true,
})

local autocmd = vim.api.nvim_create_autocmd

-- nvim-tree 自动关闭
autocmd('BufEnter', {
    nested = true,
    group = myAutoGroup,
    callback = function()
        if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0):match('NvimTree_') ~= nil then
            vim.cmd('quit')
        end
    end,
})
-- 进入Terminal 自动进入插入模式
autocmd('TermOpen', {
    group = myAutoGroup,
    command = 'startinsert',
})

--  保存时自动格式化
autocmd('BufWritePre', {
    group = myAutoGroup,
    pattern = { '*.java', '*.xml', '*.html', '*.json', '*.css', '*.lua' },
    callback = vim.lsp.buf.formatting_sync,
})

-- 修改lua/plugins.lua 自动更新插件
autocmd('BufWritePost', {
    group = myAutoGroup,
    -- autocmd BufWritePost plugins.lua source <afile> | PackerSync
    callback = function()
        if vim.fn.expand('<afile>') == 'lua/plugins.lua' then
            vim.api.nvim_command('source lua/plugins.lua')
            vim.api.nvim_command('PackerSync')
        end
    end,
})
-- 自动清理命令行信息
vim.cmd([[" Clear cmd line message
function! s:empty_message(timer)
  if mode() ==# 'n'
    echon ''
  endif
endfunction

augroup cmd_msg_cls
    autocmd!
    autocmd CmdlineLeave :  call timer_start(3000, funcref('s:empty_message'))
augroup END]])
