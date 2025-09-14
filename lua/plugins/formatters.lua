return {
	{
		"mfussenegger/nvim-lint",
		config = function()
			require("lint").linters_by_ft = {
				lua = { "luacheck" },
				java = { "checkstyle" },
				javascript = { "eslint", "eslint_d" },
				typescript = { "eslint", "eslint_d" },
				json = { "jsonlint" },
				markdown = { "markdownlint-cli2" },
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
				markdown = { "prettier", "markdownlint-cli2" },
			},
		},
	},
}
