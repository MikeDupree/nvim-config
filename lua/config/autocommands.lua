-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

--
-- Close floating windows on 'LazyDone'
-- When Lazy opens on neovim load (to install plugins)
-- It's leaving behind a blank float window.
-- This fixes that issue be closing any open float windows on Lazy exit.
--
vim.api.nvim_create_autocmd('User', {
  pattern = 'LazyDone',
  callback = function()
    for _, win in ipairs(vim.api.nvim_list_wins()) do
      local config = vim.api.nvim_win_get_config(win)
      if config.relative ~= '' then
        vim.api.nvim_win_close(win, true)
      end
    end
  end,
})
