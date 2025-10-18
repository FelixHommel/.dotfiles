-- Configure inline diagnostics natively
local on_attach = function(client)
    vim.diagnostic.config({
        virtual_text = true,  -- Display inline diagnostics in the buffer
        signs = true,        -- Show diagnostic signs in the gutter
        update_in_insert = false,
        underline = true,
        severity_sort = true,
        float = {
            focusable = false,
            style = 'minimal',
            border = 'rounded',
            source = 'always'
        }
    }, client.bufnr)
end

-- General diagnostics settings
vim.diagnostic.config({ virtual_lines = { only_current_line = true } })

-- Bash
vim.lsp.config("bash-language-server", {
    cmd = { "bash-language-server", "start" },
    filetypes = { "bash", "sh" },
    root_markers = { ".git" },
    settings = {
        bashIde = {
            globPattern = vim.env.GLOB_PATTERN or "*@(.sh|.inc|.bash|.command)"
        }
    },
    on_attach = on_attach
})
vim.lsp.enable("bash-language-server")

-- C/C++
vim.lsp.config("clangd", {
    cmd = { "clangd" },
    filetypes = { "c", "h", "cpp", "hpp", "cuda" },
    root_markers = {
        ".clangd",
        ".clang-tidy",
        ".clang-format",
        "compile_commands.json",
        ".git"
    },
    capabilities = {
        textDocument = {
            completion = {
                editsNearCursor = true
            }
        },
        offsetEncoding = { "utf-8", "utf-16" }
    },
    on_attach = on_attach
})
vim.lsp.enable("clangd")

-- Cmake
vim.lsp.config("cmake-language-server", {
    cmd = { "cmake-language-server" },
    filetypes = { "cmake" },
    init_options = {
        buildDirectory = "build"
    },
    on_attach = on_attach
})
vim.lsp.enable("cmake-language-server")

-- Docker
vim.lsp.config("docker-langserver", {
    cmd = { "docker-langserver", "--stdio" },
    filetypes = { "Dockerfile" },
    root_markers = { "Dockerfile" },
    on_attach = on_attach
})
vim.lsp.enable("docker-langserver")

vim.lsp.config("docker-compose-langserver", {
    cmd = { "docker-compose-langserver", "--stdio" },
    filetypes = { "yaml.docker-compose" },
    root_markers = { "docker-compose.yaml", "docker-compose.yml", "compose.yaml", "compose.yml" },
    on_attach = on_attach
})
vim.lsp.enable("docker-compose-langserver")

-- GLSL
vim.lsp.config("glsl_analyzer", {
    cmd = { "glsl_analyzer" },
    filetypes = { "glsl", "vert", "frag", "tesc", "geom", "comp" },
    root_markers = { ".git" },
    on_attach = on_attach
})
vim.lsp.enable("glsl_analyzer")

-- Lua
vim.lsp.config("lua-language-server", {
    cmd = { "lua-language-server" },
    filetypes = { "lua" },
    root_markers = { ".luarc.json", ".git" },
    settings = {
        Lua = {
            hint = { enabled = true },
            telemetry = { enabled = false },
            diagnostics = { globals = { "vim" } }
        }
    },
    on_attach = on_attach

})
vim.lsp.enable("lua-language-server")

-- Marksman
vim.lsp.config("marksman", {
    cmd = { "marksman", "server" },
    filetypes = { "markdown", "md", "markdown.mdx" },
    root_markers = { ".git" },
    on_attach = on_attach
})
vim.lsp.enable("marksman")

-- Python
vim.lsp.enable("basedpyright")

-- Rust
vim.lsp.enable("rust-analyzer")

-- Slang
vim.lsp.enable("slangd")

-- Typst
vim.lsp.enable("tinymist")

-- LaTeX
vim.lsp.enable("texlab")
