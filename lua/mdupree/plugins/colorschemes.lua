return {
  -- {
  --   "folke/tokyonight.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   opts = {},
  --   config = function()
  --     -- local colorscheme = "tokyonight-night"
  --     local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
  --     if not status_ok then
  --       vim.notify("colorscheme " .. colorscheme .. " not installed!")
  --       return
  --     end
  --     vim.opt.termguicolors = true
  --
  --     require("tokyonight").setup({
  --       style = "storm",
  --       transparent = true,
  --       terminal_colors = true,
  --     })
  --   end,
  -- },
  -- --
  {
    "olimorris/onedarkpro.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      vim.opt.termguicolors = true

      require("onedarkpro").setup({
        colors = {
          bg = "#0D1B1E",
          comment = "#7D98A1",
        },
      })
    end,
  },
  {
    "projekt0n/github-nvim-theme",
    name = "github-theme",
    lazy = false,  -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require("github-theme").setup({
        -- ...
      })

      local colorscheme = "github_dark_dimmed"
      local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
      if not status_ok then
        vim.notify("colorscheme " .. colorscheme .. " not installed!")
        return
      end
    end,
  },
}
