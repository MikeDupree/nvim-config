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
      astro = { { "prettierd", "prettier" } },
      javascript = { { "prettierd", "prettier" } },
      svelte = { { "prettierd", "prettier" } },
      typescript = { { "prettierd", "prettier" } },
      typescriptreact = { { "prettierd", "prettier" } },
      ocaml = { { "ocamlformat" } },
      ["ocaml.menhir"] = { { "ocamlformat" } },
      ["ocaml.interface"] = { { "ocamlformat" } },
      ["ocaml.ocamllex"] = { { "ocamlformat" } },
      reason = { { "ocamlformat" } },
      dune = { { "ocamlformat" } },
      php = { { "phpcbf" } },
      go = { { "gofmt" } },
    },
  },
}
