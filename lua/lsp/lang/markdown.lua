-- Setup cmp
local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
local opts = {
	flags = {
		debounce_text_changes = 150,
	},
	capabilities = capabilities,
	on_attach = function(client, bufnr)
		-- 禁用格式化功能，交给专门插件处理
		client.resolved_capabilities.document_formatting = false
		client.resolved_capabilities.document_range_formatting = false

		-- 定义快捷键
		local function buf_set_keymap(...)
			vim.api.nvim_buf_set_keymap(bufnr, ...)
		end
		require("keybindings").mapLSP(buf_set_keymap)
		-- 保存时自动格式化
	end,
}
return {
	on_ready = function(server)
		server:setup(opts)
	end,
}
