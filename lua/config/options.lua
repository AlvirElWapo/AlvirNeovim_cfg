vim.g.mapleader = " "
vim.g.maplocalleader = " "
local o = vim.opt
vim.opt.clipboard = "unnamedplus"
local map = vim.keymap.set

vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#89b4fa", bg = "#1e1e2e", bold = true })

--  NVIMTREE  KEYBINDS
--  space + e  to toggle NvimTree
map("n", "<leader>e", ":NvimTreeFocus<CR>", { desc = "Toggle NvimTree", silent = true, noremap = true })

--  BUFFERLINE KEYBINDS
--  space +  x to close the current buffer.
vim.keymap.set("n", "<leader>x", ":bp | bd #<CR>", { desc = "Close current buffer", noremap = true, silent = true })

-- TOGGLETERM KEYBINDS 
-- space + t to create a new terminal
vim.keymap.set("n", "<leader>t", "<cmd>lua _TOGGLE_BOTTOM_TERM()<CR>", { desc = "Toggle horizontal terminal" })
-- space + h to toggle terminal view
vim.keymap.set("n", "<leader>h", "<cmd>lua _TOGGLE_BOTTOM_TERM()<CR>", { desc = "Toggle horizontal terminal" })
-- extra, space + gg opens LazyGit
vim.keymap.set("n", "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", { desc = "Toggle LazyGit" })
-- this will set the esc key when in terminal mode to go back to normal mode
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { noremap = true, silent = true })

-- COMMENTING KEYBINDS 
-- pressing spacebar+/ adds a line comment at the cursor's position
vim.keymap.set("n", "<leader>/", function()
  require("Comment.api").toggle.linewise.current()
end, { desc = "Toggle comment" })

-- spacebar+/ with a selection (visual mode) will add comments in each selected line.
vim.keymap.set("v", "<leader>/", function()
  local esc = vim.api.nvim_replace_termcodes("<ESC>", true, false, true)
  vim.api.nvim_feedkeys(esc, "nx", false)
  require("Comment.api").toggle.linewise(vim.fn.visualmode())
end, { desc = "Toggle comment (visual)", silent = true })







o.number       = true
o.relativenumber = true

o.expandtab    = true   -- use spaces, not tabs
o.shiftwidth   = 4      -- size of an indent
o.tabstop      = 4      -- number of spaces tabs count for

o.ignorecase   = true
o.smartcase    = true

o.termguicolors = true
o.cursorline    = true

