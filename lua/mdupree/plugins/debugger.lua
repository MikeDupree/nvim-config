return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"williamboman/mason.nvim",
		"jay-babu/mason-nvim-dap.nvim",
	},
	event = "VeryLazy",
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

    dap.set_log_level('DEBUG')
		require("mason-nvim-dap").setup({
			-- not working for php adapter?
			automatic_setup = true,
      automatic_installation = true,
			ensure_installed = {
				"php",
        "node2",
				"js",
        "chrome",
			},
		})
		require("mason-nvim-dap").setup_handlers()

		dap.adapters.php = {
			type = "executable",
			command = "php-debug-adapter",
		}

		-- This is a sane default config for lando sites.
		dap.configurations.php = {
			{
				type = "php",
				request = "launch",
				name = "Listen for Xdebug (Default global)",
				port = 9003,
				pathMappings = {
					["/app"] = "${workspaceFolder}",
				},
			},
		}

		-- dap.configurations.typescript = {
		-- 	{
		-- 		type = "chrome",
		-- 		name = "Cypress Debug",
		-- 		request = "attach",
		-- 		port = 9222,
		-- 		urlFilter = "http://localhost*",
		-- 		program = "${file}",
		-- 		cwd = vim.fn.getcwd(),
		-- 		sourceMaps = true,
		-- 		protocol = "inspector",
		-- 		skipFiles = { "cypress_runner.js" },
		-- 	},
		-- }

		-- dap.configurations.javascript = dap.configurations.typescript
		-- local mason_path = vim.fn.glob(vim.fn.stdpath("data") .. "/mason/")
		-- dap.adapters.node2 = {
		-- 	type = "executable",
		-- 	command = "node",
		-- 	args = { mason_path .. "packages/node-debug2-adapter/out/src/nodeDebug.js" },
		-- }

		-- load the vscode launch config if present
		-- vscode uses json5 so this will have problems parsing a launch.json
		-- with trailing commas
		local continue = function()
			if vim.fn.filereadable(".vscode/launch.json") then
				require("dap.ext.vscode").load_launchjs()
			end
			dap.continue()
		end

		-- Basic debugging keymaps, feel free to change to your liking!
		vim.keymap.set("n", "<F5>", continue)
		vim.keymap.set("n", "<F1>", dap.step_into)
		vim.keymap.set("n", "<F2>", dap.step_over)
		vim.keymap.set("n", "<F3>", dap.step_out)
		vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, { desc = "DAP: Toggle [b]reakpoint" })
		vim.keymap.set("n", "<leader>B", function()
			dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
		end, { desc = "DAP: [B]reakpoint with condition" })
		vim.keymap.set("n", "<leader>dc", dapui.close, { desc = "DAP: [d]ebug ui [c]lose" })

		-- Dap UI setup
		dapui.setup({
			icons = { expanded = "▾", collapsed = "▸", current_frame = "*" },
			controls = {
				icons = {
					pause = "⏸",
					play = "▶",
					step_into = "⏎",
					step_over = "⏭",
					step_out = "⏮",
					step_back = "b",
					run_last = "▶▶",
					terminate = "⏹",
				},
			},
		})

		dap.listeners.after.event_initialized["dapui_config"] = dapui.open
		dap.listeners.before.event_terminated["dapui_config"] = dapui.close
		dap.listeners.before.event_exited["dapui_config"] = dapui.close
	end,
}
