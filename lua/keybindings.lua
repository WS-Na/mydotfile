-- leader Key
vim.g.mapleader = " "
vim.g.maplocalleader = " "
--保存本地变量
local map = vim.api.nvim_set_keymap
-- 复用 opt 参数
local opt = {noremap = true, silent = true }

-- 小提示
-- In visual mode, start a search with * or # using the current selection

-- windows control

-- windows 分屏快捷键
map("n", "sv", ":vsp<CR>", opt)
map("n", "sh", ":sp<CR>", opt)
-- 关闭当前
map("n", "sc", "<C-w>c", opt)
-- 关闭其他jk
map("n", "so", "<C-w>o", opt)

-- 左右比例控制
map("n", "˚∆", ":vertical resize -6<CR>", opt)
map("n", "∆˚", ":vertical resize +6<CR>", opt)
map("n", "s,", ":vertical resize -20<CR>", opt)
map("n", "s.", ":vertical resize +20<CR>", opt)
-- 上下比例
map("n", "sj", ":resize +4<CR>", opt)
map("n", "sk", ":resize -4<CR>", opt)
map("n", "<C-Down>", ":resize +2<CR>", opt)
map("n", "<C-Up>", ":resize -2<CR>", opt)
-- 等比例
map("n", "s=", "<C-w>=", opt)
-- 窗口移动
map("n", "ss", "<C-w>", opt)
map("n", "ƒ", "<C-w>", opt)



-- Terminal Mode
map("n", "<leader>t", ":Lspsaga open_floaterm<CR>", opt)
map("n", "<leader>vt", ":vsp | terminal<CR>", opt)
map("t", "<Esc>", "<C-\\><C-n>", opt)
map("t", "<leader>t", "<C-\\><C-n>:Lspsaga close_floaterm<CR>", opt)
map("t", "jj", "<C-\\><C-n>", opt)
map("t", "<C-h>", [[ <C-\><C-N><C-w>h ]], opt)
map("t", "<C-j>", [[ <C-\><C-N><C-w>j ]], opt)
map("t", "<C-n>", [[ <C-\><C-N><C-w>k ]], opt)
map("t", "<C-l>", [[ <C-\><C-N><C-w>l ]], opt)


-- VISUAL Mode
map("v", "v", "<Esc>", opt)
map("v", ";", "$", opt)
map("v", "z", "b", opt)
map("v", "0", "^", opt)
map("v", "J", "5j", opt)
map("v", "K", "5k", opt)


-- visual模式下缩进代码
map("v", "<", "<gv", opt)
map("v", ">", ">gv", opt)

-- 上下移动选中文本
map("v", "J", ":move '>+1<CR>gv-gv", opt)
map("v", "K", ":move '<-2<CR>gv-gv", opt)



-- Insert Mode
map("i", "jj", "<Esc>", opt)
map("i", "{", "{}<Esc>i", opt)
map("i", "''", "{}<Esc>i", opt)
map("i", "mm", "()<Esc>i",opt)
map("i", "[", "[]<Esc>i", opt)
map("i", "<", "<><Esc>i", opt)
map("i", "\"", "\"\"<Esc>i", opt)
map("i", "uu", "<BackSpace><BackSpace>", opt)
map("i", "zz", "<Esc><End>a;<Esc>", opt)
map("i", "kk", "=", opt)
map("i", "vv", "<Esc>ea<Space>", opt)



map("n", "q", "<End>", opt)

-- Normal Mode
map("n", ";", "<End>", opt)
map("n", "9", ";", opt)
map("n", "8", "%", opt)
map("n", "0", "^", opt)
map("n", "J", "<pageDown>", opt)
map("n", "K", "<pageUp>", opt)
map("n", "H", "25h", opt)
map("n", "L", "25l", opt)
map("n", "z", "b", opt)
map("n", "<leader>q", ":q<CR>", opt)
map("n", "q1", ":q!<CR>", opt)
map("n", "<leader>z", ":ZenMode<CR>", opt)
map("n", "<leader>w", ":w<CR>", opt)

