return {
	{ "neovim/nvim-lspconfig" },
	{
		"mason-org/mason.nvim",
		opts = {
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		},
	},
	{ "j-hui/fidget.nvim", opts = {} },
	{ "mfussenegger/nvim-jdtls", ft = { "java" } },
}
