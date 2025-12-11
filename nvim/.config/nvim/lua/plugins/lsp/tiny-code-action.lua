-- return {
--     "aznhe21/actions-preview.nvim",
--     event = { "BufReadPre", "BufNewFile" },
--     dependencies = {
--         "nvim-telescope/telescope.nvim"
--     },
--     opts = {
--         diff = {
--             algorithm = "patience",
--             ignore_whitespace = true,
--         },
--         telescope = require("telescope.themes").get_dropdown({ winblend = 20 })
--     }
-- }

return {
    "rachartier/tiny-code-action.nvim",
    dependencies = {
        {"nvim-lua/plenary.nvim"},
        {"nvim-telescope/telescope.nvim"}
    },
    event = "LspAttach",
    opts = {
        backend = "delta",
        backend_opts = {
            delta = {
                args = {
                    "--line-numbers",
                    "--diff-so-fancy"
                }
            }
        }
    }
}
