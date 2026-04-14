return {
    "j-hui/fidget.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
        notification = {
            window = {
                avoid = {
                    "NvimTree",
                    "TestExplorer"
                }
            }
        }
    }
}
