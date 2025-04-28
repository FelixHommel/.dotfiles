return {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" }, -- Load only on opening a buffer or creating a new buffer
    build = ":TSUpdate",
    config = function()
        local treesitter = require("nvim-treesitter.configs")

        treesitter.setup({
            highlight = {
                enable = true
            },
            indent = {
                enable = true
            },
            ensure_installed = {
                "bash",
                "c",
                "cmake",
                "cpp",
                "cuda",
                "dockerfile",
                "gitignore",
                "glsl",
                "json",
                "lua",
                "make",
                "vim",
                "vimdoc",
                "xml",
                "yaml"
            },
            sync_install = true,
            auto_install = true,
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<Enter>",
                    node_incremental = "<Enter>",
                    scope_incremental = "<C-Enter>",
                    node_decremental = "<BS>"
                }
            },
        })
    end
}
