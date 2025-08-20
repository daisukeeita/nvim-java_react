return {
	-- Buffers
	{
		"akinsho/bufferline.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
		event = "VeryLazy",
		config = function()
			require("bufferline").setup({
				highlights = require("catppuccin.groups.integrations.bufferline").get_theme({
					styles = { "italic", "bold" },
				}),
			})
		end,
	},

	-- Status Line
	{
		"nvim-lualine/lualine.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
		event = "VeryLazy",
		config = function()
			local lualine = require("lualine")

			local function lsp_attached()
				local clients = vim.lsp.get_clients()
				local buf_ft = vim.bo.filetype
				local lsp_names = {}

				for _, client in pairs(clients) do
					if client.attached_buffers[vim.api.nvim_get_current_buf()] then
						table.insert(lsp_names, client.name)
					end
				end

				return #lsp_names > 0 and "  " .. table.concat(lsp_names, ", ") or "No LSP"
			end

			lualine.setup({
				options = {
					theme = "catppuccin",
					section_separators = { left = "", right = "" },
					component_separators = { left = "", right = "" },
				},
				sections = {
					lualine_a = { { "mode", icon = "" } },
					lualine_b = { "branch", "diff", "diagnostics" },
					lualine_c = { lsp_attached },
					lualine_x = { "encoding", "fileformat", "filetype" },
					lualine_y = { "progress" },
					lualine_z = { { "location", icon = "" } },
				},
				inactive_sessions = {
					lualine_c = { "filename" },
					lualine_x = { "location" },
				},
			})
		end,
	},

	-- Indentation
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		---@module "ibl"
		---@type ibl.config
		opts = {},
	},

	-- Diagnostic UI
	{
		"folke/trouble.nvim",
		opts = {}, -- for default options, refer to the configuration section for custom setup.
		cmd = "Trouble",
	},
}
