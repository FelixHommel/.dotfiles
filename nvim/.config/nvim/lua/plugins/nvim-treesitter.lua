return {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    lazy = false,
    branch = "main",
    build = ":TSUpdate",
    opts = {
    	highlight = { enable = true },
        indent = { enable = true },
        ensure_installed = {
            "cpp",
            "lua",
            "query",
            "vim",
            "vimdoc"
        },
        sync_install = true,
        auto_install = true
    }
}
