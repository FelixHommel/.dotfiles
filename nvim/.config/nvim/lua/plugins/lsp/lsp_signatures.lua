return {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    dependencies = {
        "folke/which-key.nvim"
    },
    opts = {
        hint_prefix = "",
        transparency = 10,
        toggle_key = "<M-l>",
        select_signature_key = "<M-e>",
        handler_opts = {
            border = "single"
        }
    }
}
