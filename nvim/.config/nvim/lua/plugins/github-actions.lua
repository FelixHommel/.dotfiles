return {
    'skanehira/github-actions.nvim',
    lazy = true,
    ft = { "yaml" },
    dependencies = {
        'nvim-treesitter/nvim-treesitter',
        'nvim-telescope/telescope.nvim'
    },
    opts = {
        highlight_colors = {
            success = { fg = '#10b981', bold = true },
            failure = { fg = '#ef4444', bold = true },
            cancelled = { fg = '#6b7280', bold = true },
            running = { fg = '#f59e0b', bold = true },
            queued = { fg = '#8b5cf6', bold = true }
        }
    }
}
