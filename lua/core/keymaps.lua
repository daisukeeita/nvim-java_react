local keymap = vim.keymap

-- Clear Highlight Search
keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { noremap = true, silent = false, desc = "Clear Highlight Search" })

-- Quick Save and Exit
keymap.set("n", "<Leader>w", "<cmd>w<CR>", { noremap = true, silent = false, desc = "Quick Save" })
keymap.set("n", "<Leader>q", "<cmd>q<CR>", { noremap = true, silent = false, desc = "Quick Exit" })

-- Copy to Clipboard
keymap.set("v", "<Leader>y", '"+y', { noremap = true, silent = false, desc = "Yank to Clipboard" })
keymap.set("n", "<Leader>y", '"+y', { noremap = true, silent = false, desc = "Yank motion to Clipboard" })
keymap.set("n", "<Leader>Y", '"+Y', { noremap = true, silent = false, desc = "Yank line to Clipboard" })

-- Paste from Clipboard
keymap.set("v", "<Leader>p", '"0p', { noremap = true, silent = false, desc = "Paste over selection from Clipboard" })
keymap.set("n", "<Leader>p", '"0p', { noremap = true, silent = false, desc = "Paste after from Clipboard" })
keymap.set("n", "<Leader>P", '"0P', { noremap = true, silent = false, desc = "Paste before from Clipboard" })

-------------------------------------------
---           TEXT NAVIGATION           ---
-------------------------------------------
-- Leap Forward
keymap.set({ "n", "x", "o" }, "<Leader>lf", function()
	require("leap").leap({ forward = true })
end, { noremap = true, silent = true, desc = "Leap Forward" })
-- Leap Backward
keymap.set({ "n", "x", "o" }, "<Leader>lb", function()
	require("leap").leap({ backward = true })
end, { noremap = true, silent = true, desc = "Leap Backward" })

-------------------------------------------
---           FILE NAVIGATION           ---
-------------------------------------------
-- Telescope
keymap.set(
	"n",
	"<Leader>ff",
	"<cmd>Telescope find_files<CR>",
	{ noremap = true, silent = false, desc = "TELESCOPE Find Files" }
)
keymap.set(
	"n",
	"<Leader>fg",
	"<cmd>Telescope live_grep<CR>",
	{ noremap = true, silent = false, desc = "TELESCOPE Live Grep" }
)

-- NVIM Tree
keymap.set(
	"n",
	"<Leader>e",
	"<cmd>NvimTreeFindFileToggle<CR>",
	{ noremap = true, silent = true, desc = "Toggle File Exploration" }
)

-------------------------------------------
---            PANE KEYMAPS             ---
-------------------------------------------
-- Pane Navigation
keymap.set("n", "<C-h>", "<C-w>h", { noremap = true, silent = false, desc = "Navigate to Left Pane" })
keymap.set("n", "<C-l>", "<C-w>l", { noremap = true, silent = false, desc = "Navigate to Right Pane" })
keymap.set("n", "<C-j>", "<C-w>j", { noremap = true, silent = false, desc = "Navigate to Bottom Pane" })
keymap.set("n", "<C-k>", "<C-w>k", { noremap = true, silent = false, desc = "Navigate to Upper Pane" })

-- Split Panes
keymap.set("n", "<leader>|", "<cmd>vsplit<CR>", { noremap = true, silent = false, desc = "Vertical Split" })
keymap.set("n", "<leader>_", "<cmd>split<CR>", { noremap = true, silent = false, desc = "Horizontal Split" })

-- Resize Panes
keymap.set("n", "<C-left>", "<cmd>vertical resize -4<CR>", {
	noremap = true,
	silent = false,
	desc = "Decrease the width of the pane",
})
keymap.set("n", "<C-right>", "<cmd>vertical resize +4<CR>", {
	noremap = true,
	silent = false,
	desc = "Increase the width of the pane",
})
keymap.set("n", "<C-up>", "<cmd>resize +4<CR>", {
	noremap = true,
	silent = false,
	desc = "Increase the height of the pane",
})
keymap.set("n", "<C-down>", "<cmd>resize -4<CR>", {
	noremap = true,
	silent = false,
	desc = "Decrease the height of the pane",
})

