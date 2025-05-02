-- ~/.config/nvim/init.lua

-- Load general options, keymaps, etc.
require("config.options")
require("config.lazy")

-- You could also define leader keys here if desired:
-- vim.g.mapleader = " "


vim.cmd([[
  augroup ascii_art
    autocmd!
    autocmd VimEnter * echo "  ☀️ \"Three suns. Infinite chaos. Only order can survive.\" 🔥🔥🔥   "
  augroup END
]])
