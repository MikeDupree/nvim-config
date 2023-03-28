return {
	{
		"SmiteshP/nvim-navic",
		config = function()
      -- Color table for highlights
      -- stylua: ignore
      local colors = {
        bg       = '#000000',
        fg       = '#bbc2cf',
        yellow   = '#ECBE7B',
        cyan     = '#008080',
        darkblue = '#081633',
        green    = '#98be65',
        orange   = '#FF8800',
        violet   = '#a9a1e1',
        magenta  = '#c678dd',
        blue     = '#51afef',
        red      = '#ec5f67',
        warning  = '#ECBE7B',
        error    = '#ec5f67',
        info     = '#bbc2cf',
      }

			-- Returns the local LSP Server name
			local function get_lsp_server_name()
				local msg = "No Active Lsp"
				local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
				local clients = vim.lsp.get_active_clients()
				if next(clients) == nil then
					return msg
				end
				for _, client in ipairs(clients) do
					local filetypes = client.config.filetypes
					if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
						return client.name
					end
				end
				return msg
			end

			-- Returns the current VIM Mode
			local function get_mode()
				local mode_symbol = {
					n = "🔰",
					i = "I",
					v = "v",
					[""] = "^V",
					V = "V",
					c = "⚡",
					no = "no",
					s = "s",
					S = "S",
					[""] = "^S",
					ic = "ic",
					R = "R✛",
					Rv = "Rv",
					cv = "cv",
					ce = "ce",
					r = "r",
					rm = "rm",
					["r?"] = "r?",
					["!"] = "!",
					t = "t",
				}
				return mode_symbol[vim.fn.mode()]
				--return ':MODE'
			end

			-- Returns color for VIM Mode based on current mode.
			local function get_mode_color()
				-- auto change color according to neovims mode
				local mode_color = {
					n = colors.red,
					i = colors.green,
					v = colors.blue,
					[""] = colors.blue,
					V = colors.blue,
					c = colors.magenta,
					no = colors.red,
					s = colors.orange,
					S = colors.orange,
					[""] = colors.orange,
					ic = colors.yellow,
					R = colors.violet,
					Rv = colors.violet,
					cv = colors.red,
					ce = colors.red,
					r = colors.cyan,
					rm = colors.cyan,
					["r?"] = colors.cyan,
					["!"] = colors.red,
					t = colors.red,
				}
				return { fg = mode_color[vim.fn.mode()] }
			end

			require("nvim-navic").setup({
				icons = {
					File = " ",
					Module = " ",
					Namespace = " ",
					Package = " ",
					Class = " ",
					Method = " ",
					Property = " ",
					Field = " ",
					Constructor = " ",
					Enum = " ",
					Interface = " ",
					Function = " ",
					Variable = " ",
					Constant = " ",
					String = " ",
					Number = " ",
					Boolean = " ",
					Array = " ",
					Object = " ",
					Key = " ",
					Null = " ",
					EnumMember = " ",
					Struct = " ",
					Event = " ",
					Operator = " ",
					TypeParameter = " ",
				},
			})
			local navic = require("nvim-navic")
			local lualine = require("lualine")
			-- { navic.get_location, cond = navic.is_available },

			local conditions = {
				buffer_not_empty = function()
					return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
				end,
				hide_in_width = function()
					return vim.fn.winwidth(0) > 80
				end,
				check_git_workspace = function()
					local filepath = vim.fn.expand("%:p:h")
					local gitdir = vim.fn.finddir(".git", filepath .. ";")
					return gitdir and #gitdir > 0 and #gitdir < #filepath
				end,
			}

			-- Config
			local config = {
				options = {
					-- Disable sections and component separators
					component_separators = "",
					section_separators = "",
					theme = {
						-- We are going to use lualine_c an lualine_x as left and
						-- right section. Both are highlighted by c theme .  So we
						-- are just setting default looks o statusline
						normal = { c = { fg = colors.fg, bg = colors.bg } },
						inactive = { c = { fg = colors.fg, bg = colors.bg } },
					},
				},
				sections = {
					-- these are to remove the defaults
					lualine_a = {},
					lualine_b = {},
					lualine_y = {},
					lualine_z = {},
					-- These will be filled later
					lualine_c = {},
					lualine_x = {},
				},
				inactive_sections = {
					-- these are to remove the defaults
					lualine_a = {},
					lualine_b = {},
					lualine_y = {},
					lualine_z = {},
					lualine_c = {},
					lualine_x = {},
				},
			}

			-- Inserts a component in lualine_c at left section
			local function ins_left(component)
				table.insert(config.sections.lualine_c, component)
			end

			-- Inserts a component in lualine_x ot right section
			local function ins_right(component)
				table.insert(config.sections.lualine_x, component)
			end

			---
			-- LEFT Sections
			-- ( place your components in order of left to right )
			---
			left_sections = {
				-- section_separators = { left = '', right = '' },
				{
					function()
						return ""
					end,
					color = { fg = colors.cyan }, -- Sets highlighting of component
					padding = { left = 0, right = 1 }, -- We don't need space before this
				},
				{
					-- mode component
					function()
						local mode_symbol = {
							n = "🔰",
							i = "",
							v = "",
							[""] = "^V",
							V = "V",
							c = "⚡",
							no = "no",
							s = "s",
							S = "S",
							[""] = "^S",
							ic = "ic",
							R = "R✛",
							Rv = "Rv",
							cv = "cv",
							ce = "ce",
							r = "r",
							rm = "rm",
							["r?"] = "r?",
							["!"] = "!",
							t = "t",
						}
						return mode_symbol[vim.fn.mode()]
						--return ':MODE'
					end,
					color = get_mode_color(),
					-- auto change color according to neovims mode
					padding = { right = 1 },
				},
				-- {
				-- 	-- filesize component
				-- 	"filesize",
				-- 	cond = conditions.buffer_not_empty,
				-- },
				-- -- filename used to be here
				-- { "location" },
				{ "progress", color = { fg = colors.fg, gui = "bold" } },
				{
					"diagnostics",
					sources = { "nvim_diagnostic" },
					symbols = { error = " ", warn = " ", info = " " },
					diagnostics_color = {
						color_error = { fg = colors.error },
						color_warn = { fg = colors.warning },
						color_info = { fg = colors.info },
					},
				},
			}

			---
			-- Middle
			---
			middle_sections = {
				-- Middle Splitter
				-- Insert mid section. You can make any number of sections in neovim :)
				-- for lualine it's any number greater then 2
				{
					function()
						return "%="
					end,
				},
				{
					"path",
					cond = conditions.buffer_not_empty,
					color = { fg = "#ffd866", gui = "bold" },
				},

				{
					"filename",
					cond = conditions.buffer_not_empty,
					color = { fg = "#ffd866", gui = "bold" },
				},
			}
			right_sections = {

				-- {
				-- 	"o:encoding", -- option component same as &encoding in viml
				-- 	fmt = string.upper,
				-- 	cond = conditions.hide_in_width,
				-- 	color = { fg = colors.green, gui = "bold" },
				-- },

				{
					-- Lsp server name .
					get_lsp_server_name(),
					icon = "",
					color = { fg = colors.fg, gui = "bold" },
				},

				{
					"fileformat",
					fmt = string.upper,
					icons_enabled = true,
					color = { fg = colors.cyan, gui = "bold" },
				},

				{
					"branch",
					icon = "",
					color = { fg = colors.violet, gui = "bold" },
				},

				{
					"diff",
					symbols = { added = " ", modified = "柳", removed = " " },
					diff_color = {
						added = { fg = colors.green },
						modified = { fg = colors.orange },
						removed = { fg = colors.red },
					},
					cond = conditions.hide_in_width,
				},

				{
					function()
						return ""
					end,
					color = { fg = colors.magenta },
					padding = { left = 1 },
				},
			}
			---
			-- Insert Left Sections
			---
			for i, v in ipairs(left_sections) do
				ins_left(v)
			end

			---
			-- Insert Left Sections
			---
			for i, section in ipairs(middle_sections) do
				ins_left(section)
			end

			---
			-- Insert Right Sections
			---
			for i, v in ipairs(right_sections) do
				ins_right(v)
			end

			lualine.setup(config)
		end,
	},
}
