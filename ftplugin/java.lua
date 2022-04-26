-- 提供snippetSupport
-- 为每一个项目添加工作区
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace_dir = vim.fn.glob('~/.cache/nvim-jdtls-workspace/') .. project_name
-- cmp 自动补全
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- debug and test
local bundles = {
    vim.fn.glob(
        '~/.local/share/nvim/lsp_servers/eclipse-jdtls/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar'
    ),
    -- 0.36.0
}
vim.list_extend(
    bundles,
    vim.split(vim.fn.glob('~/.local/share/nvim/lsp_servers/eclipse-jdtls/vscode-java-test/server/*.jar'), '\n')
)

local config = {
    -- The command that starts the language server
    -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
    cmd = {
        '/Library/Java/JavaVirtualMachines/jdk11/Contents/Home/bin/java',

        '-Declipse.application=org.eclipse.jdt.ls.core.id1',
        '-Dosgi.bundles.defaultStartLevel=4',
        '-Declipse.product=org.eclipse.jdt.ls.core.product',
        '-Dlog.protocol=true',
        '-Dlog.level=ALL',
        '-Xms1g',
        '-Xms4g',
        '--add-modules=ALL-SYSTEM',
        '--add-opens',
        'java.base/java.util=ALL-UNNAMED',
        '--add-opens',
        'java.base/java.lang=ALL-UNNAMED',
        -- 使用lombok
        '-javaagent:' .. vim.fn.glob('~/.local/share/nvim/lsp_servers/eclipse-jdtls/lombok.jar'),
        -- '-Xbootclasspath/a:'..'/Users/naweishuai/Downloads/lombok.jar',
        '-jar',
        vim.fn.glob('~/.local/share/nvim/lsp_servers/eclipse-jdtls/plugins/org.eclipse.equinox.launcher_*.jar'),
        '-configuration',
        vim.fn.glob('~/.local/share/nvim/lsp_servers/eclipse-jdtls/config_mac'),

        '-data',
        workspace_dir,
    },

    root_dir = require('jdtls.setup').find_root({ '.git', 'mvnw', 'gradlew', 'pom.xml' }),

    -- 配置eclipse.jdt.ls具体设置
    -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
    settings = {
        -- cmp setup
        capabilities = capabilities,

        java = {
            configuration = {
                -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
                -- And search for `interface RuntimeOption`
                -- The `name` is NOT arbitrary, but must match one of the elements from `enum ExecutionEnvironment` in the link above
                runtimes = {
                    {
                        name = 'JavaSE-11',
                        path = vim.fn.glob('/Library/Java/JavaVirtualMachines/jdk11/Contents/Home'),
                    },
                    {
                        name = 'JavaSE-17',
                        path = vim.fn.glob('/Library/Java/JavaVirtualMachines/jdk17/Contents/Home'),
                    },
                    {
                        name = 'JavaSE-8',
                        path = vim.fn.glob('/Library/Java/JavaVirtualMachines/jdk8/Contents/Home'),
                    },
                },
            },
        },
    },
    -- 使用 jar 文件的路径扩展 `bundles`
    -- 使用额外的 eclipse.jdt.ls 插件。
    -- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
    init_options = {
        bundles = bundles,
    },

    on_attach = function(client) -- bufnr
        -- Debug
        require('jdtls').setup_dap({ hotcodereplace = 'auto' })
        -- java-debug discover main classes
        require('jdtls.dap').setup_dap_main_class_configs()
        -- 禁用格式化功能，交给专门插件处理
        client.resolved_capabilities.document_formatting = false
        client.resolved_capabilities.document_range_formatting = false

        vim.cmd('autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()')
        -- use eclipse
        vim.cmd("command! -buffer JdtCompile lua require('jdtls').compile()")
        vim.cmd("command! -buffer JdtUpdateConfig lua require('jdtls').update_project_config()")
        vim.cmd("command! -buffer JdtJol lua require('jdtls').jol()")
        vim.cmd("command! -buffer JdtBytecode lua require('jdtls').javap()")
        vim.cmd("command! -buffer JdtJshell lua require('jdtls').jshell()")
        vim.cmd([[setlocal shiftwidth=4]])
        vim.cmd([[setlocal tabstop=4]])
    end,
}

require('jdtls').start_or_attach(config)
require('jdtls').test_class()
require('jdtls').test_nearest_method()
