return {
	{
		"kiyoon/jupynium.nvim",
		build = "pip3 install --user .",
		-- build = "conda run --no-capture-output -n jupynium pip install .",
		-- enabled = vim.fn.isdirectory(vim.fn.expand "~/miniconda3/envs/jupynium"),
		config = function()
			require("jupynium").setup({
				--- For Conda environment named "jupynium",
				python_host = { "conda", "run", "--no-capture-output", "-n", "jupynium", "python" },
				-- python_host = vim.g.python3_host_prog or "python3",
				default_notebook_URL = "localhost:8888",
			})
		end,
	},
	"hrsh7th/nvim-cmp", -- optional, for completion
	"rcarriga/nvim-notify", -- optional
	"stevearc/dressing.nvim", -- optional, UI for :JupyniumKernelSelect
}
