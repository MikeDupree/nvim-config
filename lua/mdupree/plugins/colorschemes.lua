return {
	{
		"sainnhe/everforest",
		config = function()
			--local colorscheme = "everforest"
			--local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
			--if not status_ok then
			--	vim.notify("colorscheme " .. colorscheme .. " not installed!")
			--return
			--end
			--vim.opt.termguicolors = true
		end,
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
		config = function()
			local colorscheme = "tokyonight-night"
			local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
			if not status_ok then
				vim.notify("colorscheme " .. colorscheme .. " not installed!")
				return
			end
			vim.opt.termguicolors = true

			require("tokyonight").setup({
				style = "storm",
				transparent = true,
				terminal_colors = true,
			})
		end,
	},
}
