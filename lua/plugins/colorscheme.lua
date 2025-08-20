return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("catppuccin")
		end,
		opts = {
			background = {
				light = "latte",
				dark = "macchiato",
			},
			transparent_background = false,
			integrations = {
				cmp = true,
				gitsigns = true,
				nvimtree = true,
				treesitter = true,
				treesitter_context = true,
				mini = {
					enabled = true,
				},
				fidget = true,
				fzf = true,
				leap = true,
				markdown = true,
				mason = true,
				neotest = true,
				dap = true,
				dap_ui = true,
				nvim_surround = true,
				telescope = {
					enabled = true,
				},
				lsp_trouble = true,
				which_key = true,
			},
		},
	},

	{
		"folke/tokyonight.nvim",
	},

	{
		"morhetz/gruvbox",
	},
}
