-- Does not work, I think because jdtls isn't loaded as lsp at the point where these would be processed
-- require("which-key").add({
--     mode = "n",
--     noremap  = true,
--     { "<leader>j", group = "[j]dtls" },
--     { "<leader>joi", "<cmd>require('jdtls').organize_imports()<cr>", desc = "[j]dtls [o]rganize [i]mports" },
--     { "<leader>jev", "<cmd>require('jdtls').extract_variable()<cr>", desc = "[j]dtls [e]xtract [v]ariable" },
--     { "<leader>jec", "<cmd>require('jdtls').extract_constant()<cr>", desc = "[j]dtls [e]xtract [c]onstant" },
-- })
--
-- require("which-key").add({
--     mode = "v",
--     noremap = true,
--     { "<leader>j", group = "[j]dtls" },
--     { "<leader>jem", require("jdtls").extract_method(), desc = "[j]dtls [e]xtract [m]ethod" }
-- })

return {
    "https://github.com/mfussenegger/nvim-jdtls.git",
}
