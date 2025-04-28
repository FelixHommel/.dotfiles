local which_key = require("which-key")

which_key.add({
    {
        -- misc
        mode = "n",
        noremap = true,
        { "<leader>pv", vim.cmd.Ex, desc = "Open Netrw" }
    },
    {
        -- window switching
        mode = "n",
        noremap = true,
        { "<leader>w", group = "[w]indow" },
        { "<leader>wh", "<C-w>h", desc = "Switch to the window to the left" },
        { "<leader>wj", "<C-w>j", desc = "Switch to the window to the bottom" },
        { "<leader>wk", "<C-w>k", desc = "Switch to the window to the top" },
        { "<leader>wl", "<C-w>l", desc = "Switch to the window to the right" }
    },
    {
        -- code folding
        mode = "n",
        noremap = true,
        { "f", group = "[f]old" },
        { "fO", require("ufo").openAllFolds, desc = "[f]old [O]pen all code" },
        { "fC", require("ufo").closeAllFolds, desc = "[f]old [C]lose all code" },
        { "fb", "za", desc = "toggle [f]old of current [b]lock" }
    },
    {
        -- flash
        mode = "n",
        noremap = true,
        { "<leader>l", group = "f[l]ash" },
        { "<leader>lj", function() require("flash").jump() end, desc = "f[l]ash [j]ump" },
        { "<leader>lt", function() require("flash").treesitter() end, desc = "f[l]ash [t]reesitter" },
        { "<leader>ls", function() require("flash").treesitter_search() end, desc = "f[l]ash treesitter [s]earch" }
    },
    {
        -- tab management
        mode = "n",
        noremap = true,
        { "<leader>t", group = "[t]ab" },
        { "<leader>tn", "<cmd>tabnew<cr>", desc = "[n]ew" },
        { "<leader>tc", "<cmd>tabclose<cr>", desc = "[c]lose" },
        { "<leader>th", "<cmd>tabprevious<cr>", desc = "go to the left tab" },
        { "<leader>tl", "<cmd>tabnext<cr>", desc = "go to the right tab" },
        { "<leader>to", function() require("telescope-tabs").list_tabs() end, desc = "[o]verview" }
    },
    {
        -- Telescope searching
        mode = "n",
        noremap = true,
        { "<leader>f", group = "[f]ind" },
        { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "[f]ile" },
        { "<leader>fs", "<cmd>Telescope live_grep<cr>", desc = "[s]tring in cwd" },
        { "<leader>ft", "<cmd>TodoTelescope<cr>", desc = "[t]odos" }
    },
    {
        mode = "n",
        noremap = true,
        { "<leader>x", group = "trouble" },
        { "<leader>xx", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer Diagnostics" },
        { "<leader>xX", "<cmd>Trouble diagnostics toggle<cr>", desc = " Diagnostics" },
        { "<leader>xq", "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix List" }
    },
    {
        mode = "n",
        { "<leader>u", group = "[u]ndotree" },
        { "<leader>ut", vim.cmd.UndotreeToggle, desc = "[u]ndotree [t]oggle" }
    },
})
