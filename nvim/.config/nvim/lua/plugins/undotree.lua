return {
    "mbbill/undotree",
    keys = {
        mode = "n",
        noremap = true,
        { "<leader>ut", vim.cmd.UndotreeToggle, desc = "[u]ndotree [t]oggle" }
    }
}
