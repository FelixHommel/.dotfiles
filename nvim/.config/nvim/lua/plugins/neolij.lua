return {
    "y2w8/neolij.nvim",
    event = "VeryLazy",
    opts = {}, -- Important even if empty
    keys = {
        -- Pane and Tab navigation
        { "<A-h>", ":NeolijLeftSmart<CR>", mode = { "n", "t" }, desc = "[z]ellij move to left pane", silent = true  },
        { "<A-j>", function() require("neolij").zellij_action("move-focus down") end, mode = { "n", "t" }, desc = "[z]ellij move to down pane", silent = true  },
        { "<A-k>", function() require("neolij").zellij_action("move-focus up") end, mode = { "n", "t" }, desc = "[z]ellij move to upp pane", silent = true  },
        { "<A-l>", ":NeolijRightSmart<CR>", mode = { "n", "t" }, desc = "[z]ellij move to right pane", silent = true  },
        { "<A-f>", function () require("neolij").zellij_action("toggle-floating-panes") end, mode = { "n", "t" }, desc = "[z]ellij toggle [f]loating window", silent = true  },

        -- Tab actions
        { "<leader>ztn", ":NeolijNewTab<CR>", desc = "[z]ellij [t]ab [n]ew", silent = true  },
        { "<leader>ztr", ":NeolijRenameTab<CR>", desc = "[z]ellij [t]ab [r]ename", silent = true  },

        -- Pane actions
        { "<leader>zpn", ":NeolijNewPane -d right<CR>", desc = "[z]ellij [p]ane [n]ew to the right", silent = true  },
        { "<leader>zpN", ":NeolijNewPane -d down<CR>", desc = "[z]ellij [p]ane [n]ew to the below", silent = true  },
        { "<leader>zpf", ":NeolijNewPane -f<CR>", desc = "[z]ellij [p]ane [f]loating window new", silent = true  },
        { "<leader>zpr", ":NeolijRenamePane<CR>", desc = "[z]elli [p]ane [r]ename", silent = true  },
        { "<leader>zph", ":NeolijMovePaneLeft<CR>", desc = "[z]ellij [p]ane move to the left", silent = true  },
        { "<leader>zpj", ":NeolijMovePaneDown<CR>", desc = "[z]ellij [p]ane move down", silent = true  },
        { "<leader>zpk", ":NeolijMovePaneUp<CR>", desc = "[z]ellij [p]ane move up", silent = true  },
        { "<leader>zpl", ":NeolijMovePaneRight<CR>", desc = "[z]ellij [p]ane move to the right", silent = true  }
    }
}
