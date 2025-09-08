return {
	{
		"epwalsh/obsidian.nvim",
		version = "*",
		lazy = true,
		ft = "markdown",
		dependencies = {
			"hrsh7th/nvim-cmp",
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		opts = {
			workspaces = {
				{
					name = "Personal",
					path = "/path/to/personal/Vault",
				},
			},
			daily_notes = {
				folder = "00-09 Vault Administration/01 Inbox/01.01 Daily Action",
				date_format = "%YYYY-%MM-%DD",
				default_tags = { "daily-actions" },
				-- TODO: Update the template later
				template = nil,
			},
			completion = {
				nvim_cmp = true,
			},
			mappings = {},
		},
	},
	{
		"tadmccorkle/markdown.nvim",
		lazy = true,
		ft = "markdown",
		opts = {
			mappings = false,
			inline_surround = false,
		},
	},
	{
		"MeanderingProgrammer/render-markdown.nvim",
		ft = "markdown",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
		opts = {
			completion = {
				lsp = { enabled = true },
			},
		},
	},
}
