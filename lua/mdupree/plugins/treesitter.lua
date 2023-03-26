return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      "nvim-treesitter/nvim-treesitter-context",
    },
    build = function()
      pcall(require("nvim-treesitter.install").update({ with_sync = true }))
    end,
  },
}
