-- Initialize Lazy Plugin Manager
require("core.lazy")

-- Load Core Configurations
require("core.options")
require("core.diagnostics")
require("core.keymaps")
require("core.autocmd")

-- Load LSP Configurations
require("lsp.lua-lsp")
require("lsp.java-lsp")
