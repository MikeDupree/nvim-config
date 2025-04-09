-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- save file
vim.keymap.set('n', '<C-s>', '<cmd>w<cr><esc>', { desc = 'Save file' })

-- quit
vim.keymap.set('n', '<leader>qq', '<cmd>qa<cr>', { desc = 'Quit all' })

-- copy to clipboard
vim.keymap.set('n', '<leader>y', '+y', { desc = 'Copy to clipboard' })
-- paste from clipboard
vim.keymap.set('n', '<leader>p', '+p', { desc = 'Past from clipboard' })

-- explorer
vim.keymap.set('n', '<Leader>e', '<cmd>Neotree toggle<CR>', { desc = '[e]xplore files' })

-- splits
vim.keymap.set('n', '<leader>-', '<C-W>s', { desc = 'Split window below' })
vim.keymap.set('n', '<leader>|', '<C-W>v', { desc = 'Split window right' })

-- Move selected lines up / down
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- Switch between buffers
vim.keymap.set('n', '<S-l>', ':bnext<CR>')
vim.keymap.set('n', '<S-p>', ':bprevious<CR>')

-- indent selected text
vim.keymap.set('v', '<', '<gv', { desc = 'Indent selected text left' })
vim.keymap.set('v', '>', '>gv', { desc = 'Indent selected text right' })

-- center line when using pg movement
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

-- Keep cursor in middle of screen when navigating search term
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- Git (TODO move to git plugin)
vim.keymap.set('n', '<Leader>gb', '<cmd>Gitsigns toggle_current_line_blame<CR>', { desc = '[g]it toggle [b]lame' })
vim.keymap.set('n', '<Leader>gB', '<cmd>Gitsigns blame_line<CR>', { desc = '[g]it [B]lame current line' })

-- terminal
vim.keymap.set('n', '<S-t>', '<cmd>ToggleTerm<CR>')
vim.keymap.set('t', '<S-t>', '<cmd>ToggleTerm<CR>')

-- Removals
-- Remove Ex mode keymap
vim.keymap.set('n', 'Q', '<nop>')

-- Paste over text (replace text enters void buffer)
vim.keymap.set('x', '<leader>p', [["_dP]])

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- File explorer toggle
vim.keymap.set('n', '<leader>e', '<Cmd>Neotree toggle<CR>')

-- NOTE: Some terminals have coliding keymaps or are not able to send distinct keycodes
-- vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
-- vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
-- vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
-- vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })
