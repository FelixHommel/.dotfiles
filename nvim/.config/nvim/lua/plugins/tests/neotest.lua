return {
    "nvim-neotest/neotest",
    dependencies = {
        "nvim-neotest/nvim-nio",
        "nvim-lua/plenary.nvim",
        "antoinemadec/FixCursorHold.nvim",
        "nvim-treesitter/nvim-treesitter",
        "alfaix/neotest-gtest",
        "rcasia/neotest-java"
    },

    config = function ()
        require("neotest").setup({
            adapters = {
                require("neotest-gtest").setup({
                    root = require("neotest.lib").files.match_root_pattern(
                        ".git",
                        ".clang_tidy",
                        ".clang_format"
                    )
                }),
                require("neotest-java")
            }
        })
    end
}
