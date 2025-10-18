return {
    "aznhe21/actions-preview.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "nvim-telescope/telescope.nvim"
    },
    opts = {
        diff = {
            algorithm = "patience",
            ignore_whitespace = true,
        },
        telescope = require("telescope.themes").get_dropdown({ winblend = 20 })
    }
}
