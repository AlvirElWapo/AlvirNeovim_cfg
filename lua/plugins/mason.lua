return {
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    config = true,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "angularls", -- Angular Language Server
          "ts_ls",  -- TypeScript Language Server
        },
      })
    end,
  },

  -- nvim-lspconfig: Configurations for built-in LSP client
  {
    "neovim/nvim-lspconfig",
    dependencies = { "saghen/blink.cmp" },
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require("blink.cmp").get_lsp_capabilities()

      local on_attach = function(_, bufnr)
        local opts = { buffer = bufnr, noremap = true, silent = true }
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
      end

      -- Angular Language Server setup
      lspconfig.angularls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        cmd = {
          "./node_modules/.bin/ngserver",
          "--stdio",
          "--tsProbeLocations", "./node_modules",
          "--ngProbeLocations", "./node_modules"
        },
        filetypes = { "typescript", "html", "typescriptreact", "typescript.tsx" },
        root_dir = lspconfig.util.root_pattern("angular.json", ".git"),
      })

      -- TypeScript Language Server setup
      lspconfig.ts_ls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", ".git"),
      })
    end,
  },
}
