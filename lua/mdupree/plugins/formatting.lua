return {
  "stevearc/conform.nvim",
  opts = {
    format_on_save = {
      -- These options will be passed to conform.format()
      timeout_ms = 500,
      lsp_fallback = false,
    },
    formatters_by_ft = {
      lua = { "stylua" },
      javascript = { { "prettier" } },
      typescript = { { "prettier" } },
      typescriptreact = { { "prettier" } },
      php = { { "phpcbf" } },
      go = { { "gofmt" } },
    },
    -- Add root detection
    root_patterns = {
      ".git",
      "init.lua",
      "package.json",
    },
  },
}
