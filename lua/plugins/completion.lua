-- ~/.config/nvim/lua/plugins/blink_cmp.lua
return {
  'saghen/blink.cmp',
  version = '1.*',
  dependencies = {
    'rafamadriz/friendly-snippets',
    { 'saghen/blink.compat', optional = true },
  },
  event = 'InsertEnter',
  opts = {
    keymap = { preset = 'default' },
    appearance = {
      nerd_font_variant = 'normal',
    },
    completion = {
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 200,
      },
      accept = {
        auto_brackets = {
          enabled = true,
        },
      },
    },
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },
    fuzzy = {
      implementation = 'prefer_rust_with_warning',
    },
  },
  opts_extend = { 'sources.default' },
}
