local opt = vim.opt

-- Python
vim.g.python3_host_prog = "/usr/bin/python3"

-- Timeout
opt.timeout = true
opt.timeoutlen = 1000

-- Clipboard
opt.clipboard = 'unnamedplus'

-- Completion
opt.completeopt = { "menu", "menuone", "noinsert", "noselect", "preview" }
vim.bo.omnifunc = "v:lua.vim.lsp.omnifunc"

-- Cursor Line
opt.cursorline = true
opt.updatetime = 250

-- GUI Colors
opt.termguicolors = true
vim.cmd("syntax on")

-- Indenting 
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.autoindent = true
opt.expandtab = true
opt.smartindent = true

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Scrolling
opt.scrolloff = 10

-- Split Window
opt.splitbelow = true
-- Status Line
opt.showmode = false
opt.laststatus = 3
opt.cmdheight = 1

-- Tabs
opt.showtabline = 0

-- Text width
opt.linebreak = true
opt.textwidth = 80

-- Title String
opt.title = true

opt.mouse = ''

-- background
vim.o.background = "light"
