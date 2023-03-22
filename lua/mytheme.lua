--
-- Color Scheme
--
local theme = {
  _experimental_nc = '#16141f',
  base = '#191724',
  surface = '#1f1d2e',
  overlay = '#26233a',
  muted = '#6e6a86',
  subtle = '#908caa',
  text = '#e0def4',
  love = '#eb6f92',
  gold = '#f6c177',
  rose = '#ebbcba',
  pine = '#31748f',
  foam = '#9ccfd8',
  cursor = '#f3f3f3',
  border = '#000000',
  iris = '#c4a7e7',
  highlight_low = '#21202e',
  highlight_med = '#403d52',
  highlight_high = '#524f67',
  none = 'NONE',
}
require('rose-pine').setup({
  --- @usage 'auto'|'main'|'moon'|'dawn'
  variant = 'auto',
  --- @usage 'main'|'moon'|'dawn'
  dark_variant = 'main',
  bold_vert_split = false,
  dim_nc_background = false,
  disable_background = false,
  disable_float_background = false,
  disable_italics = false,

  --- @usage string hex value or named color from rosepinetheme.com/palette
  groups = {
    background = 'none',
    background_nc = 'none',
    panel = 'none',
    panel_nc = 'none',
    border = theme.border,
    comment = 'muted',
    link = 'iris',
    punctuation = 'subtle',

    error = 'love',
    hint = 'iris',
    info = 'foam',
    warn = 'gold',
  },

  -- Change specific vim highlight groups
  -- https://github.com/rose-pine/neovim/wiki/Recipes
  highlight_groups = {
    ColorColumn = { bg = theme.none },

    -- Blend colours against the "base" background
    CursorLine = { bg = theme.cursor, blend = 10 },
    StatusLine = { fg = theme.foam, bg = theme.none, blend = 10 },
  }
})
function myt()
  vim.opt.termguicolors = true
  vim.cmd "colorscheme rose-pine"

  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  vim.cmd [[hi NvimTreeNormal guibg=NONE ctermbg=NONE]]
end

myt()
