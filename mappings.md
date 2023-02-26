# Key Mappings

```

-- LSP Definitions
vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
vim.keymap.set("n", "[d", function() vim.lsp.diagnostic.goto_next() end, opts)
vim.keymap.set("n", "]d", function() vim.lsp.diagnostic.goto_prev() end, opts)
vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_actions() end, opts)
vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)

-- Harpoon
keymap("n", "<leader>a", mark.add_file)
keymap("n", "<leader>he", ui.toggle_quick_menu)
keymap("n", "<leader>1", function() ui.nav_file(1) end)
keymap("n", "<leader>2", function() ui.nav_file(2) end)
keymap("n", "<leader>3", function() ui.nav_file(3) end)
keymap("n", "<leader>4", function() ui.nav_file(4) end)

-- General Custom Maps
-- Better window navigation
keymap('n', '<C-j>', '<C-w>j', opts)
keymap('n', '<C-h>', '<C-w>h', opts)
keymap('n', '<C-k>', '<C-w>k', opts)
keymap('n', '<C-l>', '<C-w>l', opts)

-- Move selected lines up / down
keymap2("v", "J", ":m '>+1<CR>gv=gv")
keymap2("v", "K", ":m '<-2<CR>gv=gv")

-- Keep cursor placement when appending line to eol
keymap2("n", "J", "mzJ`z")

-- Keep cursor in middle of screen when doing page movements
keymap2("n", "<C-d>", "<C-d>zz")
keymap2("n", "<C-u>", "<C-u>zz")
-- Keep cursor in middle of screen when navigating search term
keymap2("n", "n", "nzzzv")
keymap2("n", "N", "Nzzzv")

-- Copy to system clipboard
keymap2({"n", "v"}, "<leader>y", [["+y]])
keymap2("n", "<leader>Y", [["+Y]])

-- Remove Ex mode keymap
keymap2("n", "Q", "<nop>")

-- Paste over text (replace text enters void buffer)
keymap2("x", "<leader>p", [["_dP]])

-- TMUX open new session
keymap2("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- Format File
keymap2("n", "<leader>w", vim.lsp.buf.format)

-- Quickfix navigation
keymap2("n", "<C-k>", "<cmd>cnext<CR>zz")
keymap2("n", "<C-j>", "<cmd>cprev<CR>zz")
keymap2("n", "<leader>k", "<cmd>lnext<CR>zz")
keymap2("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Replace all occurrences of word
keymap2("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- adds executable permission to file
keymap2("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Window Resizing
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize +2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize -2<CR>", opts)

-- Explorer toggle
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)
--keymap("n", "<leader>e", ":Ex<cr>", opts)

-- Switch between buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-p>", ":bprevious<CR>", opts)

keymap("n", "<leader>ff",
  "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>",
  opts)
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", opts)

```
