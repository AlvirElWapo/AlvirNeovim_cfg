return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({
        size = 15,
--        open_mapping = [[<leader>t]],
        direction = "float", -- or "vertical" or "float"
        shade_terminals = true,
        start_in_insert = true,
        insert_mappings = true,
        terminal_mappings = true,
        persist_size = true,
      })

      local Terminal = require("toggleterm.terminal").Terminal

      local bottom_terminal = Terminal:new({
        direction = "float",
        hidden = true,
        size = 15,
      })

      function _TOGGLE_BOTTOM_TERM()
        bottom_terminal:toggle()
      end

      local lazygit = Terminal:new({
        cmd = "lazygit",
        hidden = true,
        direction = "float",
        float_opts = {
          border = "double",
        },
      })

      function _LAZYGIT_TOGGLE()
        lazygit:toggle()
      end
    end,

  },

}



