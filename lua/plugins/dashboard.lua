return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local dashboard = require('dashboard')

    local cwd = vim.fn.getcwd()

    dashboard.setup {
      theme = 'doom',
      config = {
        header = {
"",
"",
" ▄▄▄       ██▓  ██▒   █▓ ██▓ ██▀███   ▄████▄   ▒█████   ███▄    █   █████▒██▓  ▄████   ", 
"▒████▄    ▓██▒ ▓██░   █▒▓██▒▓██ ▒ ██▒▒██▀ ▀█  ▒██▒  ██▒ ██ ▀█   █ ▓██   ▒▓██▒ ██▒ ▀▒█   ",
"▒██  ▀█▄  ▒██░  ▓██  █▒░▒██▒▓██ ░▄█ ▒▒▓█    ▄ ▒██░  ██▒▓██  ▀█ ██▒▒████ ░▒██▒▒██░▄▄░▄   ",
"░██▄▄▄▄██ ▒██░   ▒██ █░░░██░▒██▀▀█▄  ▒▓▓▄ ▄██▒▒██   ██░▓██▒  ▐▌██▒░▓█▒  ░░██░░▓█  █▓█   ",
" ▓█   ▓██▒░██████▒▒▀█░  ░██░░██▓ ▒██▒▒ ▓███▀ ░░ ████▓▒░▒██░   ▓██░░▒█░   ░██░░▒▓███▒▀   ",
" ▒▒   ▓▒█░░ ▒░▓  ░░ ▐░  ░▓  ░ ▒▓ ░▒▓░░ ░▒ ▒  ░░ ▒░▒░▒░ ░ ▒░   ▒ ▒  ▒ ░   ░▓   ░▒   ▒   ", 
"  ▒   ▒▒ ░░ ░ ▒  ░░ ░░   ▒ ░  ░▒ ░ ▒░  ░  ▒     ░ ▒ ▒░ ░ ░░   ░ ▒░ ░      ▒ ░  ░   ░   ", 
"  ░   ▒     ░ ░     ░░   ▒ ░  ░░   ░ ░        ░ ░ ░ ▒     ░   ░ ░  ░ ░    ▒ ░░ ░   ░   ", 
"      ░  ░    ░  ░   ░   ░     ░     ░ ░          ░ ░           ░         ░        ░   ", 
"",
"",
        },

 center = {

          {
            icon = '󰈞 ',
            icon_hl = 'Title',
            desc = 'OPEN FILE TREE:  [space + e]',
            desc_hl = 'String',
          },
          {
            icon = ' ',
            icon_hl = 'Title',
            desc = 'Toggle Floating Terminal: [space + h] ',
            desc_hl = 'String',
          },
          {
            icon = ' ',
            icon_hl = 'Title',
            desc = 'Open LazyGit: [space + gg]',
            desc_hl = 'String',
          },
        },
        footer = {
          "Current Working Directory: " .. cwd,
          "",
          "🌌 In Trisolaris, survival is the only science. 🧬⚙️" 
        },
      }
    }
    vim.api.nvim_set_hl(0, 'DashboardHeader', { fg = '#f9ac8d', bold = false})
  end
}
