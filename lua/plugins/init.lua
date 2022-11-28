local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Plugins
-- <Insert your plugins here>
return require 'packer'.startup(function(use)
  use 'wbthomason/packer.nvim' --Manages Packer
  use "nvim-lua/popup.nvim"
  use "nvim-lua/plenary.nvim"
  use 'sainnhe/sonokai' --Color Scheme
  use 'RRethy/nvim-base16'

  use 'EdenEast/nightfox.nvim'

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- TreeSitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use "p00f/nvim-ts-rainbow"

  -- cmp plugins
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions

  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- LSP
  use "neovim/nvim-lspconfig" -- configuration for nvim lsp
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-nvim-lua"
  use "williamboman/mason.nvim" -- language server installer
  use "williamboman/mason-lspconfig.nvim"
  use "MunifTanjim/prettier.nvim"
  use({
    "glepnir/lspsaga.nvim",
    branch = "main",
    config = function()
      local saga = require("lspsaga")

      saga.init_lsp_saga({
        -- your configuration
        symbol_in_winbar = {
          in_custom = true
        }
      })
    end,
  })
  use "jose-elias-alvarez/nvim-lsp-ts-utils"
  -- Rust
  use "simrat39/rust-tools.nvim"
  -- Debugging
  use 'mfussenegger/nvim-dap'
  -- Telescope
  use { "nvim-telescope/telescope.nvim", tag = '0.1.0' }
  use 'nvim-telescope/telescope-media-files.nvim'
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  -- File Explore via nvim-tree
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }
  use "dinhhuy258/git.nvim"
  -- Display line indents
  use "lukas-reineke/indent-blankline.nvim"
  -- Auto add matching bracket
  use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end

end)
