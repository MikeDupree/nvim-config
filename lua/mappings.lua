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
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)

-- Switch between buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-p>", ":bprevious<CR>", opts)

-- Indenting
-- Visual Mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- keymap("n", "<leader>f", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<leader>ff",
  "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>",
  opts)
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", opts)
-- Nvimtree
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)

-- Formatting
keymap("n", "<leader>w", ":lua vim.lsp.buf.format()<CR> :FormatWrite <CR>", opts)

-- Typescript
keymap("n", "<leader>gs", ":TypescriptGoToSourceDefinition", opts)
keymap("n", "<leader>ai", ":TypescriptAddMissingImports", opts)
keymap("n", "<leader>rn", ":TypescriptRenameFile", opts)
keymap("n", "<leader>fa", ":TypescriptFixAll", opts)
keymap("n", "<leader>toi", ":TypescriptOrganizeImports", opts)
