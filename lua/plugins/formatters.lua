return {
	{
		"mfussenegger/nvim-lint",
		confing = function()
			require("lint").linters_by_ft = {
				lua = { "luacheck" },
				java = { "checkstyle" },
				javascript = { "eslint_d" },
				typescript = { "eslint_d" },
			}
		end,
	},
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { "prettier", "prettierd" },
				typescript = { "prettier", "prettierd" },
			},
		},
	},
}
