return {
    "GustavEikaas/easy-dotnet.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim",
        "mfussenegger/nvim-dap",
    },
    opts = {
        lsp = {
            enabled = true,
            config = {
                settings = {
                    ["csharp|inlay_hints"] = {
                        csharp_enable_inlay_hints_for_implicit_object_creation = true,
                        csharp_enable_inlay_hints_for_implicit_variable_types = true,
                    },

                    ["csharp|code_lens"] = {
                        dotnet_enable_references_code_lens = false,
                        dotnet_enable_tests_code_lens = false,
                    },

                    ["csharp|formatting"] = {
                        dotnet_organize_imports_on_format = true,
                    },
                },
            },
        },
        picker = "telescope",
    },
}
