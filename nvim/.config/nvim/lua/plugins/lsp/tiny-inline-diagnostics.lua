-- return {
--     "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
--     dependencies = {
--         "neovim/nvim-lspconfig"
--     },
--     opts = {}
-- }

return {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "BufReadPre",
    config = function()
        require("tiny-inline-diagnostic").setup({
            preset = "powerline",
            options = {
                multilines = {
                    enabled = true
                },
                add_messages = {
                    display_count = true
                },
                show_sources = {
                    enabled = true
                },
                -- Show all diagnostics on the current cursor line, not just those under the cursor
                show_all_diags_on_cursorline = true,

                -- Only show diagnostics when the cursor is directly over them, no fallback to line diagnostics
                show_diags_only_under_cursor = false,
            }
        })
        vim.diagnostic.config({ virtual_text = false }) -- Disable Neovim's default virtual text diagnostics
    end,
}
