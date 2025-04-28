return {
    "akinsho/bufferline.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons"
    },
    config = function()
        require("bufferline").setup({
            options = {
                mode = "tabs",
                themable = true,
                numbers = "none",
                indicator = {
                    style = "underline"
                },
                diagnostics = "nvim_lsp",
                always_show_bufferline = false,
                auto_toggle_bufferline = true
            }
        })
    end
}
