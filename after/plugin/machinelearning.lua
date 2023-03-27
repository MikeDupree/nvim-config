require("jupynium").setup({
	--- For Conda environment named "jupynium",
	python_host = { "conda", "run", "--no-capture-output", "-n", "jupynium", "python" },
	-- python_host = vim.g.python3_host_prog or "python3",

	default_notebook_URL = "localhost:8888",
})
