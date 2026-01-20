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
        {
            "<leader>h",
            group = "[h]aunt",
            nowait = true,
            remap = false
        },
        {
            "<leader>ha",
            function() require("haunt.api").annotate() end,
            desc = "[h]aunt [a]nnotate",
            nowait = true,
            remap = false
        },
        {
            "<leader>ht",
            function() require("haunt.api").toggle_annotation() end,
            desc = "[h]aunted [t]oggle annotation",
            nowait = true,
            remap = false
        },
        {
            "<leader>hd",
            function() require("haunt.api").delete() end,
            desc = "[h]aunted [d]elete",
            nowait = true,
            remap = false
        },
        {
            "<leader>hD",
            function() require("haunt.api").clear_all() end,
            desc = "[h]aunted [D]elete All",
            nowait = true,
            remap = false
        },
        {
            "<leader>hp",
            function() require("haunt.api").prev() end,
            desc = "[h]aunted [p]revious bookmark",
            nowait = true,
            remap = false
        },
        {
            "<leader>hn",
            function() require("haunt.api").next() end,
            desc = "[h]aunted [n]ext bookmark",
            nowait = true,
            remap = false
        },
        {
            "<leader>ho",
            function() require("haunt.picker").show() end,
            desc = "[h]aunted [o]pen picker",
            nowait = true,
            remap = false
        }
    }
}
