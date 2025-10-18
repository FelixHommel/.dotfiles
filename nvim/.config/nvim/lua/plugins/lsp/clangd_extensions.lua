require("which-key").add({
    { "<leader>sf", "<cmd>ClangdSwitchSourceHeader<cr>", desc = "[s]witch [f]ile (Source/Header)" }
})

return {
    "p00f/clangd_extensions.nvim",
    event = { "BufReadPre", "BufNewFile" },
    ft = { "c", "h", "cpp", "hpp", "cu" },
    opts = {
        inlay_hints = {
            only_current_line = true,
            only_current_line_autocmd = { "CursorHold" }
        }
    }
}
