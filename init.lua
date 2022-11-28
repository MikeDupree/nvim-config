--
-- Dupe NVIM Config
--
require('plugins')
require('settings')
require('mappings')
require('colors')
require('treesitter')
require('completion')
require('lsp-config')
require('lsp-saga-config')
require('rust-tools-config')
require('file-explorer')
require('telescope')
require('indent-config')
require('git-config')
require('lualine-config')
-- Syntax highlighting JS/TS
require('lspconfig/quick_lint_js').setup {}

