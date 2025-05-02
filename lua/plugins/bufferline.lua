return {
    "akinsho/bufferline.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    event = "VeryLazy",
    config = function()
        -- Bufferline full setup with dashboard-friendly behavior
        require("bufferline").setup({
            options = {
                mode = "buffers",
                diagnostics = "nvim_lsp",
                show_buffer_close_icons = true,
                show_close_icon = false,
                separator_style = "slant",
                always_show_bufferline = false,
                offsets = {
                    {
                        filetype = "NvimTree",
                        text = "File Explorer",
                        highlight = "Directory",
                        separator = true,
                    },
                },
                custom_filter = function(bufnr)
                    local ft = vim.bo[bufnr].filetype
                    if ft == "dashboard" or ft == "" then
                        return false
                    end
                    return true
                end,
            },
        })

        vim.api.nvim_create_autocmd("BufEnter", {
            callback = function()
                local ok, bufferline_api = pcall(require, "bufferline.api")
                if ok and bufferline_api and bufferline_api.refresh then
                    bufferline_api.refresh()
                end
            end,
        })
    end,
}
