return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-emoji",
        "saadparwaiz1/cmp_luasnip",
        "L3MON4D3/LuaSnip",
    },
    config = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")

        cmp.setup({
            snippets = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end
            },
            sources = cmp.config.sources(
                {
                    { name = "nvim_lsp" },
                    { name = "nvim_lua" },
                    { name = "vim_lsp" },
                    { name = "luasnip" }
                },
                {
                    { name = "path" },
                    { name = "buffer", keyword_length = 4 }
                }
            ),
            view = {
                entries = {
                    name = "custom",
                    selection_order = "near_cursor"
                }
            },
            mapping = {
                ["<C-n>"] = cmp.mapping.select_next_item(),
                ["<C-p>"] = cmp.mapping.select_prev_item(),
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    else
                        fallback()
                    end
                end, { "i", "s"}),
                ["<S-Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    else
                        fallback()
                    end
                end, { "i", "s"}),
                ["<C-s>"] = cmp.mapping.confirm({ select = true })
            }
        })

        cmp.setup.cmdline({ "/", "?" }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = "buffer" }
            }
        })

        cmp.setup.cmdline(":", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = "path" }
            }, {
                { name = "cmdline" }
            })
        })
    end
}
