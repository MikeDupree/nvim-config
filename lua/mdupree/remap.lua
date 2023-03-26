-- explorer
vim.keymap.set("n", "<Leader>e", "<cmd>NeoTreeShowToggle<CR>", { desc = "[e]xplore files" })

-- splits
vim.keymap.set("n", "<leader>-", "<C-W>s", { desc = "Split window below" })
vim.keymap.set("n", "<leader>|", "<C-W>v", { desc = "Split window right" })

-- telescope
local tele = require("telescope.builtin")
local custom_tele = require("mdupree.telescope")

vim.keymap.set("n", "<Leader>ff", tele.find_files, { desc = "[f]ind [f]iles" })
vim.keymap.set("n", "<Leader>fg", tele.live_grep, { desc = "[f]ind [g]rep" })
vim.keymap.set("n", "<Leader>fb", tele.buffers, { desc = "[f]ind [b]uffers" })
vim.keymap.set("n", "<Leader>fh", tele.help_tags, { desc = "[f]ind [h]elp" })
vim.keymap.set("n", "<Leader>fc", tele.colorscheme, { desc = "[f]ind [c]olorschemes" })
vim.keymap.set("n", "<Leader>fd", tele.diagnostics, { desc = "[f]ind [d]iagnostics" })
vim.keymap.set("n", "<Leader>fB", custom_tele.curr_buf, { desc = "[f]ind in current [B]uffer" })
vim.keymap.set("n", "<Leader>fG", custom_tele.live_grep_hidden, { desc = "[f]ind [G]rep hidden" })
vim.keymap.set("n", "<Leader>u", "<cmd>UndotreeToggle<CR>", { desc = "[u]ndotree toggle" })

-- Replace all occurrences of word
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- Move selected lines up / down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Switch between buffers
vim.keymap.set("n", "<S-l>", ":bnext<CR>")
vim.keymap.set("n", "<S-p>", ":bprevious<CR>")

-- Resize
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<cr>")
vim.keymap.set("n", "<C-Down>", "<cmd>resize -2<cr>")
vim.keymap.set("n", "<C-Up>", "<cmd>resize +2<cr>")
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<cr>")

-- center line when using pg movement
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Keep cursor in middle of screen when navigating search term
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- zen toggle
vim.keymap.set("n", "<Leader>z", "<cmd>ZenMode<CR>", { desc = "[z]en mode" })

-- source current buffer
vim.keymap.set("n", "<Leader><Leader>", "<cmd>source<CR>", { desc = "<leader>source current file" })

-- git
vim.keymap.set("n", "<Leader>gg", "<cmd>LazyGit<CR>", { desc = "[g]it lazy[g]it" })
vim.keymap.set("n", "<Leader>gb", "<cmd>Gitsigns toggle_current_line_blame<CR>", { desc = "[g]it toggle [b]lame" })
vim.keymap.set("n", "<Leader>gB", "<cmd>Gitsigns blame_line<CR>", { desc = "[g]it [B]lame current line" })

-- Format File
-- conflicts with workspace add
--vim.keymap.set("n", "<leader>w", vim.lsp.buf.format)

-- quickfix
vim.keymap.set("n", "[q", vim.cmd.cprevious, { desc = "previous quickfix" })
vim.keymap.set("n", "]q", vim.cmd.cnext, { desc = "next quickfix" })

-- Removals
-- Remove Ex mode keymap
vim.keymap.set("n", "Q", "<nop>")

-- Paste over text (replace text enters void buffer)
vim.keymap.set("x", "<leader>p", [["_dP]])
