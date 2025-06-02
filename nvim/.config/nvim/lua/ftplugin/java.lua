local bundle = vim.fn.glob("$HOME/.local/share/nvim/mason/packages/java-debug-adapter/extension/server/*.jar", 1);

require("jdtls").start_or_attach({
    cmd = {
        vim.fn.expand("$HOME/.local/share/nvim/mason/bin/jdtls")
    },
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
    init_options = {
        bundles = {
            vim.list_extend(bundle, vim.split(vim.fn.glob("$HOME/.local/share/nvim/mason/packages/java-test/extension/server/*.jar", 1), "\n"))

        }
    }
})
