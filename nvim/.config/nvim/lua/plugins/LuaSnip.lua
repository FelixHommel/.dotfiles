return {
    "L3MON4D3/LuaSnip",
    event = "InsertEnter",
    build = "make isntall_jsregexp",
    dependencies = {
        "rafamadriz/friendly-snippets"
    },
    config = function()
        local luasnip = require("luasnip")

        luasnip.config.set_config({
            history = true,
            updateevents = "TextChanged,TextChangedI"
        })
    end
}
