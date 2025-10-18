return {
    "Badhi/nvim-treesitter-cpp-tools",
    commit = "1e45897c256568a9981038400d4419db7833e83f", -- https://github.com/Badhi/nvim-treesitter-cpp-tools/issues/52
    event = "VeryLazy",
    ft = { "c", "h", "cpp", "hpp", "cu" },
    dependencies = {
        "nvim-treesitter/nvim-treesitter"
    },
    opts = {
        header_extension = { "hpp", "h" },
        source_extension = { "cpp", "c" }
    }
    -- keys: tab to accept, q to discard
}
