return {
  {
    "catppuccin/nvim", 
    name = "catppuccin", 
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("catppuccin")
    end,
    opts = {
      background = {
        light = "latte",
        dark = "macchiato"
      },
      transparent_background = false,
    }
  },

  {
    "folke/tokyonight.nvim",
  },

  {
    "morhetz/gruvbox",
  },
} 