-------------------------------------------
---         BUFFER NAVIGATION           ---
-------------------------------------------
keymap.set("n", "<S-h>", ":bprevious<CR>", { noremap = true, silent = true, desc = "Go to previous buffer" })
keymap.set("n", "<S-l>", ":bnext<CR>", { noremap = true, silent = true, desc = "Go to next buffer" })
keymap.set("n", "<leader>bd", ":bp|bd #<CR>", { noremap = true, silent = false, desc = "Delete a buffer" })
keymap.set(
	"n",
	"<leader>bD",
	":bd|close<CR>",
	{ noremap = true, silent = false, desc = "Delete a buffer and close the window" }
)

-------------------------------------------
---       GITSIGNS NAVIGATION           ---
-------------------------------------------
keymap.set(
	"n",
	"<leader>gb",
	":Gitsigns blame_line<CR>",
	{ noremap = true, silent = false, desc = "Gitsigns blame line" }
)
keymap.set(
	"n",
	"<leader>gd",
	":Gitsigns diffthis<CR>",
	{ noremap = true, silent = false, desc = "Gitsigns differentiate" }
)
keymap.set("n", "]c", function()
	if vim.wo.diff then
		vim.cmd.normal({ "]c", bang = true })
	else
		require("gitsigns").nav_hunk("next")
	end
end, { desc = "Next Git hunk / diff change" })

keymap.set("n", "[c", function()
	if vim.wo.diff then
		vim.cmd.normal({ "[c", bang = true })
	else
		require("gitsigns").nav_hunk("prev")
	end
end, { desc = "Prev Git hunk / diff change" })

-------------------------------------------
---           TROUBLE KEYMAPS           ---
-------------------------------------------
keymap.set("n", "<Leader>xx", "<cmd>Trouble diagnostics toggle<CR>", {
	noremap = true,
	silent = false,
	desc = "Diagnostics (Trouble)",
})
keymap.set("n", "<Leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", {
	noremap = true,
	silent = false,
	desc = "Buffer Diagnostics (Trouble)",
})
keymap.set("n", "<Leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>", {
	noremap = true,
	silent = false,
	desc = "Symbols (Trouble)",
})
keymap.set("n", "<Leader>cl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", {
	noremap = true,
	silent = false,
	desc = "LSP Definitions / references / ... (Trouble)",
})
keymap.set("n", "<Leader>xL", "<cmd>Trouble loclist toggle<cr>", {
	noremap = true,
	silent = false,
	desc = "Location List (Trouble)",
})
keymap.set("n", "<Leader>xQ", "<cmd>Trouble qflist toggle<cr>", {
	noremap = true,
	silent = false,
	desc = "Quickfix List (Trouble)",
})

-------------------------------------------
---          DEBUGGER KEYMAPS           ---
-------------------------------------------
keymap.set("n", "<Leader>ds", function()
	require("lazy").load({ plugins = { "nvim-dap", "nvim-dap-ui", "nvim-dap-virtual-text" } })
	local dap = require("dap")
	local dapui = require("dapui")

	dapui.setup()
	require("nvim-dap-virtual-text").setup()

	-- Open UI automatically
	dap.listeners.after.event_initialized["dapui_config"] = function()
		dapui.open()
	end
	dap.listeners.before.event_terminated["dapui_config"] = function()
		dapui.close()
	end
	dap.listeners.before.event_exited["dapui_config"] = function()
		dapui.close()
	end

	-- Start debugging
	dap.continue()
end, { noremap = true, silent = true, desc = "DAP: Start/Continue Debug" })

keymap.set("n", "<F12>", function()
	require("dap").terminate()
end, { noremap = true, silent = true, desc = "DAP: Terminate" })

-----------------------------------------------------------------
---                        NEOTEST                            ---
-----------------------------------------------------------------
local neotest = require("neotest")

keymap.set("n", "<leader>tt", function()
	neotest.run.run()
end, { desc = "Run nearest test" })

keymap.set("n", "<leader>td", function()
	neotest.run.run({ strategy = "dap" })
end, { desc = "Debug nearest test with DAP" })

keymap.set("n", "<leader>tf", function()
	neotest.run.file()
end, { desc = "Run file test" })

keymap.set("n", "<leader>to", function()
	neotest.output.open({ enter = true })
end, { desc = "Show test output" })

keymap.set("n", "<leader>ts", function()
	neotest.summary.toggle()
end, { desc = "Toggle test summary" })

keymap.set("n", "<leader>tD", function()
	neotest.run.stop()
end, { desc = "Stop running tests" })
