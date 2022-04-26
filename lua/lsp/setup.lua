local lsp_installer = require('nvim-lsp-installer')
-- 安装列表
-- https://github.com/williamboman/nvim-lsp-installer#available-lsps
-- { key: 语言 value: 配置文件 }
local servers = {
    -- lua
    sumneko_lua = require('lsp.config.lua'), -- /lua/lsp/config/lua.lua
    -- bash
    bashls = require('lsp.config.bash'),
    -- markdown
    remark_ls = require('lsp.lang.markdown'), --/lua/lsp/lang/markdown.lua
    -- xml
    lemminx = require('lsp.config.xml'),
    -- html
    html = require('lsp.config.html'),
    --emmet 增强 html tags
    emmet_ls = require('lsp.config.emmet'),
    --  css
    cssls = require('lsp.config.css'),
    -- json
    jsonls = require('lsp.config.json'),
}
-- 自动安装 Language Servers
for name, _ in pairs(servers) do
    local server_is_found, server = lsp_installer.get_server(name)
    if server_is_found then
        if not server:is_installed() then
            print('Installing ' .. name)
            server:install()
        end
    end
end

lsp_installer.on_server_ready(function(server)
    local config = servers[server.name]
    if config == nil then
        return
    end
    if type(config) == 'table' and config.on_setup then
        -- 自定义初始化配置文件必须实现on_setup 方法
        config.on_setup(server)
    else
        -- 使用默认参数
        server:setup({})
    end
end)
