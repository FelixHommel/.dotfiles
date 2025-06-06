-- Leader should be set before loading plugins to prevent them from being missconfigured
vim.g.mapleader = " "
vim.g.localmapleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
	"git",
	"clone",
	"--filter=blob:none",
	"https://github.com/folke/lazy.nvim.git",
	"--branch=stable",
	lazypath
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    { import = "plugins" },
    { import = "plugins.treesitter" },
    { import = "plugins.tests" },
    { import = "plugins.debug" },
    { import = "plugins.lsp" } }, {
        change_detection = { notify = false },
        checker = {
            enabled = true,
            notify = false
        }
})

require("options")
require("keymaps")
