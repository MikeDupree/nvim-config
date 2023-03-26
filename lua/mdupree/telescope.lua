local telescope = require("telescope")

telescope.setup {
  defaults = {
  },
  pickers = {
    find_files = {
      find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
    },
  },
}

telescope.load_extension('fzf')

local mappings = {}

mappings.curr_buf = function()
  local opt = require('telescope.themes').get_dropdown({ winblend = 10 })
  require('telescope.builtin').current_buffer_fuzzy_find(opt)
end

mappings.live_grep_hidden = function()
  require('telescope.builtin').live_grep({ additional_args = { "--no-ignore", "--hidden" } })
end

return mappings
