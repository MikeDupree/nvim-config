local base_plugins = {
    require 'base.plugins.autocomplete',
    require 'base.plugins.autoformat',
    require 'base.plugins.syntax_highlight',
    require 'base.plugins.lsp',
    require 'base.plugins.lsp_plugins',
    require 'base.plugins.fuzzy_finder',
    require 'base.plugins.neo-tree',
    require 'base.plugins.which_key',
    require 'base.plugins.gitsigns_basic',
    require 'base.plugins.vim-sleuth',
    require 'base.plugins.todo-comments',


-- Theme Config
require 'base.theme'
}


return base_plugins
