return {
	{ "ggandor/leap.nvim", opts = {} },
	{
		"nvim-tree/nvim-tree.lua",
		opts = {
			renderer = {
				root_folder_label = false,
				group_empty = true,
			},
			view = {
				width = 40,
				adaptive_size = true,
			},
			diagnostics = {
				enable = true,
			},
			filters = {
				git_ignored = false,
				dotfiles = false,
			},
		},
	},
	{ "folke/which-key.nvim", event = "VeryLazy", opts = {} },
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-fzf-native.nvim",
			"nvim-tree/nvim-web-devicons",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("telescope").setup({
				defaults = {
					prompt_prefix = "  ",
					selection_caret = "  ",
					sorting_strategy = "ascending",
					border = true,
					winblend = 0,
					layout_strategy = "horizontal",
					layout_config = {
						prompt_position = "bottom",
						mirror = false,
						width = 0.9,
						height = 0.8,
						preview_width = 0.55,
					},
				},
				extensions = {
					fzf = {
						fuzzy = true,
						override_generic_sorter = true,
						override_file_sorter = true,
						case_mode = "smart_case",
					},
				},
			})
			require("telescope").load_extension("fzf")
		end,
	},
}
