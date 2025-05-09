return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
        flavour = "macchiato", -- Options: latte, frappe, macchiato, mocha
      integrations = {
        nvimtree = true,
        bufferline = true,
      },
    })
    vim.cmd.colorscheme("catppuccin")
  end,
}

