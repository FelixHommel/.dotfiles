return {
	"rcarriga/nvim-dap-ui",
	dependencies = {
		"mfussenegger/nvim-dap",
		"nvim-neotest/nvim-nio",
		"theHamsta/nvim-dap-virtual-text"
	},
	config = function()
		local dap = require("dap")
		local ui = require("dapui")

		ui.setup()

		dap.listeners.before.attach.dapui_config = function() ui.open() end
		dap.listeners.before.launch.dapui_config = function() ui.open() end
		dap.listeners.before.event_terminated.dapui_config = function() ui.close() end
		dap.listeners.before.event_exited.dapui_config = function() ui.close() end
	end,
	keys = {
		{
			"<leader>du",
			function() require("dapui").toggle({}) end,
			desc = "[d]ebug [u]i toggle"
		}
	}
}
