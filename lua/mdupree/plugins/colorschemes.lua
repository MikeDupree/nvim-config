return {
	{
		"patstockwell/vim-monokai-tasty",
		config = function()
			vim.g.vim_monokai_tasty_italic = 1 -- allow italics, set this before the colorscheme
			vim.g.vim_monokai_tasty_machine_tint = 1 -- use `mahcine` colour variant
			vim.g.vim_monokai_tasty_highlight_active_window = 1 -- make the active window stand out

			local colorscheme = "vim-monokai-tasty"

			local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

			if not status_ok then
				vim.notify("colorscheme " .. colorscheme .. " not installed!")
				return
			end

			vim.g.airline_theme = "monokai_tasty"

			vim.opt.termguicolors = true
		end,
	},
	-- vim-monokai-tasty additional packages
	"HerringtonDarkholme/yats.vim",
	"pangloss/vim-javascript",
	"MaxMEllon/vim-jsx-pretty",
	"styled-components/vim-styled-components",
	"elzr/vim-json",
	"jparise/vim-graphql",
	-- transparency toggle
	"xiyaowong/transparent.nvim",
}
