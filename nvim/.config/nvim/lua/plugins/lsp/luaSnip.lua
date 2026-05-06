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
            {}& operator=(const {}&) = delete;
            {}({}&&) noexcept = delete;
            {}& operator=({}&&) noexcept = delete;

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
            {}& operator=(const {}&) = delete;
            {}({}&&) noexcept = delete;
            {}& operator=({}&&) noexcept = delete;

        private:
        }};

        }} //!{}

        #endif //!{}
        ]], {i(1), r(1), i(2), i(3), r(3), r(3), r(3), r(3), r(3), r(3), r(3), r(3), r(3), r(3), r(2), r(1)}
    ))
})

require("luasnip").add_snippets("cmake", {
    s("init_project", f(
        [[
        cmake_minimum_required(VERSION 3.30)
        project({} LANGUAGES CXX)

        set(CMAKE_CXX_STANDARD 23)
        set(CMAKE_CXX_STANDARD_REQUIRED ON)
        set(CMAKE_CXX_EXTENSIONS OFF)
        set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

        add_executable(${{PROJECT_NAME}} ./main.cpp)

        target_compile_features(${{PROJECT_NAME}} PRIVATE cxx_std_23)
        ]], {i(1)}
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
