return {
    "LukasPietzschmann/telescope-tabs",
    event = "VeryLazy",
    dependencies = {
        "nvim-telescope/telescope.nvim",
        "nanozuki/tabby.nvim"
    },
    config = function()
        require("telescope").load_extension("telescope-tabs")
        require("telescope-tabs").setup({})
    end
}
