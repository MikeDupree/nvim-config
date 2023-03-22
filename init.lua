--
-- Dupe NVIM Config
--
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("lazy").setup('plugins')


require('mappings')
require('settings')
require('mytelescope')
require('mytheme')
require('mappings')
require('treesitter')
require('completion')
require('myharpoon')
require('undootree')
require('myfugitive')
require('lsp')
require('lua_line')
require('explorer')
require('mytelescope')
require('mycomments')
