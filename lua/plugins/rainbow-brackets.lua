return{
  "HiPhish/rainbow-delimiters.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  config = function()
    require("nvim-treesitter.configs").setup {
      rainbow = {
        enable = true,
        extended_mode = true, -- Highlight non-parentheses delimiters
        max_file_lines = nil, -- Disable the limit for file lines
      },
    }
  end,
}
