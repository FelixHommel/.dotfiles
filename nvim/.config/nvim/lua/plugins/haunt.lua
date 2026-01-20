return {
    "TheNoeTrevino/haunt.nvim",
    dependencies = {
        "folke/snacks.nvim"
    },
    opts = {
        sign_hl = "DiagnosticInfo",
        virt_text_hl = "HauntAnnotation",
        virt_text_pos = "eol"
    },
    keys = {
        -- TODO: Remove harpoon. This is better. Change u prefix to h
        {
            "<leader>u",
            group = "Ha[u]nt",
            nowait = true,
            remap = false
        },
        {
            "<leader>ua",
            function() require("haunt.api").annotate() end,
            desc = "ha[u]nt [a]nnotate",
            nowait = true,
            remap = false
        },
        {
            "<leader>uT",
            function() require("haunt.api").toggle_annotation() end,
            desc = "ha[u]nted [T]oggle annotation",
            nowait = true,
            remap = false
        },
        {
            "<leader>ud",
            function() require("haunt.api").delete() end,
            desc = "ha[u]nted [d]elete",
            nowait = true,
            remap = false
        },
        {
            "<leader>ul",
            function() require("haunt.picker").show() end,
            desc = "ha[u]nted picker",
            nowait = true,
            remap = false
        }
    }
}
