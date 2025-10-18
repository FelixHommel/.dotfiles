-- Configure command-line completion when using <TAB> key
-- full: complete to the longest mnatch and show a list of options if ambiguous
-- longest: only complete up to the longest unambiguous match
vim.opt.wildmode = { "full", "longest" }

-- Display completion matches using a popupmenu
vim.opt.wildoptions = "pum"

-- Controls behavior of the completion menu while in insert-mode autocompletion
-- menuone: show the menu even if there is only one match
-- noselect: don't preselect any mtach
-- preview: show extra info in a preview window
vim.opt.completeopt = { "menuone", "noselect", "preview" }

-- Controls whether or not the cursor can move beyond the end of lines or block selections
-- even if there's no actual text
-- block: select beyond end of line as long as block-mode is active
vim.opt.virtualedit = "block"

-- Configure which clipboard will be used
vim.opt.clipboard:append("unnamedplus")

-- Enable mouse in all modes
vim.opt.mouse = "a"

-- Enable highlighting when searching with '/' or '?'
vim.opt.hlsearch = false
-- With ignorecase and smartcase together gives case-sensitive search only when it is needed
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Popupmenu transparency
vim.opt.pumblend = 15

-- Popupmenu height => how many items will be displayed at a time
vim.opt.pumheight = 15

-- Show tabline only if there are >= 2 tabs open
vim.opt.showtabline = 1

-- Auto indent feature. Could prove more annoying then usefull. Testing for now
vim.opt.smartindent = true

-- Don't use a swapfile
vim.opt.swapfile = false

-- Enable 24-bit RGB colors
vim.opt.termguicolors = true

-- Time in ms to wait for a mapped sequence to complete
vim.opt.timeoutlen = 300

-- Automatically store undo history to an undo file
vim.opt.undofile = true

-- In insert-mode convert <TAB> to the correct amount of spaces
vim.opt.expandtab = true
-- Number of spaces to use for each step of (auto)indent
vim.opt.shiftwidth = 4
-- Number of spaces that a <TAB> in the file counts for
vim.opt.tabstop = 4

-- Show the current line number on the left
vim.opt.number = true
-- Use relative line numbering
vim.opt.relativenumber = true

-- At which character to start displaying a color column
vim.opt.colorcolumn = "110"

-- Disable word wrap
vim.opt.wrap = false

-- Configure what information is saved for a session
vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
