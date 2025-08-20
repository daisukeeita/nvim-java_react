return {
	{
		"mfussenegger/nvim-lint",
		confing = function()
			require("lint").linters_by_ft = {
				lua = { "luacheck" },
				java = { "checkstyle" },
			}
		end,
	},
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
			},
		},
	},
}
