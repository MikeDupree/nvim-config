return {
  {
    "folke/zen-mode.nvim",
    config = function()
      require("zen-mode").setup({
        window = {
          width = .8,
          height = .9,
          options = {
            signcolumn = "no",
            number = false,
            relativenumber = false,
            colorcolumn = "",
          }
        },
        plugins = {
          gitsigns  = { enabled = true },
          tmux      = { enabled = true },
          alacritty = {
            enabled = true,
            font = "24",
          }
        },
      })
    end,
  },
  "folke/twilight.nvim",
}
