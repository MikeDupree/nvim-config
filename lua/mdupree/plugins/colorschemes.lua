return {
  {
    "sainnhe/everforest",
    config = function()
      local colorscheme = "everforest"
      local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
      if not status_ok then
        vim.notify("colorscheme " .. colorscheme .. " not installed!")
        return
      end
      vim.opt.termguicolors = true
    end,
  },
}
