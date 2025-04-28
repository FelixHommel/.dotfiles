return {
    "p00f/clangd_extensions.nvim",
    event = { "BufReadPre", "BufNewFile" },
    ft = { "c", "cpp", "h", "hpp", "cuda" },
    opts = {
        inlay_hints = {
            only_current_line = true,
            only_current_line_autocmd = { "CursorHold" }
        }
    }
}
