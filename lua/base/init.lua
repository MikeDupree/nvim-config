local base_plugins = {
  -- Base Plugins
  -- Comment lines to disable plugins
  require 'base.plugins.autocomplete',
  require 'base.plugins.autoformat',
  -- require 'base.plugins.autopairs',
  require 'base.plugins.autotags',
  require 'base.plugins.syntax_highlight',
  require 'base.plugins.lsp',
  require 'base.plugins.lsp_plugins',
  require 'base.plugins.fuzzy_finder',
  require 'base.plugins.neo-tree',
  require 'base.plugins.which_key',
  -- require 'base.plugins.gitsigns_basic',
  require 'base.plugins.gitsigns',
  require 'base.plugins.vim-sleuth',
  require 'base.plugins.todo-comments',
  require 'base.plugins.copy_paste',

  -- Theme Config
  --
  require 'base.theme',
}

return base_plugins
