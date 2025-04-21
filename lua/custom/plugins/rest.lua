-- User Command  Behavior
-- :Rest open Open result pane
-- :Rest run	Run request under the cursor
-- :Rest run {name}	Run request with name {name}
-- :Rest last	Run last request
-- :Rest logs	Edit logs file
-- :Rest cookies	Edit cookies file
-- :Rest env show	Show dotenv file registered to current .http file
-- :Rest env select	Select & register .env file with vim.ui.select()
-- :Rest env set {path}	Register .env file to current .http file

-- In order for this to not error on load you need to install
--   some missing dependencies:
-- Install lua rocks: brew install luarocks
-- Install xml2lua: luarocks install xml2lua
return {
  'rest-nvim/rest.nvim',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      table.insert(opts.ensure_installed, 'http')
    end,
  },
}
