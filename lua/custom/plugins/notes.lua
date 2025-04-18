return {
  {
    'mikedupree/nvim-notes',
    config = function()
      require('nvim-notes').setup {
        notes_dir = '~/notes', -- optional, default is ~/.nvim-notes
      }

      vim.keymap.set('n', '<leader>nn', '<cmd>NewNote<CR>', { desc = '[N]ew [N]ote' })
      vim.keymap.set('n', '<leader>ns', '<cmd>SearchNotes<CR>', { desc = '[N]otes [S]earch' })
      vim.keymap.set('n', '<leader>ne', '<cmd>ViewNotes<CR>', { desc = '[N]otes [E]xplorer' })
      vim.keymap.set('n', '<leader>nx', '<cmd>CloseNotes<CR>', { desc = '[N]otes E[x]it' })
    end,
  },
}
