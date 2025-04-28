return {
    "RRethy/vim-illuminate",
    event = "VeryLazy",
    config = function()
        local illuminate = require("illuminate")
        illuminate.configure({
            filetype_denylist = {
                "markdown",
                "txt"
            },
            min_count_to_highlight = 2
        })
    end
}
