return {
    "nvim-telescope/telescope.nvim",
    event = "VeryLazy",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "folke/which-key.nvim",
        "folke/trouble.nvim",
        "nvim-tree/nvim-web-devicons",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make"
        },
        "folke/todo-comments.nvim",
    },
    config = function()
        local telescope = require("telescope")

        telescope.setup({
            defaults = {
                path_display = "smart",
            },
            pickers = {
                find_files = {
                    theme = "dropdown"
                }
            },
            extensions = {
                fzf = {}
            }
        })

        telescope.load_extension("fzf")
        telescope.load_extension("fidget")
    end
}
