local capabilities = require("cmp_nvim_lsp").default_capabilities()
local navic = require("nvim-navic")

local on_attach = function(client, bufnr)
	if client.server_capabilities.documentSymbolProvider then
		navic.attach(client, bufnr)
	end
	if client.server_capabilities.inlayHintProvider then
		vim.lsp.inlay_hint.enable(true, { bufnr })
	end
end

vim.lsp.config("lua_ls", {
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
		Lua = {
			runtime = { version = "LuaJIT" },
			workspace = {
				checkThirdParty = false,
				library = { vim.env.VIMRUNTIME, vim.api.nvim_get_runtime_file("", true) },
			},
			diagnostics = {
				globals = { "vim" },
			},
			telemetry = { enable = false },
			completion = {
				callSnippet = "Both",
				keywordSnippet = "Both",
				workspaceWord = true,
			},
			hint = {
				enable = true,
				paramType = false,
				semicolon = false,
				setType = true,
				arrayIndex = false,
			},
		},
	},
})

vim.lsp.enable("lua_ls")
