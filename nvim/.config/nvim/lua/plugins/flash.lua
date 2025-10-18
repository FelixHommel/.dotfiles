return {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
        mode = "n",
        noremap = true,
        { "<leader>l", group = "f[l]ash" },
        { "<leader>lj", function() require("flash").jump() end, desc = "f[l]ash [j]ump" },
        { "<leader>lt", function() require("flash").treesitter() end, desc = "f[l]ash [t]reesitter" },
        { "<leader>ls", function() require("flash").treesitter_search() end, desc = "f[l]ash treesitter [s]earch" }
    }
}
