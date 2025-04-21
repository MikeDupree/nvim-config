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
