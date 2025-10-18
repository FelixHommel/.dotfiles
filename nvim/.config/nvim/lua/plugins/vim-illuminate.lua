return {
    "RRethy/vim-illuminate",
    event = "VeryLazy",
    config = function()
        require("illuminate").configure({
            min_count_tohighlight = 2,
            filetype_denylist = {
                "txt"
            }
        })
    end
}
