return {
    "nvim-neotest/neotest",
    dependencies = {
        "nvim-neotest/nvim-nio",
        "nvim-lua/plenary.nvim",
        "antoinemadec/FixCursorHold.nvim",
        "nvim-treesitter/nvim-treesitter",
        "rcasia/neotest-java",
        "alfaix/neotest-gtest",
        "orjangj/neotest-ctest"
    },
    keys =  {
        {
            "<leader>ta",
            function() require("neotest").run.run(vim.fn.expand("%")) end,
            desc = "Run File"
        },
        {
            "<leader>tt",
            function() require("neotest").run.run() end,
            desc = "Run Nearest"
        },
        {
            "<leader>tw",
            function() require("neotest").run.run(vim.loop.cwd()) end,
            desc = "Run Workspace"
        },
        {
            "<leader>tr",
            function()
                -- This will only show the output from the test framework
                require("neotest").output.open({ short = true, auto_close = true })
            end,
            desc = "Results (short)",
        },
        {
            "<leader>tR",
            function()
                -- This will show the classic CTest log output.
                -- The output usually spans more than can fit the require("neotest") floating window,
                -- so using 'enter = true' to enable normal navigation within the window
                -- is recommended.
                require("neotest").output.open({ enter = true })
            end,
            desc = "Results (full)",
        }
    },
    config = function()
        require("neotest").setup({
            adapters = {
                require("neotest-java")({
                    junit_jar = nil,
                    incremental_build = true
                }),
                require("neotest-gtest").setup({}),
                require("neotest-ctest").setup({})
            }
        })
    end
}
