return {
    "tjgao/quickbuf.nvim",
    opts = {},
    keys = {
        {
            "<leader>q",
            group = "quickbuf",
            nowait = true,
            remap = false,
        },
        {
            "<leader>qo",
            "<cmd>QuickBuf<CR>",
            desc = "[q]uickbuf [o]pen",
            nowait = true,
            remap = false,
        },
        {
            "<leader>qt",
            "<cmd>QuickBufPinToggle<CR>",
            desc = "[q]uickbuf [t]oggle pin current",
            nowait = true,
            remap = false,
        },
        {
            "<leader>qn",
            "<cmd>QuickBufNextPinned<CR>",
            desc = "[q]uickbuf [n]ext pin",
            nowait = true,
            remap = false,
        },
        {
            "<leader>qp",
            "<cmd>QuickBufPrevPinned<CR>",
            desc = "[q]uickbuf [p]revious pin",
            nowait = true,
            remap = false,
        },
    },
}
