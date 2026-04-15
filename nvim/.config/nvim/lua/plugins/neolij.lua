return {
    "y2w8/neolij.nvim",
    event = "VeryLazy",
    opts = {}, -- Important even if empty
    keys = {
        -- Window navigation
        { "<C-k>", ":NeolijUp<CR>", mode = { "n", "t" }, desc = "Move up", silent = true  },
        { "<C-j>", ":NeolijDown<CR>", mode = { "n", "t" }, desc = "Move down", silent = true  },
        { "<C-h>", ":NeolijLeftTab<CR>", mode = { "n", "t" }, desc = "Move left", silent = true  },
        { "<C-l>", ":NeolijRightTab<CR>", mode = { "n", "t" }, desc = "Move right", silent = true  },

        -- Tab actions
        { "<leader>zt", ":NeolijNewTab<CR>", desc = "New Zellij Tab", silent = true  },
        { "<leader>zr", ":NeolijRenameTab<CR>", desc = "Rename Zellij Tab", silent = true  },
        { "<leader>zl", ":NeolijMoveTabLeft<CR>", desc = "Move Tab Left", silent = true  },
        { "<leader>zL", ":NeolijMoveTabRight<CR>", desc = "Move Tab Right", silent = true  },

        -- Pane actions
        { "<leader>zp", ":NeolijNewPane -d right<CR>", desc = "New Zellij Pane vertical", silent = true  },
        { "<leader>zP", ":NeolijNewPane -d down<CR>", desc = "New Zellij Pane horizontal", silent = true  },
        { "<leader>zf", ":NeolijNewPane -f<CR>", desc = "New Zellij Floating Pane", silent = true  },
        { "<leader>zn", ":NeolijRenamePane<CR>", desc = "Rename Zellij Pane", silent = true  },
        { "<leader>zu", ":NeolijMovePaneUp<CR>", desc = "Move Pane Up", silent = true  },
        { "<leader>zd", ":NeolijMovePaneDown<CR>", desc = "Move Pane Down", silent = true  },
        { "<leader>zh", ":NeolijMovePaneLeft<CR>", desc = "Move Pane Left", silent = true  },
        { "<leader>zR", ":NeolijMovePaneRight<CR>", desc = "Move Pane Right", silent = true  }
    }
}
