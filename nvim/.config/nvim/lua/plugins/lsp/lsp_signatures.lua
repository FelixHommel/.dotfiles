return {
    "ray-x/lsp_signature.nvim",
    event = "InsertEnter",
    dependencies = {
        "folke/which-key.nvim"
    },
    opts = {
        bind = true,
        wrap = true,
        hint_enable = false,
        transparency = 5,
        handler_opts = {
            border = "rounded"
        }
    }
}
