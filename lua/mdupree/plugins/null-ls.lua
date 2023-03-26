return {
  "jay-babu/mason-null-ls.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "williamboman/mason.nvim",
    "jose-elias-alvarez/null-ls.nvim",
  },
  config = function()
    require("mason").setup()
    require("mason-null-ls").setup({
      ensure_installed = { "stylua", "prettier" },
      automatic_setup = true,
    })

    require("null-ls").setup({})

    require("mason-null-ls").setup_handlers({})
  end,
}
