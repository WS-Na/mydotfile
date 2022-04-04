-- 提供snippetSupport
-- 为每一个项目添加工作区
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace_dir = vim.fn.glob('~/.cache/nvim-jdtls-workspace/') .. project_name
-- cmp 自动补全
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- debug and test
local bundles = {
  vim.fn.glob("~/.local/share/nvim/lsp_servers/eclipse-jdtls/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar"),
  -- 0.36.0
};
vim.list_extend(bundles, vim.split(vim.fn.glob("/Users/naweishuai/.local/share/nvim/lsp_servers/eclipse-jdtls/vscode-java-test/server/*.jar"), "\n"))


local config = {
  -- The command that starts the language server
  -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
  cmd = {
    "/Library/Java/JavaVirtualMachines/jdk11/Contents/Home/bin/java",

    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-Xms1g',
    '-Xms4g',
    --"-javaagent:/Users/naweishuai/.local/share/nvim/lsp_servers/eclipse-jdtls/lombok.jar",
    '--add-modules=ALL-SYSTEM',
    '--add-opens', 'java.base/java.util=ALL-UNNAMED',
    '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
    -- 使用lombok
    '-javaagent:'..vim.fn.glob('~/.local/share/nvim/lsp_servers/eclipse-jdtls/lombok.jar'),
    -- '-Xbootclasspath/a:'..'/Users/naweishuai/Downloads/lombok.jar',
    '-jar',
      vim.fn.glob('~/.local/share/nvim/lsp_servers/eclipse-jdtls/plugins/org.eclipse.equinox.launcher_*.jar'),
    '-configuration',
      vim.fn.glob('~/.local/share/nvim/lsp_servers/eclipse-jdtls/config_mac'),

    '-data',workspace_dir,

  },

  root_dir = require('jdtls.setup').find_root({'.git', 'mvnw', 'gradlew'}),

  -- 配置eclipse.jdt.ls具体设置
  -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
  settings = {
    -- cmp setup
    capabilities = capabilities,

    java = {
    }
  },
  -- 使用 jar 文件的路径扩展 `bundles`
  -- 使用额外的 eclipse.jdt.ls 插件。
  -- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
  init_options = {
    bundles = bundles,
  },

  on_attach = function(client, bufnr)
    -- Debug
    require('jdtls').setup_dap({ hotcodereplace = 'auto' })
    -- java-debug discover main classes
    require('jdtls.dap').setup_dap_main_class_configs()
    -- 禁用格式化功能，交给专门插件处理
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false

    local function buf_set_keymap(...)
      vim.api.nvim_buf_set_keymap(bufnr, ...)
    end
    local function buf_set_option(...)
      vim.api.nvim_buf_set_option(bufnr, ...)
    end
    -- 启用由 <c-x><c-o> 触发的补全
    buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
    -- 绑定快捷键
    require("keybindings").mapLSP(buf_set_keymap)
    local opts = {noremap = true, silent = true}
    -- jdtls 特有快捷键
    --添加所有依赖
    buf_set_keymap("n", "<leader>jo", "<Cmd>lua require'jdtls'.organize_imports()<CR>", opts)
    -- 同步修改局部变量
    buf_set_keymap("n", "<leader>gv", "<Cmd>lua require('jdtls').extract_variable()<CR>", opts)
    buf_set_keymap("v", "<leader>gv", "<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>", opts)
    -- 同步修改常量
    buf_set_keymap("n", "<leader>gc", "<Cmd>lua require('jdtls').extract_constant()<CR>", opts)
    buf_set_keymap("v", "<leader>gc", "<Esc><Cmd>lua require('jdtls').extract_constant(true)<CR>", opts)
    -- 将一段代码提取成一个额外的函数
    buf_set_keymap("v", "<leader>gm", "<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>", opts)
    -- Debug
    buf_set_keymap("n", "<leader>df", "<Cmd>lua require'jdtls'.test_class()<CR>", opts)
    buf_set_keymap("n", "<leader>dn", "<Cmd>lua require'jdtls'.test_nearest_method()<CR>", opts)
    -- 保存时自动格式化
    vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")

    -- 目前还不太清楚的东西
    --command! -buffer -nargs=? -complete=custom,v:lua.require'jdtls'._complete_compile JdtCompile lua require('jdtls').compile(<f-args>)
    --command! -buffer -nargs=? -complete=custom,v:lua.require'jdtls'._complete_set_runtime JdtSetRuntime lua require('jdtls').set_runtime(<f-args>)
    --command! -buffer JdtUpdateConfig lua require('jdtls').update_project_config()
    --command! -buffer JdtJol lua require('jdtls').jol()
    --command! -buffer JdtBytecode lua require('jdtls').javap()
    --command! -buffer JdtJshell lua require('jdtls').jshell()
  end


}

require('jdtls').start_or_attach(config)
require'jdtls'.test_class()
require'jdtls'.test_nearest_method()
