local on_attach = function(client, bufnr)
end

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
    cmd = {
        "clangd",
        "--background-index",
        "--clang-tidy",
        "--completion-style=detailed",
        "--function-arg-placeholders",
        "--header-insertion=iwyu",
        "-j=16"
    },
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
    settings = {
        clangd = {
            Completion = {
                AllScopes = true,
            },
            InlayHints = {
                Enabled = true,
            },
        }
    },
    on_attach = on_attach
})
vim.lsp.enable("clangd")

-- Cmake
vim.lsp.config("cmake", {
    cmd = { "cmake-language-server" },
    filetypes = { "cmake" },
    init_options = {
        buildDirectory = "build"
    },
    on_attach = on_attach
})
vim.lsp.enable("cmake")

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

-- Github
vim.lsp.enable("gh_actions_ls")

-- GLSL
vim.lsp.config("glsl_analyzer", {
    cmd = { "glsl_analyzer" },
    filetypes = { "glsl", "vert", "frag", "tesc", "geom", "comp" },
    root_markers = { ".git" },
    on_attach = on_attach
})
vim.lsp.enable("glsl_analyzer")

-- Gradle
vim.lsp.enable("gradle_ls")

-- Harper
vim.lsp.config("harper_ls", {
    settings = {
        ["harper-ls"] = {
            userDictPath = "",
            workspaceDictPath = "",
            fileDictPath = "",
            linters = {
                SpellCheck = true,
                SpelledNumbers = false,
                AnA = true,
                SentenceCapitalization = false,
                UnclosedQuotes = true,
                WrongQuotes = false,
                LongSentences = true,
                RepeatedWords = true,
                Spaces = true,
                Matcher = true,
                CorrectNumberSuffix = true
            },
            codeActions = {
                ForceStable = false
            },
            markdown = {
                IgnoreLinkTitle = true
            },
            diagnosticSeverity = "hint",
            isolateEnglish = true,
            dialect = "American",
            ignoredLintsPath = "",
            excludePatterns = {}
        }
    }
})
vim.lsp.enable("harper_ls")

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
vim.lsp.enable("stylua")

-- Marksman
vim.lsp.config("marksman", {
    cmd = { "marksman", "server" },
    filetypes = { "markdown", "md", "markdown.mdx" },
    root_markers = { ".git" },
    on_attach = on_attach
})
vim.lsp.enable("marksman")

-- Protobuf
vim.lsp.enable("pbls")

-- Python
vim.lsp.enable("basedpyright")
vim.lsp.enable("ruff")

-- Rust
vim.lsp.enable("rust_analyzer")

-- Slang
vim.lsp.enable("slangd")

-- Typst
vim.lsp.enable("tinymist")

-- LaTeX
-- LSP
vim.lsp.config("texlab", {
    cmd = { "texlab" },
    filetypes = { "tex", "plaintex", "bib" },
    root_markers = { ".git", ".latexmkrc" },
    settings = {
        texlab = {
            build = {
                args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
                executable = "latexmk",
                forwardSearchAfter = true,
                onSave = false
            },
            forwardSearch = {
                executable = "qpdfview",
                args = { "--unique", "%p#src:%f:%l:1" }
            },
            latexFormatter = "latexindent",
            latexindent = {
                modifyLineBreaks = false
            }
        }
    }
})
vim.lsp.enable("texlab")

-- Spell checking
vim.lsp.config("ltex_plus", {
    cmd = { "ltex-ls-plus" },
    filetypes = { "tex", "plaintex", "bib" },
    root_markers = { ".git", ".latexmkrc" },
    settings = {
        ltex = {
            enabled = { "bib", "latex", "tex" },
            language = "en-US",
            additionalRules = {
                enablePickyRules = true
            },
            dictionary = {
                [ "en-US" ] = vim.fn.readfile(vim.fn.expand("~/.config/ltex/ltex.dictionary.en-US.txt"))
            },
            checkFrequency = "write"
        }
    }
})
vim.lsp.enable("ltex_plus")
