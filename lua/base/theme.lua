local tokyonight = { -- You can easily change to a different colorscheme.
  -- Change the name of the colorscheme plugin below, and then
  -- change the command in the config to whatever the name of that colorscheme is.
  --
  -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
  'folke/tokyonight.nvim',
  priority = 1000, -- Make sure to load this before all the other start plugins.
  config = function()
    ---@diagnostic disable-next-line: missing-fields
    require('tokyonight').setup {
      styles = {
        comments = { italic = false }, -- Disable italics in comments
      },
    }

    -- Load the colorscheme here.
    -- Like many other themes, this one has different styles, and you could load
    -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
    vim.cmd.colorscheme 'tokyonight-moon'
  end,
}

local sonokai = {
  'sainnhe/sonokai',
  lazy = false,
  priority = 1000,
  config = function()
    vim.g.sonokai_enable_italic = true
    vim.g.sonokai_style = 'andromeda'
    vim.g.sonokai_better_performance = 1
    vim.g.sonokai_transparent_background = true
    vim.g.sonokai_cursor = 'purple'
    vim.g.sonokai_dim_inactive_windows = true
    vim.g.sonokai_diagnostic_line_highlight = true
    vim.g.sonokai_diagnostic_virtual_text = 'colored'
    --     Available values:   `'grey'`, `'colored'`, `'highlighted'`
    vim.cmd.colorscheme 'sonokai'
    require('lualine').setup {
      options = {
        theme = 'sonokai',
      },
    }
  end,
}

return sonokai
