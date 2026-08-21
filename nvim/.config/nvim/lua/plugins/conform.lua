vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function(args)
        require("conform").format({ bufnr = args.buf })
    end,
})

return {
    "stevearc/conform.nvim",
    opts = {
        formatters_by_ft = {
            cmake = { "gersemi" },
            cuda = { "clang-format" },
            cpp = { "clang-format" },
            cs = { "csharpier" },
            lua = { "stylua" },
            python = { "ruff_format" },
            rust = { "rustfmt", lsp_format = "fallback" },
            typst = { "typstyle" },
        },
    },
}
