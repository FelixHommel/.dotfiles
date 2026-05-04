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
            cpp = { "clang-format" },
            rust = { "rustfmt", lsp_format = "fallback" }
        }
    }
}
