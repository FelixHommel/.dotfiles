return {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy",
    priority = 1000, -- needs to be loaded in first
    config = function()
        require('tiny-inline-diagnostic').setup({
            preset = "modern",
            options = {
                show_source = true,
                use_icons_from_diagnostic = true,
                multiple_diag_under_cursor = true,
                multilines = true,
                show_all_diags_on_cursorline = true,
                enable_on_insert = false,

                overflow = {
                    mode = "wrap"
                }
            }
        })
        vim.diagnostic.config({ virtual_text = false })
    end
}
