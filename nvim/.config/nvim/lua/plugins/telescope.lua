return {
    "nvim-telescope/telescope.nvim",
    event = "VeryLazy",
    branch = "master",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "folke/which-key.nvim",
        "folke/trouble.nvim",
        "nvim-tree/nvim-web-devicons",
        "folke/todo-comments.nvim",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make"
        }
    },
    opts = {
        defaults = {
            path_display = "smart"
        },
        pickers = {
            find_files = {
                theme = "dropdown"
            }
        },
        extensions = {
            fzf = {}
        }
    },
    config = function(_, opts)
        require("telescope").setup(opts)
        require("telescope").load_extension("fzf")
        require("telescope").load_extension("fidget")
    end,
    keys = {
        mode = "n",
        noremap = true,
        { "<leader>t", group = "[t]elescope" },
        { "<leader>tf", "<cmd>Telescope find_files<cr>", desc = "[t]elescope [f]ile" },
        { "<leader>ts", "<cmd>Telescope live_grep<cr>", desc = "[t]elescope [s]earch" },
        { "<leader>tt", "<cmd>TodoTelescope<cr>", desc = "[t]elescope [t]odo" }
    }

}
