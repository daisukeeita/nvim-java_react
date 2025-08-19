-- Auto Run Linters on Save
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	callback = function()
		require("lint").try_lint()
	end,
})

-- Auto Run Formatters on Save
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})

-- Open Diagnostic Float on Cursor
vim.api.nvim_create_autocmd({ "CursorHold" }, {
	group = vim.api.nvim_create_augroup("float_diagnostic_cursor", { clear = true }),
	callback = function()
		vim.diagnostic.open_float(nil, { focus = false, scope = "cursor" })
	end,
})

-- Add key maps once LSP has been attached
vim.api.nvim_create_autocmd("LspAttach", {
	desc = "LSP actions",
	callback = function(event)
		local opts = { buffer = event.buf }

		vim.keymap.set(
			"n",
			"K",
			"<cmd>lua vim.lsp.buf.hover()<cr>",
			{ noremap = true, silent = true, desc = "LSP: Hover" }
		)
		vim.keymap.set(
			"n",
			"gd",
			"<cmd>lua vim.lsp.buf.definition()<cr>",
			{ noremap = true, silent = true, desc = "LSP: Definition" }
		)
		vim.keymap.set(
			"n",
			"gD",
			"<cmd>lua vim.lsp.buf.declaration()<cr>",
			{ noremap = true, silent = true, desc = "LSP: Declaration" }
		)
		vim.keymap.set(
			"n",
			"gi",
			"<cmd>lua vim.lsp.buf.implementation()<cr>",
			{ noremap = true, silent = true, desc = "LSP: Implementation" }
		)
		vim.keymap.set(
			"n",
			"go",
			"<cmd>lua vim.lsp.buf.type_definition()<cr>",
			{ noremap = true, silent = true, desc = "LSP: Type Definition" }
		)
		vim.keymap.set(
			"n",
			"<Leader>fr",
			"<cmd>Telescope lsp_references<cr>",
			{ noremap = true, silent = true, desc = "LSP: Find References" }
		)
		vim.keymap.set(
			"n",
			"gs",
			"<cmd>lua vim.lsp.buf.signature_help()<cr>",
			{ noremap = true, silent = true, desc = "LSP: Signature Help" }
		)
		vim.keymap.set(
			"n",
			"<F2>",
			"<cmd>lua vim.lsp.buf.rename()<cr>",
			{ noremap = true, silent = true, desc = "LSP: Rename" }
		)
		vim.keymap.set(
			{ "n", "x" },
			"<F3>",
			"<cmd>lua vim.lsp.buf.format({async = true})<cr>",
			{ noremap = true, silent = true, desc = "LSP: Format" }
		)
		vim.keymap.set(
			"n",
			"<F4>",
			"<cmd>lua vim.lsp.buf.code_action()<cr>",
			{ noremap = true, silent = true, desc = "LSP: Code Action" }
		)
	end,
})
