return {
	"jay-babu/mason-nvim-dap.nvim",
	dependencies = {
		"williamboman/mason.nvim",
		"mfussenegger/nvim-dap"
	},
	opts = {
		-- NOTE: Needed is needed for automatic installation to work
		handlers = {
			function(config)
				require("mason-nvim-dap").default_setup(config)
			end
		},
		ensure_installed = {
			"codelldb",
			"java-debug-adapter"
		}
	}
}