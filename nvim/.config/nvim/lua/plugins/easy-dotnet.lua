return {
    "GustavEikaas/easy-dotnet.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim",
        "mfussenegger/nvim-dap",
    },
    opts = { lsp = { enabled = true }, picker = "telescope" },
    -- config = function()
    --     require("easy-dotnet").setup({ picker = "telescope" })
    -- end,
}
