return {
    "nvim-neotest/neotest",
    dependencies = {
        "nvim-neotest/nvim-nio",
        "nvim-lua/plenary.nvim",
        "antoinemadec/FixCursorHold.nvim",
        "nvim-treesitter/nvim-treesitter",
        "orjangj/neotest-ctest",
        "nsidorenco/neotest-vstest",
    },
    keys = {
        {
            "<leader>t",
            desc = "neotest",
        },
        {
            "<leader>ta",
            function()
                require("neotest").run.run(vim.fn.expand("%"))
            end,
            desc = "[t]est [a]ll (in current file)",
        },
        {
            "<leader>tc",
            function()
                require("neotest").run.run()
            end,
            desc = "[t]est [c]losest",
        },
        {
            "<leader>tw",
            function()
                require("neotest").run.run(vim.loop.cwd())
            end,
            desc = "[t]est [w]orkspace",
        },
        {
            "<leader>tt",
            function()
                require("neotest").output_panel.toggle()
            end,
            desc = "[t]est [t]oggle output panel",
        },
        {
            "<leader>ty",
            function()
                require("neotest").summary()
            end,
            desc = "[t]est summar[y]",
        },
        {
            "<leader>td",
            function()
                require("neotest").diagnostics()
            end,
            desc = "[t]est [d]iagnostics",
        },
    },
    config = function()
        require("neotest").setup({
            adapters = {
                require("neotest-ctest").setup({
                    dap_adapter = "codelldb",
                    is_test_file = function(filename)
                        local suffix = "Test"
                        local name = filename:match("^(.*)%.[^%.]+$") or filename

                        return name:sub(-#suffix) == suffix and vim.endswith(filename, ".cpp")
                    end,
                    frameworks = { "gtest" },
                    cmd = { "ctest", "--preset", "clang-debug" },
                }),
                require("neotest-vstest"),
            },
        })
    end,
}
