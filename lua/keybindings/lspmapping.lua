--保存本地变量
local map = vim.api.nvim_set_keymap
-- 复用 opt 参数
local opt = { noremap = true, silent = true }
-- rename
map('n', '<space>rn', '<cmd>Lspsaga rename<CR>', opt)
-- code action
map('n', '<space>ja', '<cmd>Lspsaga code_action<CR>', opt)
-- go xx
map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opt)
map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opt)
map('n', 'gd', '<cmd>Lspsaga preview_definition<CR>', opt)
-- map("n", "<C-d>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1,'<c-d>')<CR>")
-- map("n", "<C-u>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1,'<c-u>')<CR>")
map('n', 'gh', '<cmd>Lspsaga hover_doc<cr>', opt)
map('n', 'gr', '<cmd>Lspsaga lsp_finder<CR>', opt)
map('n', '<space>gr', '<cmd>lua vim.lsp.buf.references()<CR>', opt)
-- diagnostic
--  map('n', 'go', '<cmd>lua vim.diagnostic.open_float()<CR>', opt)
--  map('n', 'gp', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opt)
--  map('n', 'gn', '<cmd>lua vim.diagnostic.goto_next()<CR>', opt)
map('n', '<space>gl', '<cmd>lua vim.diagnostic.setloclist()<CR>', opt)
map('n', 'go', '<cmd>Lspsaga show_line_diagnostics<CR>', opt)
map('n', 'gj', '<cmd>Lspsaga diagnostic_jump_next<cr>', opt)
map('n', 'gk', '<cmd>Lspsaga diagnostic_jump_prev<cr>', opt)
map('n', '<space>l', '<cmd>lua vim.lsp.buf.formatting()<CR>', opt)
-- space + =
map('n', '<space>jk', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opt)
-- map('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opt)
-- map('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opt)
-- map('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opt)
-- map('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opt)

-- java
map('n', '<space>jo', "<Cmd>lua require'jdtls'.organize_imports()<CR>", opt)
map('v', '<space>jo', "<Esc><Cmd>lua require'jdtls'.organize_imports()<CR>", opt)
-- 同步修改常量
map('n', '<space>jc', "<Cmd>lua require('jdtls').extract_constant()<CR>", opt)
map('v', '<space>jc', "<Esc><Cmd>lua require('jdtls').extract_constant()<CR>", opt)
-- 将一段代码提取成一个额外的函数
map('v', '<space>jm', "<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>", opt)
-- test
map('n', '<space>jf', "<Cmd>lua require'jdtls'.test_class()<CR>", opt)
map('n', '<space>jn', "<Cmd>lua require'jdtls'.test_nearest_method()<CR>", opt)
map('v', '<space>jf', "<Esc><Cmd>lua require'jdtls'.test_class()<CR>", opt)
map('v', '<space>jn', "<Esc><Cmd>lua require'jdtls'.test_nearest_method()<CR>", opt)
-- debug

map('n', '<C-j>B', ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", opt)
map('n', '<C-j><C-b>', ":lua require'dap'.toggle_breakpoint()<CR>", opt)
map('n', '<C-j>c', ":lua require'dap'.continue()<CR>", opt)
map('n', '<C-j><C-a>', ":lua require'dap'.step_over()<CR>", opt)
map('n', '<C-j><C-i>', ":lua require'dap'.step_into()<CR>", opt)
map('n', '<C-j><C-o>', ":lua require'dap'.step_out()<CR>", opt)
map('v', '<C-j><C-c>', "<Esc>:lua require'dap'.continue()<CR>", opt)
map('v', '<C-j><C-a>', "<Esc>:lua require'dap'.step_over()<CR>", opt)
map('v', '<C-j><C-i>', "<Esc>:lua require'dap'.step_into()<CR>", opt)
map('v', '<C-j><C-o>', "<Esc>:lua require'dap'.step_out()<CR>", opt)
--nnoremap <silent> <space>lp  ':lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>'
--nnoremap <silent> <space>dr  ':lua require'dap'.repl.open()<CR>'
--nnoremap <silent> <space>dl  ':lua require'dap'.run_last()<CR>'
--outline
map('n', '<space>jl', ':SymbolsOutline<CR>', opt)
