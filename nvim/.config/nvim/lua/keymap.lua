require("which-key").add({
    {
        mode = "n",
        noremap = true,
        { "<leader>pv", vim.cmd.Ex, desc = "Open Netrw" }
    },
    {
        mode = "n",
        noremap = true,
        { "<leader>w", group = "[w]indow" },
        { "<leader>wh", "<C-w>h", desc = "Switch to the window to the left" },
        { "<leader>wj", "<C-w>j", desc = "Switch to the window to the bottom" },
        { "<leader>wk", "<C-w>k", desc = "Switch to the window to the top" },
        { "<leader>wl", "<C-w>l", desc = "Switch to the window to the right" }
    },
    {
        mode = "n",
        noremap = true,
        { "<leader>a", group = "[a]ction" },
        { "<leader>as", vim.lsp.buf.signature_help, desc = "[a]ction: [s]ignature help" },
        { "<leader>ad", vim.lsp.buf.definition, desc = "[a]ction: [d]efinition" },
        { "<leader>aD", vim.lsp.buf.declaration, desc = "[a]ction: [D]eclaration" },
        { "<leader>ai", vim.lsp.buf.implementation, desc = "[a]ction: [i]mplementation" },
        { "<leader>ar", vim.lsp.buf.rename, desc = "[a]ction: [r]ename" },
        { "<leader>af", function ()
                require("telescope.builtin").lsp_references(require("telescope.themes").get_dropdown({ winblend = 20 }))
            end, desc = "[a]ction: re[f]erences" },
        { "<leader>aa",function()  require("tiny-code-action").code_action() end, desc = "[a]ction: [a]ctions" }
    },
    {
        mode = "n",
        { "K", function() require("pretty_hover").hover() end, desc = "override regular hover docs with pretty hover docs" }
    }
})
