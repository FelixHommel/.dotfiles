return {
    "aznhe21/actions-preview.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "nvim-telescope/telescope.nvim"
    },
    config = function()
        require("actions-preview").setup({
            telescope = require("telescope.themes").get_dropdown({ winblend = 20 })
        })
    end
}
