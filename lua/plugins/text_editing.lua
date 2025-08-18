return {
   { 'echasnovski/mini.ai', version = '*', opts = {} },
   { 'echasnovski/mini.move', version = '*', opts = {} },
   { 'echasnovski/mini.pairs', version = '*', opts = {} },
   { 'echasnovski/mini.surround', version = '*', opts = {} }, 
   {
     'echasnovski/mini.splitjoin',
     version = '*',
     opts = {
       mappings = {
         toggle = "<Leader>tsj"
       }
     }
   },
   {
     'numToStr/Comment.nvim',
     opts = {
       toggler = {
         line = "<Leader>tlc",
         block = "<Leader>tbc"
       },
       opleader = {
         line = "<Leader>tl",
         block = "<Leader>tb",
       },
       extra = {
         above = "<Leader>aca",
         below = "<Leader>acb",
         eol = "<Leader>ace",
       },
     }
   },
}
