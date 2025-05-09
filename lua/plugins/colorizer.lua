
return {
  "norcalli/nvim-colorizer.lua",
  config = function()
    require("colorizer").setup({
      "*", 
      css = { css = true },
      html = { names = true },
    })
  end,
}
