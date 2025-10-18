return {
    "saghen/blink.cmp",
    dependencies = {
        "L3MON4D3/LuaSnip",
        "echasnovski/mini.icons"
    },
    version = "1.*",
    opts = {
        keymap = {
            preset = "none",
            ["<Tab>"] = { "select_next", "fallback" },
            ["<S-Tab>"] = { "select_prev", "fallback" },
            ["<C-s>"] = { "select_and_accept", "fallback" },
            ["<C-x>"] = { "cancel", "fallback" },
            ["<C-n>"] = { "snippet_forward", "fallback" },
            ["<C-p>"] = { "snippet_backward", "fallback" }
        },
        appearance = {
            nerd_font_variant = "normal"
        },
        completion = {
            documentation = {
                auto_show = true,
                auto_show_delay_ms = 500,
                window = { border = "single" }
            }
        },
        sources = {
            default = {
                "lsp",
                "path",
                "snippets",
                "buffer"
            }
        },
        fuzzy = {
            implementation = "prefer_rust_with_warning",
            sorts = {
                "exact",
                "score",
                "sort_text"
            }
        },
        snippets = {
            preset = "luasnip"
        }
    }
}
