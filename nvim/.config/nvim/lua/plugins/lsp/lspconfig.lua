local setup_native_buffer_mappings = function(_, bufnr)
    require("which-key").add({
        {
            mode = "n",
            { "M<leader>l", group = "[l]sp" },
            { "<leader>lh", vim.lsp.buf.hover, desc = "[l]sp: [h]over docs", buffer = bufnr },
            { "<leader>lk", vim.lsp.buf.signature_help, desc = "[l]sp: [k] - signature help", buffer = bufnr },
            { "<leader>ld", vim.lsp.buf.definition, desc = "[l]sp: [d]efinition", buffer = bufnr },
            { "<leader>lD", vim.lsp.buf.declaration, desc = "[l]sp: [D]eclaration", buffer = bufnr },
            { "<leader>li", vim.lsp.buf.implementation, desc = "[l]sp: [i]mplementation", buffer = bufnr },
            { "<leader>lr", vim.lsp.buf.rename, desc = "[l]sp: [r]ename identifier", buffer = bufnr }
        }
    })
end

local setup_plugin_buffer_mappings = function(_, bufnr)
    local telescope_builtin = require("telescope.builtin")

    require("which-key").add({
        {
            mode = "n",
            { "<leader>lf", function()
                telescope_builtin.lsp_references(require("telescope.themes").get_ivy({
                    winblend = 20,
                }))
            end, desc = "[l]sp: re[f]erences", buffer = bufnr },
            { "<leader>sd", function()
                telescope_builtin.lsp_document_symbols(require("telescope.themes").get_ivy({
                    winblend = 20,
                }))
            end, desc = "lsp: [s]ymbols in [d]ocument", buffer = bufnr },

           { "<leader>la", require("actions-preview").code_actions, desc = "[l]sp: code [a]ctions", buffer = bufnr },
           { "<C-h>", require("lsp_signature").toggle_float_win, desc = "lsp: Signature help", buffer = bufnr },
           { "<leader>sf", "<cmd>ClangdSwitchSourceHeader<cr>",
               desc = "Clangd: [s]witch between source and header [f]ile", buffer = bufnr }
        }
    })
end

-- Autocommands for highlighting the word under the cursor when cursor isn't moving and stop highlighting
-- when movement continues
local setup_autocmds = function(client, bufnr)
    if client.server_capabilities.document_highlight then
        local group = vim.api.nvim_create_augroup("lsp_document_highlight", { clear = true })
        vim.api.nvim_create_autocmd({ "CursorHold" }, {
            group = group,
            buffer = bufnr,
            callback = vim.lsp.buf.document_highlight,
        })
        vim.api.nvim_create_autocmd({ "CursorMoved" }, {
            group = group,
            buffer = bufnr,
            callback = vim.lsp.buf.clear_references,
        })
    end
end

local root_files = {
    "compile_commands.json",
    ".clang-tidy",
    ".clang-format",
    ".git"
}

local root_dir_func = function(fname)
    return require("lspconfig.util").root_pattern(unpack(root_files))(fname)
end

local capabilities = vim.tbl_deep_extend(
    "force",
    {},
    vim.lsp.protocol.make_client_capabilities(),
    require("cmp_nvim_lsp").default_capabilities()
)

local lua_ls_setup = function()
    local on_attach = function(client, bufnr)
        setup_native_buffer_mappings(client, bufnr)
        setup_plugin_buffer_mappings(client, bufnr)
        setup_autocmds(client, bufnr)
    end

    require("lspconfig").lua_ls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
            Lua = {
                workspace = { checkThirdParty = false },
                telemetry = { enable = false }
            }
        }
    })
end

return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "folke/which-key.nvim",
        "nvim-telescope/telescope.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "ray-x/lsp_signature.nvim",
        "aznhe21/actions-preview.nvim",
        "p00f/clangd_extensions.nvim",
    },
    config = function()
        local mason = require("mason")
        local mason_lspconfig = require("mason-lspconfig")
        local lspconfig = require("lspconfig")

        mason.setup()
        mason_lspconfig.setup{
            ensure_installed = { "clangd", "lua_ls" }
            -- automatic_enable = true
        }

        vim.lsp.handlers["textDocument/hover"] =
            vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })

        vim.lsp.handlers["textDocument/signatureHelp"] =
            vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })

        -- Setup clangd LSP
        require("lspconfig").clangd.setup({
            on_attach = function(client, bufnr)
                setup_native_buffer_mappings(client, bufnr)
                setup_plugin_buffer_mappings(client, bufnr)
                setup_autocmds(client, bufnr)
            end,
            capabilities = capabilities,
            root_dir = root_dir_func,
            single_file_support = false,
            filetypes = {
                "c",
                "cpp",
                "h",
                "hpp",
                "cu",
                "cuda"
            },
            cmd = { "clangd" }
        })
        lua_ls_setup()

        -- Setup all other lsp servers
        for _, server in ipairs({
            "asm_lsp",
            "bashls",
            "cmake",
            "dockerls",
            "glslls",
            "marksman",
            "glsl_analyzer",
            "pyright",
            "r_language_server",
            "vimls",
            "jdtls",
            "tinymist"
        }) do
            lspconfig[server].setup({
                on_attach = function(client, bufnr)
                    setup_native_buffer_mappings(client, bufnr)
                    setup_plugin_buffer_mappings(client, bufnr)
                    setup_autocmds(client, bufnr)
                end,
                capabilities = capabilities
            })
        end
    end
}
