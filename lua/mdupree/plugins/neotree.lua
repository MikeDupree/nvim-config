return {
	"nvim-neo-tree/neo-tree.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1]])

		require("neo-tree").setup({
			close_if_last_window = true,
			filesystem = {
				follow_current_file = true,
				hijack_netrw_behavior = "open_current",
			},
		})
	end,
}
