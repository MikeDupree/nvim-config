-- GPS for lua line
require("nvim-gps").setup()
local gps = require("nvim-gps")

-- Configure lua line
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '祈', right = '祈' },
    section_separators = { left = '', right = '' },
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {
      { 'mode', fmt = function(str) return str:sub(1, 1) end }
    },
    lualine_b = { 'branch', 'diff', 'diagnostics' },
    lualine_c = { { gps.get_location, cond = gps.is_available } },
    lualine_x = { { 'filename', icon = { 'פּ', color = { fg = 'green' } } } },
    lualine_y = { 'progress' },
    lualine_z = { 'os.date()' }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { 'filename' },
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
