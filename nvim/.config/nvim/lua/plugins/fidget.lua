return {
    "j-hui/fidget.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
        notifications = {
            window = {
                avoid = {
                    "NvimTree",
                    "TestExplorer"
                }
            }
        }
    }
}
