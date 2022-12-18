local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true }
keymap("", "<Space>", "<Nop>", opts);
vim.g.mapleader = " "
vim.g.maplocalleader = " "

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
--keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)
keymap("n", "<leader>e", ":Ex<cr>", opts)

-- Switch between buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-p>", ":bprevious<CR>", opts)

keymap("n", "<leader>ff",
  "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>",
  opts)
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", opts)
