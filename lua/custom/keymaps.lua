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
