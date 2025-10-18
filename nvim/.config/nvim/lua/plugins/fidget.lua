return {
    "j-hui/fidget.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
        integration = {
            ["nvim-tree"] = { enable = false },
            ["xcodebuild-nvim"] = { enable = false }
        }
    }
}
