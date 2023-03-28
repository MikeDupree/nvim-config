return {
	"nvim-tree/nvim-web-devicons",
	"nvim-lualine/lualine.nvim",
	{
		"ggandor/leap.nvim",
		config = function()
			require("leap").add_default_mappings()
		end,
	},
	"mbbill/undotree",
}
