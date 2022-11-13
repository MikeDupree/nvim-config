local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true }
keymap("", "<Space>", "<Nop>", opts);
vim.g.mapleader = " "
vim.g.maplocalleader = " "

--keymap('n', '<c-s>', ':w<CR>', {})
--keymap('i', '<c-s>', '<Esc>:w<CR>a', {})

-- Better window navigation
keymap('n', '<c-j>', '<c-w>j', opts)
keymap('n', '<c-h>', '<c-w>h', opts)
keymap('n', '<c-k>', '<c-w>k', opts)
keymap('n', '<c-l>', '<c-w>l', opts)

-- Explorer toggle
keymap("n", "<leader>e", ":Lex 30<cr>", opts)
