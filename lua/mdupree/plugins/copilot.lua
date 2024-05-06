return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        panel = {
          -- disable this for cmp to work
          enabled = true,
          auto_refresh = true,
          keymap = {
            open = "<M-o>",
            accept = "<M-CR>",
            jump_next = "<C-n>",
          },
        },
        suggestion = {
          -- disable this for cmp to work
          enabled = true,
          auto_trigger = true,
          keymap = {
            accept_word = "<C-w>",
            accept_line = "<C-l>",
            accept = "<C-k>",
          },
        },
        filetypes = {
          markdown = true,
        },
      })
    end,
  },
  {
    "zbirenbaum/copilot-cmp",
    after = { "copilot.lua" },
    config = function()
      require("copilot_cmp").setup()
    end,
  },
}