-- 回到上次编辑的地方
map("n", "'", "`", opt)

-- 快速复制
map("n", "y;", "y$", opt)
-- 快速删除
map("n", "d;", "d$", opt)
map("n", "dz", "db", opt)

-- 宏录制
map("n", "<C-q>", "q", opt)

-- Command Mode
map("c", "uu", "<C-w>", opt)
map("c", "jj", "<Esc>", opt)
map("c", "<C-j>", "<Tab>", opt)
map("c", "<C-i>", "<Up>", opt)



----------------- 插件快捷键-------------------------------
local pluginKeys = {}

-- nvim-treesitter 代码格式化
map("n", "<leader>i", "gg=G`'", opt)

----------------- bufferline-------------------------------
-- 左右Tab切换
map("n", "<C-h>", ":BufferLineCyclePrev<CR>", opt)
map("n", "<C-l>", ":BufferLineCycleNext<CR>", opt)
-- 关闭
--"moll/vim-bbye"
map("n", "˚z", ":w<CR>:Bdelete!<CR>", opt)
map("n", "<leader>bl", ":BufferLineCloseRight<CR>", opt)
map("n", "<leader>bh", ":BufferLineCloseLeft<CR>", opt)
map("n", "<leader>bc", ":BufferLinePickClose<CR>", opt)

