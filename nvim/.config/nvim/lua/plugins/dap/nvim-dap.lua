return {
	"mfussenegger/nvim-dap",
	lazy = true,
	keys = {
		{
			"<leader>d",
			group = "Debug",
			nowait = true,
			remap = false
		},
		{
			"<leader>dt",
			function() require("dap").toggle_breakpoint() end,
			desc = "[d]ebug [t]oggle breakpoint",
			nowait = true,
			remap = false
		},
		{
			"<leader>dc",
			function() require("dap").continue() end,
			desc = "[d]ebug [c]ontinue",
			nowait = true,
			remap = false
		},
		{
			"<leader>di",
			function() require("dap").step_into() end,
			desc = "[d]ebug step [i]nto",
			nowait = true,
			remap = false
		},
		{
			"<leader>do",
			function() require("dap").step_over() end,
			desc = "[d]ebug step [o]ver",
			nowait = true,
			remap = false
		},
		{
			"<leader>du",
			function() require("dap").step_out() end,
			desc = "[d]ebug step o[u]t",
			nowait = true,
			remap = false
		},
		{
			"<leader>dr",
			function() require("dap").repl.open() end,
			desc = "[d]ebug [r]epl",
			nowait = true,
			remap = false
		},
		{
			"<leader>ds",
			function() require("dap").restart() end,
			desc = "[d]ebug re[s]tart",
			nowait = true,
			remap = false
		},
		{
			"<leader>dl",
			function() require("dap").run_last() end,
			desc = "[d]ebug run [l]ast",
			nowait = true,
			remap = false
		},
		{
			"<leader>dq",
			function()
				require("dap").terminate()
				require("dapui").close()
				require("nvim-dap-virtual-text").toggle()
			end,
			desc = "[d]ebug [q]uit",
			nowait = true,
			remap = false
		},
		{
			"<leader>de",
			function()
				vim.ui.input({ prompt = "Evaluate expression: "}, function(expr)
					if expr then require("dap").repl.execute(expr) end
				end)
			end,
			desc = "[d]ebug [e]valuate expression"
		}
	}
}