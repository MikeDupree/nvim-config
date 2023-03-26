return {
	"laytan/cloak.nvim",
	config = function()
		require("cloak").setup({
			patterns = {
				{
					file_pattern = ".npmrc",
					cloak_pattern = ":_authToken=.+",
				},
			},
		})
	end,
}
