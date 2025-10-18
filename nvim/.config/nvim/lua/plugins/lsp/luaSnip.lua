local s = require("luasnip").snippet
local i = require("luasnip").insert_node
local r = require("luasnip.extras").rep
local f = require("luasnip.extras.fmt").fmt

require("luasnip").add_snippets("cpp", {
    s("class", f(
        [[
        #ifndef {}
        #define {}

        class {}
        {{
            public:
                {}();
                ~{}() = default;

                {}(const {}&) = delete;
                {}({}&&) = delete;
                {}& operator=(const {}&) = delete;
                {}& operator=({}&&) = delete;

            private:
        }};

        #endif //!{}
        ]], {i(1), r(1), i(2), r(2), r(2), r(2), r(2), r(2), r(2), r(2), r(2), r(2), r(2), r(1)}
    ))
})

require("luasnip").add_snippets("cpp", {
    s("NamespaceClass", f(
        [[
        #ifndef {}
        #define {}

        namespace {}
        {{

        class {}
        {{
            public:
                {}();
                ~{}() = default;

                {}(const {}&) = delete;
                {}({}&&) = delete;
                {}& operator=(const {}&) = delete;
                {}& operator=({}&&) = delete;

            private:
        }};

        }} //!{}

        #endif //!{}
        ]], {i(1), r(1), i(2), i(3), r(3), r(3), r(3), r(3), r(3), r(3), r(3), r(3), r(3), r(3), r(2), r(1)}
    ))
})

return {
    "L3MON4D3/LuaSnip",
    dependencies = {
        "rafamadriz/friendly-snippets"
    },
    event = "VeryLazy",
    version = "v2.4.0",
    build = "make install_jsregexp",
    opts = {}
}
