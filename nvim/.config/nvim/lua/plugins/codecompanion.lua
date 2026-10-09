return {
    "olimorris/codecompanion.nvim",
    version = "^19.0.0",
    opts = {
        interactions = {
            chat = {
                adapter = {
                    name = "ollama",
                    model = "qwen3-coder:30b",
                },
            },
            inline = {
                adapter = {
                    name = "ollama",
                    model = "qwen3-coder:30b",
                },
            },
        },
    },
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
    },
}
