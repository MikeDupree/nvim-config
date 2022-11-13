
require('plugins')
require('settings')
--require('mappings')
require('colors')
require('treesitter')
require('completion')

vim.cmd "colorscheme sonokai"

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true }
keymap("", "<Space>", "<Nop>", opts);
vim.g.mapleader = " "
vim.g.maplocalleader = " "

--keymap('n', '<c-s>', ':w<CR>', {})
--keymap('i', '<c-s>', '<Esc>:w<CR>a', {})

-- Better window navigation
keymap('n', '<C-j>', '<C-w>j', opts)
keymap('n', '<C-h>', '<C-w>h', opts)
keymap('n', '<C-k>', '<C-w>k', opts)
keymap('n', '<C-l>', '<C-w>l', opts)

-- Window Resizing
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize +2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize -2<CR>", opts)

-- Explorer toggle
keymap("n", "<leader>e", ":Lex 30<cr>", opts)

-- Switch between buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-p>", ":bprevious<CR>", opts)

-- Indenting
-- Visual Mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

