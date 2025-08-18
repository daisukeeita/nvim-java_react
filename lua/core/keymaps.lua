local keymap = vim.keymap
local global = vim.g

-- Clear Highlight Search
keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { noremap = true, silent = false, desc = "Clear Highlight Search" })

-- Quick Save and Exit
keymap.set("n", "<Leader>w", "<cmd>w<CR>", { noremap = true, silent = false, desc = "Quick Save"})
keymap.set("n", "<Leader>q", "<cmd>q<CR>", { noremap = true, silent = false, desc = "Quick Exit"})

-- Copy to Clipboard
keymap.set("v", "<Leader>y", '"+y', { noremap = true, silent = false, desc = "Yank to Clipboard"})
keymap.set("n", "<Leader>y", '"+y', { noremap = true, silent = false, desc = "Yank motion to Clipboard"})
keymap.set("n", "<Leader>Y", '"+Y', { noremap = true, silent = false, desc = "Yank line to Clipboard"})

-- Paste from Clipboard
keymap.set("v", "<Leader>p", '"+p', { noremap = true, silent = false, desc = "Paste over selection from Clipboard"})
keymap.set("n", "<Leader>p", '"+p', { noremap = true, silent = false, desc = "Paste after from Clipboard"})
keymap.set("n", "<Leader>P", '"+P', { noremap = true, silent = false, desc = "Paste before from Clipboard"})

-- Paste from Clipboard - Insert Mode
keymap.set("i", "<C-r><C-p>", "<C-r>+", { noremap = true, silent = false, desc = "Paste from clipboard in insert mode"})

-------------------------------------------
---           TEXT NAVIGATION           ---
-------------------------------------------
-- Leap Forward
keymap.set(
  { "n", "x", "o" }, 
  "<Leader>lf", 
  function()
    require("leap").leap { forward = true }
  end,
  { noremap = true, silent = true, desc = "Leap Forward" }
)
-- Leap Backward
keymap.set(
  { "n", "x", "o" },
  "<Leader>lb",
  function()
    require("leap").leap { backward = true }
  end,
  { noremap = true, silent = true, desc = "Leap Backward" } 
)

-------------------------------------------
---           FILE NAVIGATION           ---
-------------------------------------------
-- Telescope
keymap.set("n", "<Leader>ff", "<cmd>Telescope find_files<CR>", { noremap = true, silent = false, desc = "TELESCOPE Find Files"})
keymap.set("n", "<Leader>fg", "<cmd>Telescope live_grep<CR>", { noremap = true, silent = false, desc = "TELESCOPE Live Grep"})

-- NVIM Tree
keymap.set("n", "<Leader>e", "<cmd>NvimTreeFindFileToggle<CR>", { noremap = true, silent = true, desc = "Toggle File Exploration"})


