return {
	{
		"akinsho/bufferline.nvim",
		version = "v3.*",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			require("bufferline").setup({
        options = {
        buffer_close_icon = 'X',
        diagnostics = "nvim_lsp",

        }
      })
		end,
	},
}
