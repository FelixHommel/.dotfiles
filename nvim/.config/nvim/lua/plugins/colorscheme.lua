return {
    {
        "EdenEast/nightfox.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd("colorscheme duskfox")
        end
    },
    {
        "rose-pine/neovim",
        lazy = false,
        priority = 1000,
        name = "rose-pine",
        opts = {
            styles = {
                italic = false
            }
        }
    },
    {
        'embark-theme/vim',
        lazy = false,
        priority = 1000,
        name = 'embark'
    }
}
