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
keymap.set("v", "<Leader>p", '"+p', { noremap = true, silent = false, desc = "Paste over selection from Clipboard" })
keymap.set("n", "<Leader>p", '"+p', { noremap = true, silent = false, desc = "Paste after from Clipboard" })
keymap.set("n", "<Leader>P", '"+P', { noremap = true, silent = false, desc = "Paste before from Clipboard" })

-- Paste from Clipboard - Insert Mode
keymap.set(
	"i",
	"<C-r><C-p>",
	"<C-r>+",
	{ noremap = true, silent = false, desc = "Paste from clipboard in insert mode" }
)

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
keymap.set("n", "<leader>bd", ":bp|bd #<CR>", { noremap = true, silent = false, desc = "Delete a buffer" }) -- Delete a buffer

-------------------------------------------
---       GITSIGNS NAVIGATION           ---
-------------------------------------------
keymap.set(
	"n",
	"<leader>gs",
	":Gitsigns stage_hunk<CR>",
	{ noremap = true, silent = false, desc = "Gitsigns stage hunk" }
)
keymap.set(
	"n",
	"<leader>gu",
	":Gitsigns undo_stage_hunk<CR>",
	{ noremap = true, silent = false, desc = "Gitsigns undo stage hunk" }
)
keymap.set(
	"n",
	"<leader>gr",
	":Gitsigns reset_hunk<CR>",
	{ noremap = true, silent = false, desc = "Gitsigns reset stage hunk" }
)
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
keymap.set("n", "]c", "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", { expr = true, desc = "Gitsigns next hunk" })
keymap.set("n", "[c", "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", { expr = true, desc = "Gitsigns previous hunk" })

