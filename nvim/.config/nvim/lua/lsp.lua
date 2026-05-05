-- Add inlay hints to LSP clients that support the feature (i.e., rust-analyzer)
-- vim.api.nvim_create_autocmd("LspAttach", {
--     callback = function(ev)
--         local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))
--         -- Inlay hints display inferred types, etc.
--         if client:supports_method("inlayHint/resolve") then
--             vim.lsp.inlay_hint.enable(true, { bufnr = ev.buf })
--         end
--     end
-- })

-- Assembly
vim.lsp.enable("asm_lsp")

-- Astro
vim.lsp.config("astro", {
    init_options = {
        typescript = {}
    }
})
vim.lsp.enable("astro")

-- CSS
vim.lsp.enable("cssls");

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
})
vim.lsp.enable("bash-language-server")

-- CMake
vim.lsp.enable("neocmake")

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
})
vim.lsp.enable("clangd")

-- Docker
vim.lsp.config("docker-langserver", {
    cmd = { "docker-langserver", "--stdio" },
    filetypes = { "Dockerfile" },
    root_markers = { "Dockerfile" },
})
vim.lsp.enable("docker-langserver")

vim.lsp.config("docker-compose-langserver", {
    cmd = { "docker-compose-langserver", "--stdio" },
    filetypes = { "yaml.docker-compose" },
    root_markers = { "docker-compose.yaml", "docker-compose.yml", "compose.yaml", "compose.yml" },
 
})
vim.lsp.enable("docker-compose-langserver")

-- Github
vim.lsp.enable("gh_actions_ls")

-- GLSL
vim.lsp.config("glsl_analyzer", {
    cmd = { "glsl_analyzer" },
    filetypes = { "glsl", "vert", "frag", "tesc", "geom", "comp" },
    root_markers = { ".git" },
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

-- Hyprland
vim.lsp.enable('hyprls')

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
})
vim.lsp.enable("lua-language-server")
vim.lsp.enable("stylua")

-- Marksman
vim.lsp.config("marksman", {
    cmd = { "marksman", "server" },
    filetypes = { "markdown", "md", "markdown.mdx" },
    root_markers = { ".git" },
})
vim.lsp.enable("marksman")

-- Protobuf
vim.lsp.enable("pbls")

-- Python
vim.lsp.enable("basedpyright")
vim.lsp.enable("ruff")

-- Rust
vim.lsp.config("rust_analyzer", {
    settings = {
        ["rust-analyzer"] = {
            cargo = {
                buildScripts = {
                    enable = true
                }
            },
            imports = {
                granularity = {
                    group = "module"
                },
                prefix = "self"
            },
            procMacro = {
                enable = true
            }
        }
    }
})
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
