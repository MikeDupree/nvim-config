return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons', 'SmiteshP/nvim-navic', 'neovim/nvim-lspconfig' },
  config = function()
    require 'custom.config.status_line'
  end,
}
