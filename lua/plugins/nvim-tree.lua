-- ~/.config/nvim/lua/plugins/nvim-tree.lua
return {
  {
    "nvim-tree/nvim-tree.lua",
    lazy = true,
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      -- disable netrw at the very start
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1

      -- set up nvim-tree
      require("nvim-tree").setup({
        update_focused_file = {
          enable = true,
          update_root = true,
        },
        view = {
          width = 30,
          side = "left",
        },
        renderer = {
          highlight_git = true,
          highlight_opened_files = "all",
          icons = {
            show = {
              file = true,
              folder = true,
              folder_arrow = true,
              git = true,
            },
          },
        },
        on_attach = function(bufnr)
          local api = require("nvim-tree.api")
          local opts = { buffer = bufnr, noremap = true, silent = true, nowait = true }

          -- ENABLING DEFAULT KEYBINDS FIRST 
          api.config.mappings.default_on_attach(bufnr)

          -- Existing mappings
          vim.keymap.set('n', '<CR>', api.node.open.edit, opts)
          vim.keymap.set('n', 'o', api.node.open.edit, opts)
          vim.keymap.set('n', '<2-LeftMouse>', api.node.open.edit, opts)
          vim.keymap.set('n', 'h', api.node.navigate.parent_close, opts)
          vim.keymap.set('n', 'v', api.node.open.vertical, opts)

          vim.keymap.set('n', 'q', api.tree.close, opts)

          -- Cycle through buffers
          vim.keymap.set("n", "<Tab>", ":bnext<CR>", { desc = "Next Buffer", noremap = true, silent = true })
          vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", { desc = "Previous Buffer", noremap = true, silent = true })



        end,
      })
    end,
  },
}

