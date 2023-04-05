return {
	{
		"nvim-treesitter/nvim-treesitter",
		"nvim-treesitter/playground",
    "windwp/nvim-ts-autotag",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
			"nvim-treesitter/nvim-treesitter-context",
		},
		build = function()
			pcall(require("nvim-treesitter.install").update({ with_sync = true }))
		end,
		config = function()
			require("nvim-treesitter.configs").setup({
				-- Add languages to be installed here that you want installed for treesitter
				ensure_installed = {
					"help",
					"python",
					"vim",
          "bash",
					"css",
					"dockerfile",
					"gitcommit",
					"gitignore",
					"graphql",
					"help",
					"html",
					"http",
					"javascript",
					"json",
					"lua",
					"make",
					"markdown",
					"php",
					"prisma",
					"python",
					"rust",
					"scss",
					"svelte",
					"typescript",
					"tsx",
					"twig",
					"yaml",
				},
				highlight = { enable = true },
				indent = { enable = true },
        autotag = {
          enable = true
        },
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<CR>",
						scope_incremental = "<CR>",
						node_incremental = "<TAB>",
						node_decremental = "<S-TAB>",
					},
				},
				textobjects = {
					select = {
						enable = true,
						lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
						keymaps = {
							-- You can use the capture groups defined in textobjects.scm
							["aa"] = "@parameter.outer",
							["ia"] = "@parameter.inner",
							["af"] = "@function.outer",
							["if"] = "@function.inner",
							["ac"] = "@class.outer",
							["ic"] = "@class.inner",
						},
					},
					move = {
						enable = true,
						set_jumps = true, -- whether to set jumps in the jumplist
						goto_next_start = {
							["]m"] = "@function.outer",
							["]]"] = "@class.outer",
						},
						goto_next_end = {
							["]M"] = "@function.outer",
							["]["] = "@class.outer",
						},
						goto_previous_start = {
							["[m"] = "@function.outer",
							["[["] = "@class.outer",
						},
						goto_previous_end = {
							["[M"] = "@function.outer",
							["[]"] = "@class.outer",
						},
					},
					swap = {
						enable = true,
						swap_next = {
							["<leader>a"] = "@parameter.inner",
						},
						swap_previous = {
							["<leader>A"] = "@parameter.inner",
						},
					},
				},
				context_commentstring = {
					enable = true,
					enable_autocmd = false,
				},
			})

			require("treesitter-context").setup({
				patterns = {
					typescript = {
						"const",
					},
				},
			})
		end,
	},
}