----------------- Telescope-------------------------------
-- 查找文件
map("n", "<leader>p", ":Telescope find_files<CR>", opt)
-- 全局搜索
map("n", "<leader>f", ":Telescope live_grep<CR>", opt)
-- extension
map("n", "<leader>d", ":Telescope dash search<CR>", opt)
-- Telescope 列表中 插入模式快捷键
pluginKeys.telescopeList = {
  i = {
    -- 上下移动
    ["<C-j>"] = "move_selection_next",
    ["<C-i>"] = "move_selection_previous",
    ["<Down>"] = "move_selection_next",
    ["<Up>"] = "move_selection_previous",
    -- 历史记录
    ["˚n"] = "cycle_history_next",
    ["˚p"] = "cycle_history_prev",
    -- 分屏打开
    ["<C-h>" ] = "select_horizontal",
    ["<C-v>" ] = "select_vertical",
    ["<C-t>" ] = "select_tab",
    -- 关闭窗口
    ["<C-c>"] = "close",
    -- 预览窗口上下滚动
    ["<C-u>"] = "preview_scrolling_up",
    ["<C-d>"] = "preview_scrolling_down",
  },
}
----------------- nvim-tree -------------------------------
-- ctal + n 键打开关闭tree
map("n", "<C-n>", ":NvimTreeToggle<CR>", opt)
map("n", "<C-->", "<C-x>", opt)
-- 列表快捷键
pluginKeys.nvimTreeList = {
  -- 打开文件或文件夹
{ key = {"<CR>", "o", "<2-LeftMouse>"}, action = "edit" },
  -- 分屏打开文件
{ key = "v", action = "vsplit" },
{ key = "h", action = "split" },
  -- 显示隐藏文件
{ key = "i", action = "toggle_ignored" }, -- Ignore (node_modules)
{ key = ".", action = "toggle_dotfiles" }, -- Hide (dotfiles)
  -- 文件操作
{ key = "R", action = "refresh" },
{ key = "a", action = "create" },
{ key = "d", action = "remove" },
{ key = "r", action = "rename" },
{ key = "x", action = "cut" },
{ key = "y", action = "copy_name" },
{ key = "Y", action = "copy_path" },
{ key = "c", action = "copy" },
{ key = "p", action = "paste" },
{ key = "s", action = "system_open" },
{ key = "q", action = "close" },
{ key = "<Tab>", action = "preview" },
{ key = "<BS>", action = "close_node" },
}
-------------------lsp快捷键---------------------------------------
-- lsp 回调函数快捷键设置
pluginKeys.mapLSP = function(mapbuf)
  -- rename
  mapbuf("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opt)
  -- code action
  mapbuf("n", "<leader>ja", "<cmd>Lspsaga code_action<CR>", opt)
  -- go xx
  mapbuf('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opt)
  mapbuf('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opt)
  mapbuf("n", "gd", "<cmd>Lspsaga preview_definition<CR>", opt)
  mapbuf("n", "gh", "<cmd>Lspsaga hover_doc<cr>", opt)
  mapbuf("n", "gr", "<cmd>Lspsaga lsp_finder<CR>", opt)
 mapbuf("n", "<leader>gr", "<cmd>lua vim.lsp.buf.references()<CR>", opt)
  -- diagnostic
  --  mapbuf('n', 'go', '<cmd>lua vim.diagnostic.open_float()<CR>', opt)
  --  mapbuf('n', 'gp', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opt)
  --  mapbuf('n', 'gn', '<cmd>lua vim.diagnostic.goto_next()<CR>', opt)
  mapbuf('n', '<leader>gl', '<cmd>lua vim.diagnostic.setloclist()<CR>', opt)
  mapbuf("n", "go", "<cmd>Lspsaga show_line_diagnostics<CR>",opt)
  mapbuf("n", "gj", "<cmd>Lspsaga diagnostic_jump_next<cr>", opt)
  mapbuf("n", "gk", "<cmd>Lspsaga diagnostic_jump_prev<cr>", opt)
  mapbuf("n", "<leader>l", "<cmd>lua vim.lsp.buf.formatting()<CR>", opt)
  -- leader + =
  mapbuf('n', '<leader>jk', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opt)
  -- mapbuf('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opt)
  -- mapbuf('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opt)
  -- mapbuf('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opt)
  -- mapbuf('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opt)
end

------------------------------ cmp自动补全 --------------------------
-- nvim-cmp 自动补全
pluginKeys.cmp = function(cmp)

  local feedkey = function(key, mode)
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
  end
  local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
  end

  return {
    ['<C-k>'] = cmp.config.disable,
    -- 上一个
    ["<C-i>"] = cmp.mapping.select_prev_item(),
    -- 下一个
    ["<C-j>"] = cmp.mapping.select_next_item(),
    -- 出现补全
    ["<C-e>"] = cmp.mapping(cmp.mapping.complete(), {"i", "c"}),
    -- 取消
    ["<C-s>"] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close()
    }),
    -- 确认
    -- Accept currently selected item. If none selected, `select` first item.
    -- Set `select` to `false` to only confirm explicitly selected items.
    ["<CR>"] = cmp.mapping.confirm({
      select = true,
      behavior = cmp.ConfirmBehavior.Replace
    }),
    -- ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    -- 如果窗口内容太多，可以滚动
    ["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), {"i", "c"}),
    ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), {"i", "c"}),
    -- snippets 跳转
    ["<C-l>"] = cmp.mapping(function(_)
      if vim.fn["vsnip#available"](1) == 1 then
        feedkey("<Plug>(vsnip-expand-or-jump)", "")
      end
    end, {"i", "s"}),
    ["<C-h>"] = cmp.mapping(function()
      if vim.fn["vsnip#jumpable"](-1) == 1 then
        feedkey("<Plug>(vsnip-jump-prev)", "")
      end
    end, {"i", "s"}),

    -- super Tab
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif vim.fn["vsnip#available"](1) == 1 then
        feedkey("<Plug>(vsnip-expand-or-jump)", "")
      elseif has_words_before() then
        cmp.complete()
      else
        fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
      end
    end, {"i", "s"}),

    ["<S-Tab>"] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_prev_item()
      elseif vim.fn["vsnip#jumpable"](-1) == 1 then
        feedkey("<Plug>(vsnip-jump-prev)", "")
      end
    end, {"i", "s"})
    -- end of super Tab
  }
end
-----------------------------------------------------------------
return pluginKeys
-----------------------------------------------------------------
