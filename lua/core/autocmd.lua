-- Auto Run Linters on Save
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	callback = function()
		require("lint").try_lint()
	end,
})

-- Auto Run Formatters on Save
vim.api.nvim_create_autocmd("BufWritePre", {
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})

-- -- Open Diagnostic Float on Cursor
-- vim.api.nvim_create_autocmd({ "CursorHold" }, {
-- 	group = vim.api.nvim_create_augroup("float_diagnostic_cursor", { clear = true }),
-- 	callback = function()
-- 		vim.diagnostic.open_float(nil, { focus = false, scope = "cursor" })
-- 	end,
-- })

-- Close diagnostic float on movement or buffer/tab change
vim.api.nvim_create_autocmd({ "CursorMoved" }, {
	group = vim.api.nvim_create_augroup("close_float_diagnostic", { clear = true }),
	callback = function()
		-- Close only if a floating window exists
		for _, win in ipairs(vim.api.nvim_list_wins()) do
			local config = vim.api.nvim_win_get_config(win)
			if config.relative == "win" then -- floating window
				vim.api.nvim_win_close(win, false)
			end
		end
	end,
})
